module Bicubic (CLK, RST, V0, H0, SW, SH, TW, TH, DONE);
input CLK;
input RST;
input [6:0] V0;
input [6:0] H0;
input [4:0] SW;
input [4:0] SH;
input [5:0] TW;
input [5:0] TH;
output reg DONE;

integer i;
reg [2:0] cs, ns;
reg [3:0] cnt;
reg [1:0] mode;
reg [7:0] fifo1 [0:3];
reg [7:0] fifo2 [0:3];
reg [7:0] result;
reg [7:0] alu_pn1, alu_p0, alu_p1, alu_p2;
reg [15:0] alu_x;
wire [7:0] Px;
reg [13:0] rom_a;
reg rom_cen;
wire [7:0] rom_q;
reg [13:0] sram_a;
reg sram_wen;
wire [7:0] sram_q;
reg [5:0] Target_X, Target_Y;
wire is_last_X = (Target_X == TW - 6'd1);
wire is_last_Y = (Target_Y == TH - 6'd1);
wire [27:0] map_x = ((Target_X * (SW - 1) << 16) + ((TW - 1) >> 1)) / (TW - 1);
wire [27:0] map_y = ((Target_Y * (SH - 1) << 16) + ((TH - 1) >> 1)) / (TH - 1);
wire [5:0] int_x = map_x[21:16];
wire [5:0] int_y = map_y[21:16];
wire [15:0] frac_x = map_x[15:0];
wire [15:0] frac_y = map_y[15:0];
wire [6:0] base_x = H0 + {1'b0, int_x};
wire [6:0] base_y = V0 + {1'b0, int_y};
reg [6:0] cur_x, cur_y;

localparam IDLE = 3'd0;
localparam DECIDE = 3'd1;
localparam REQ = 3'd2;
localparam RECEIVE = 3'd3;
localparam CALC = 3'd4;
localparam RESULT = 3'd5;
localparam WRITE = 3'd6;
localparam FINISH = 3'd7;

ImgROM u_ImgROM (.Q(rom_q), .CLK(CLK), .CEN(rom_cen), .A(rom_a));
ResultSRAM u_ResultSRAM (.Q(sram_q), .CLK(CLK), .CEN(1'd0), .WEN(sram_wen), .A(sram_a), .D(result));
ALU u_ALU (.Pn1(alu_pn1), .P0(alu_p0), .P1(alu_p1), .P2(alu_p2), .x(alu_x), .Px(Px));


always @(*) begin
    sram_a = (Target_Y * TW) + Target_X;
    rom_a = cur_y * 7'd100 + cur_x;
    if (cs == WRITE) begin
        sram_wen = 1'd0;
    end
    else begin
        sram_wen = 1'd1;
    end
end

always @(*) begin
    case (mode)
        2'd0: begin
            cur_x = base_x;
            cur_y = base_y;
        end
        
        2'd1: begin
            cur_x = base_x + {5'd0, cnt[1:0]} - 7'd1;
            cur_y = base_y;
        end
        
        2'd2: begin
            cur_x = base_x;
            cur_y = base_y + {5'd0, cnt[1:0]} - 7'd1;
        end
        
        2'd3: begin
            cur_x = base_x + {5'd0, cnt[1:0]} - 7'd1;
            cur_y = base_y + {5'd0, cnt[3:2]} - 7'd1;
        end
        
        default: begin
            cur_x = base_x;
            cur_y = base_y;
        end
    endcase
end

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        Target_X <= 6'd0;
        Target_Y <= 6'd0;
    end
    else if (cs == IDLE) begin
        Target_X <= 6'd0;
        Target_Y <= 6'd0;
    end
    else if (cs == WRITE) begin
        if (is_last_X) begin
            Target_X <= 6'd0;
            if (!is_last_Y) begin
                Target_Y <= Target_Y + 6'd1;
            end
        end
        else begin
            Target_X <= Target_X + 6'd1;
        end
    end
end

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        for (i=0; i<=3; i=i+1) begin
            fifo1[i] <= 8'd0;
            fifo2[i] <= 8'd0;
        end
    end
    else if (cs == RECEIVE) begin
        fifo1[3] <= rom_q;
        for (i=0; i<=2; i=i+1) begin
            fifo1[i] <= fifo1[i+1];
        end
    end
    else if (cs == CALC) begin
        fifo2[3] <= Px;
        for (i=0; i<=2; i=i+1) begin
            fifo2[i] <= fifo2[i+1];
        end
    end
end

always @(*) begin
    if (cs == CALC) begin
        alu_pn1 = fifo1[0];
        alu_p0 = fifo1[1];
        alu_p1 = fifo1[2];
        alu_p2 = fifo1[3];
    end
    else if (cs == RESULT || cs == WRITE) begin
        if (mode == 2'd3) begin
            alu_pn1 = fifo2[0];
            alu_p0 = fifo2[1];
            alu_p1 = fifo2[2];
            alu_p2 = fifo2[3];
        end
        else begin
            alu_pn1 = fifo1[0];
            alu_p0 = fifo1[1];
            alu_p1 = fifo1[2];
            alu_p2 = fifo1[3];
        end
    end
    else begin
        alu_pn1 = 7'd0;
        alu_p0 = 7'd0;
        alu_p1 = 7'd0;
        alu_p2 = 7'd0;
    end
end

always @(*) begin
    if (mode == 2'd2) begin
        alu_x = frac_y; 
    end
    else if (mode == 2'd3 && (cs == RESULT || cs == WRITE)) begin
        alu_x = frac_y; 
    end
    else begin
        alu_x = frac_x; 
    end
end

always @(*) begin
    if (cs == REQ) begin
        rom_cen = 1'd0;
    end
    else begin
        rom_cen = 1'd1;
    end
end

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        cs <= IDLE;
    end
    else begin
        cs <= ns;
    end
end

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        cnt <= 4'd0;
        mode <= 2'd0;
        DONE <= 1'd0;
    end
    else begin
        case (cs)
            IDLE: begin
                DONE <= 1'd0;
            end

            DECIDE: begin
                cnt <= 4'd0;
                if (frac_x == 10'd0 && frac_y == 10'd0) begin
                    mode <= 2'd0;
                end
                else if (frac_y == 10'd0) begin
                    mode <= 2'd1;
                end
                else if (frac_x == 10'd0) begin
                    mode <= 2'd2;
                end
                else begin
                    mode <= 2'd3;
                end
            end

            REQ: begin
                
            end

            RECEIVE: begin
                cnt <= cnt + 4'd1;
                if (mode == 2'd0) begin
                    result <= rom_q;
                end
            end

            CALC: begin

            end

            RESULT: begin
                result <= Px;
            end

            WRITE: begin

            end

            FINISH: begin
                DONE <= 1'd1;
            end
        endcase
    end
end

always @(*) begin
    case (cs)
        IDLE: begin
            ns = DECIDE;
        end

        DECIDE: begin
            ns = REQ;
        end

        REQ: begin
            ns = RECEIVE;
        end

        RECEIVE: begin
            if (mode == 2'd0) begin
                ns = WRITE;
            end
            else begin
                if (cnt[1:0] == 2'd3) begin
                    if (mode == 2'd1 || mode == 2'd2) begin
                        ns = RESULT;
                    end
                    else begin
                        ns = CALC;
                    end
                end
                else begin
                    ns = REQ;
                end
            end
        end

        CALC: begin
            if (cnt == 4'd0) begin
                ns = RESULT;
            end
            else begin
                ns = REQ;
            end
        end

        RESULT: begin
            ns = WRITE;
        end

        WRITE: begin
            if (is_last_X && is_last_Y) begin
                ns = FINISH;
            end
            else begin
                ns = DECIDE;
            end
        end

        FINISH: begin
            ns = IDLE;
        end
    endcase
end

endmodule


module ALU (Pn1, P0, P1, P2, x, Px);
input [7:0] Pn1, P0, P1, P2;
input [15:0] x; 
output [7:0] Px;

wire [15:0] x2 = (({16'd0, x} * x) + 32'd32768) >> 16;
wire [15:0] x3 = (({16'd0, x2} * x) + 32'd32768) >> 16;

wire signed [8:0] s_Pn1 = $signed({1'b0, Pn1});
wire signed [8:0] s_P0  = $signed({1'b0, P0});
wire signed [8:0] s_P1  = $signed({1'b0, P1});
wire signed [8:0] s_P2  = $signed({1'b0, P2});

wire signed [11:0] a_2 = -s_Pn1 + 3*s_P0 - 3*s_P1 + s_P2;
wire signed [11:0] b_2 = 2*s_Pn1 - 5*s_P0 + 4*s_P1 - s_P2;
wire signed [11:0] c_2 = -s_Pn1 + s_P1;
wire signed [11:0] d_2 = 2*s_P0;

wire signed [28:0] term_a = a_2 * $signed({1'b0, x3});
wire signed [28:0] term_b = b_2 * $signed({1'b0, x2});
wire signed [28:0] term_c = c_2 * $signed({1'b0, x});
wire signed [28:0] term_d = d_2 <<< 16; 

wire signed [29:0] sum = term_a + term_b + term_c + term_d;
wire signed [29:0] sum_rnd = sum + 30'sd65536; 
wire signed [29:0] P_result = sum_rnd >>> 17;

assign Px = (P_result < 30'sd0) ? 8'd0 :
            (P_result > 30'sd255) ? 8'd255 :
            P_result[7:0];

endmodule
