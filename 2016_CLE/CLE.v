`timescale 1ns/10ps
module CLE (clk, reset, rom_q, rom_a, sram_q, sram_a, sram_d, sram_wen, finish);
input         clk;
input         reset;
input  [7:0]  rom_q;
output [6:0]  rom_a;
input  [7:0]  sram_q;
output [9:0]  sram_a;
output [7:0]  sram_d;
output        sram_wen;
output        finish;

integer i;
reg [9:0] sram_a;
reg [7:0] sram_d;
reg sram_wen;
reg [2:0] cs, ns;
reg [4:0] X, Y;
reg [3:0] new_label;
reg [3:0] fifo [0:32];
reg [15:0] eq_table [0:15];
reg finish;
reg [0:7] img;
reg [6:0] rom_a_buffer; 
reg [6:0] rom_a;
reg [3:0] gold_label;
reg [3:0] top_left, top, top_right, left;
reg [1:0] eq;
reg check_eq;
reg update;
reg [3:0] buffer;

localparam WAIT = 3'd0;
localparam SCAN = 3'd1;
localparam MERGE = 3'd2;
localparam FINISH = 3'd3;
localparam WAIT_2 = 3'd4;
localparam RESCAN = 3'd5;
localparam WAIT_3 = 3'd6;
localparam RELABEL = 3'd7;

always @(negedge clk) begin
    if (reset) begin
        sram_a <= 10'd0;
        sram_d <= 8'd0;
        sram_wen <= 1'b1;
        rom_a <= 7'd0;
    end else begin
        sram_a <= {X, Y}; 
        sram_d <= gold_label;       
        sram_wen <= (cs == SCAN || cs == RELABEL) ? 1'b0 : 1'b1;
        rom_a <= rom_a_buffer;
    end
end

always @(*) begin
    top_left = fifo[32];
    top = fifo[31];
    top_right = fifo[30];
    left = fifo[0];
    if (img[Y[2:0]]) begin
        if (cs == SCAN) begin
            if (top_left == 4'd0 && top == 4'd0 && top_right == 4'd0 && left == 4'd0) begin
                update = 1'd1;
                gold_label = new_label;
                check_eq = 1'd0;
                eq = 2'd0;
            end
            else begin
                update = 1'd0;
                if (top_left != 4'd0)
                    gold_label = top_left;
                else if (top != 4'd0)
                    gold_label = top;
                else if (top_right != 4'd0)
                    gold_label = top_right;
                else if (left != 4'd0)
                    gold_label = left;
                else
                    gold_label = new_label;
                if (top_left != 4'd0 && top_right != 4'd0 && top_left != top_right) begin
                    eq = 2'd1;
                    check_eq = 1'd1;
                end
                else if (left != 4'd0 && top != 4'd0 && left != top) begin
                    eq = 2'd2;
                    check_eq = 1'd1;
                end
                else if (left != 4'd0 && top_right != 4'd0 && left != top_right) begin
                    eq = 2'd3;
                    check_eq = 1'd1;
                end
                else begin
                    eq = 2'd0;
                    check_eq = 1'd0;
                end
            end
        end
        else begin
            update = 1'd0;
            check_eq = 1'd0;
            eq = 2'd0;
            if (eq_table[buffer][0]) gold_label = 4'd0;
            else if (eq_table[buffer][1]) gold_label = 4'd1;
            else if (eq_table[buffer][2]) gold_label = 4'd2;
            else if (eq_table[buffer][3]) gold_label = 4'd3;
            else if (eq_table[buffer][4]) gold_label = 4'd4;
            else if (eq_table[buffer][5]) gold_label = 4'd5;
            else if (eq_table[buffer][6]) gold_label = 4'd6;
            else if (eq_table[buffer][7]) gold_label = 4'd7;
            else if (eq_table[buffer][8]) gold_label = 4'd8;
            else if (eq_table[buffer][9]) gold_label = 4'd9;
            else if (eq_table[buffer][10]) gold_label = 4'd10;
            else if (eq_table[buffer][11]) gold_label = 4'd11;
            else if (eq_table[buffer][12]) gold_label = 4'd12;
            else if (eq_table[buffer][13]) gold_label = 4'd13;
            else if (eq_table[buffer][14]) gold_label = 4'd14;
            else if (eq_table[buffer][15]) gold_label = 4'd15;
            else gold_label = buffer;
        end
    end
    else begin
        update = 1'b0;
        gold_label = 4'd0;
        check_eq = 1'b0;
        eq = 2'd0;
    end
end

always @(posedge clk) begin
    if (reset)
        cs <= WAIT;
    else
        cs <= ns;
end

always @(posedge clk) begin
    if (reset) begin
        X <= 5'd0;
        Y <= 5'd0;
        rom_a_buffer <= 7'd0;
        new_label <= 4'd1;
        for (i=0; i<=15; i=i+1) begin
            eq_table[i] <= 16'd0;
        end
        img <= 8'd0;
        finish <= 1'd0;
    end
    else begin
        case (cs)
            WAIT: begin
                img <= rom_q;
                rom_a_buffer <= rom_a_buffer + 1;
            end

            SCAN: begin
                Y <= Y + 5'd1;
                if (Y == 5'd31) begin
                    X <= X + 5'd1;
                end
                else begin
                    X <= X;
                end

                if (Y[2:0] == 3'd7) begin
                    rom_a_buffer <= rom_a_buffer + 7'd1;
                    img <= rom_q;
                end
                else begin
                    rom_a_buffer <= rom_a_buffer;
                end

                if (update) begin
                    new_label <= new_label + 4'd1;
                end

                if (check_eq) begin
                    case (eq)
                        2'd1: begin
                            eq_table[top_left][top_right] <= 1'd1;
                            eq_table[top_right][top_left] <= 1'd1;
                        end
                        2'd2: begin
                            eq_table[left][top] <= 1'd1;
                            eq_table[top][left] <= 1'd1;
                        end
                        2'd3: begin
                            eq_table[left][top_right] <= 1'd1;
                            eq_table[top_right][left] <= 1'd1;
                        end
                    endcase
                end
            end

            MERGE: begin
                Y <= Y + 1;
                for (i=1; i<=15; i=i+1) begin
                    eq_table[i] <= eq_table[i][Y[3:0]] ? (eq_table[i] | eq_table[Y[3:0]]) : eq_table[i];
                end
            end

            FINISH: begin
                X <= 5'd0;
                Y <= 5'd0;
                rom_a_buffer <= 7'd0;
                new_label <= 4'd0;
            end

            WAIT_2: begin
                img <= rom_q;
                rom_a_buffer <= rom_a_buffer + 1;                
            end

            RESCAN: begin
                if (!img[Y[2:0]]) begin
                    Y <= Y + 5'd1;
                    if (Y == 5'd31) begin
                        X <= X + 5'd1;
                    end
                    else begin
                        X <= X;
                    end

                    if (Y[2:0] == 3'd7) begin
                        rom_a_buffer <= rom_a_buffer + 7'd1;
                        img <= rom_q;
                    end
                    else begin
                        rom_a_buffer <= rom_a_buffer;
                    end

                    if (X == 5'd31 && Y == 5'd31) begin
                        finish <= 1'd1;
                    end
                    else begin
                        finish <= 1'd0;
                    end
                end
            end

            WAIT_3: begin
                buffer <= sram_q[3:0];
            end

            RELABEL: begin
                Y <= Y + 5'd1;
                if (Y == 5'd31) begin
                    X <= X + 5'd1;
                end
                else begin
                    X <= X;
                end

                if (Y[2:0] == 3'd7) begin
                    rom_a_buffer <= rom_a_buffer + 7'd1;
                    img <= rom_q;
                end
                else begin
                    rom_a_buffer <= rom_a_buffer;
                end
            end
        endcase
    end
end

always @(*) begin
    case (cs)
        WAIT: begin
            ns = SCAN;
        end

        SCAN: begin
            if (X == 5'd31 && Y == 5'd31) begin
                ns = MERGE;
            end
            else begin
                ns = SCAN;
            end
        end

        MERGE: begin
            if (Y[3:0] == 4'd15)
                ns = FINISH;
            else
                ns = MERGE;
        end

        FINISH: begin
            ns = WAIT_2;
        end

        WAIT_2: begin
            ns = RESCAN;
        end

        RESCAN: begin
            if (img[Y[2:0]])
                ns = WAIT_3;
            else if (X == 5'd31 && Y == 5'd31)
                ns = WAIT;
            else 
                ns = RESCAN;
        end

        WAIT_3: begin
            ns = RELABEL;
        end

        RELABEL: begin
            ns = RESCAN;
        end

        default: begin
            ns = WAIT;
        end
    endcase
end

always @(posedge clk) begin
    if (reset) begin
        for (i=0; i<=32; i=i+1) begin
            fifo[i] <= 4'd0;
        end
    end
    else if (cs == SCAN) begin
        fifo[0] <= gold_label;
        for (i=0; i<=31; i=i+1) begin
            fifo[i+1] <= fifo[i];
        end
    end
end


endmodule
