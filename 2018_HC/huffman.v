module huffman (clk, reset, gray_valid, gray_data, CNT_valid, CNT1, CNT2, CNT3, CNT4, CNT5, CNT6,
code_valid, HC1, HC2, HC3, HC4, HC5, HC6, M1, M2, M3, M4, M5, M6);
input clk;
input reset;
input gray_valid;
input [7:0] gray_data;
output reg CNT_valid;
output [7:0] CNT1, CNT2, CNT3, CNT4, CNT5, CNT6;
output reg code_valid;
output [7:0] HC1, HC2, HC3, HC4, HC5, HC6;
output [7:0] M1, M2, M3, M4, M5, M6;

localparam IDLE = 3'd0;
localparam READ = 3'd1;
localparam OUTPUT_CNT = 3'd2;
localparam SORT_EVEN = 3'd3;
localparam SORT_ODD = 3'd4;
localparam MERGE = 3'd5;
localparam FINISH = 3'd6;

integer i;
reg [6:0] counter;
reg [7:0] HC [1:6], M [1:6], M_next [1:6];
reg [2:0] cs, ns;
reg [2:0] total_groups;
reg [7:0] group_count [1:6];
reg [6:1] group_member [1:6];

always @(*) begin
    M_next[1] = {M[1][6:0], 1'b1};
    M_next[2] = {M[2][6:0], 1'b1};
    M_next[3] = {M[3][6:0], 1'b1};
    M_next[4] = {M[4][6:0], 1'b1};
    M_next[5] = {M[5][6:0], 1'b1};
    M_next[6] = {M[6][6:0], 1'b1};
end

always @(posedge clk or posedge reset) begin
    if (reset)
        cs <= IDLE;
    else
        cs <= ns;
end

always @(*) begin
    ns = cs;
    case (cs)
        IDLE: begin
            ns = READ;
        end

        READ: begin
            if (counter == 7'd100) begin
                ns = OUTPUT_CNT;
            end
        end

        OUTPUT_CNT: begin
            ns = SORT_EVEN;
        end

        SORT_EVEN: begin
            ns = SORT_ODD;
        end

        SORT_ODD: begin
            if ((group_count[2] >= group_count[3]) && (group_count[4] >= group_count[5])) begin
                ns = MERGE;
            end 
            else begin
                ns = SORT_EVEN;
            end
        end

        MERGE: begin
            if (total_groups == 4'd2) begin
                ns = FINISH;
            end
            else begin
                ns = SORT_EVEN;
            end
        end

        FINISH: begin
        
        end
    endcase
end

always @(posedge clk or posedge reset) begin
    CNT_valid <= 0;
    code_valid <= 0;
    case (cs)
        IDLE: begin 
            total_groups <= 3'd6;
            for (i=1; i<=6; i=i+1) begin
                group_count[i] <= 8'd0;
                HC[i] <= 8'd0;
                M[i] <= 8'd0;
            end
            group_member[1] <= 6'b000001;
		    group_member[2] <= 6'b000010;
		    group_member[3] <= 6'b000100;
		    group_member[4] <= 6'b001000;
		    group_member[5] <= 6'b010000;
		    group_member[6] <= 6'b100000;
            counter <= 7'd0;
        end

        READ: begin 
            if (gray_valid) begin
                case (gray_data)
                    8'h01: group_count[1] <= group_count[1] + 8'd1;
                    8'h02: group_count[2] <= group_count[2] + 8'd1;
                    8'h03: group_count[3] <= group_count[3] + 8'd1;
                    8'h04: group_count[4] <= group_count[4] + 8'd1;
                    8'h05: group_count[5] <= group_count[5] + 8'd1;
                    8'h06: group_count[6] <= group_count[6] + 8'd1;
                endcase
            end
            counter <= counter + 7'd1;
        end

        OUTPUT_CNT: begin 
            CNT_valid <= 1'd1;
        end

        SORT_EVEN: begin 
            if (group_count[1] < group_count[2]) begin
                group_count[1] <= group_count[2];
                group_count[2] <= group_count[1];
                group_member[1] <= group_member[2];
                group_member[2] <= group_member[1];
            end
            if (group_count[3] < group_count[4]) begin
                group_count[3] <= group_count[4];
                group_count[4] <= group_count[3];
                group_member[3] <= group_member[4];
                group_member[4] <= group_member[3];
            end
            if (group_count[5] < group_count[6]) begin
                group_count[5] <= group_count[6];
                group_count[6] <= group_count[5];
                group_member[5] <= group_member[6];
                group_member[6] <= group_member[5];
            end
        end

        SORT_ODD: begin 
            if (group_count[2] < group_count[3]) begin
                group_count[2] <= group_count[3];
                group_count[3] <= group_count[2];
                group_member[2] <= group_member[3];
                group_member[3] <= group_member[2];
            end
            if (group_count[4] < group_count[5]) begin
                group_count[4] <= group_count[5];
                group_count[5] <= group_count[4];
                group_member[4] <= group_member[5];
                group_member[5] <= group_member[4];
            end
        end

        MERGE: begin 
            for (i=1; i<=6; i=i+1) begin
                if (group_member[total_groups][i]) begin
                    HC[i] <= HC[i] | (M[i] ^ M_next[i]);
                    M[i] <= M_next[i];
                end
                if (group_member[total_groups - 1][i]) begin
                    M[i] <= M_next[i];
                end
            end
            group_count[total_groups-1] <= group_count[total_groups-1] + group_count[total_groups];
            group_member[total_groups-1] <= group_member[total_groups-1] | group_member[total_groups];
            total_groups <= total_groups - 4'd1;
        end

        FINISH: begin 
            code_valid <= 1;
        end
    endcase
end

assign CNT1 = group_count[1];
assign CNT2 = group_count[2];
assign CNT3 = group_count[3];
assign CNT4 = group_count[4];
assign CNT5 = group_count[5];
assign CNT6 = group_count[6];
assign HC1 = HC[1];
assign HC2 = HC[2];
assign HC3 = HC[3];
assign HC4 = HC[4];
assign HC5 = HC[5];
assign HC6 = HC[6];
assign M1 = M[1];
assign M2 = M[2];
assign M3 = M[3];
assign M4 = M[4];
assign M5 = M[5];
assign M6 = M[6];

endmodule
