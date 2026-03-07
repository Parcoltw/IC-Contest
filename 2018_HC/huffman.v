module huffman (clk, reset, gray_valid, gray_data, CNT_valid, CNT1, CNT2, CNT3, CNT4, CNT5, CNT6, CNT7, CNT8,
    code_valid, HC1, HC2, HC3, HC4, HC5, HC6, HC7, HC8, M1, M2, M3, M4, M5, M6, M7, M8);
    input clk;
    input reset;
    input gray_valid;
    input [7:0] gray_data;
    output reg CNT_valid;
    output [7:0] CNT1, CNT2, CNT3, CNT4, CNT5, CNT6, CNT7, CNT8;
    output reg code_valid;
    output [7:0] HC1, HC2, HC3, HC4, HC5, HC6, HC7, HC8;
    output [7:0] M1, M2, M3, M4, M5, M6, M7, M8;

    integer i;

    reg [6:0] counter;
    reg [7:0] HC [1:8], M [1:8], M_next [1:8];
    reg [2:0] cs, ns;
    reg [3:0] total_groups;
    reg [7:0] group_count [1:8];
    reg [8:1] group_member [1:8];

    always @(*) begin
        M_next[1] = {M[1][6:0], 1'b1};
        M_next[2] = {M[2][6:0], 1'b1};
        M_next[3] = {M[3][6:0], 1'b1};
        M_next[4] = {M[4][6:0], 1'b1};
        M_next[5] = {M[5][6:0], 1'b1};
        M_next[6] = {M[6][6:0], 1'b1};
        M_next[7] = {M[7][6:0], 1'b1};
        M_next[8] = {M[8][6:0], 1'b1};
    end

    always @(posedge clk) begin
        if (reset)
            cs <= 3'd0;
        else
            cs <= ns;
    end

    always @(*) begin
        ns = cs;
        case (cs)
            // IDLE
            3'd0: begin
                ns = 3'd1;
            end

            // READ
            3'd1: begin
                if (counter == 7'd100) begin
                    ns = 3'd2;
                end
            end

            // OUTPUT CNT
            3'd2: begin
                ns = 3'd3;
            end

            // SORT EVEN
            3'd3: begin
                ns = 3'd4;
            end

            // SORT ODD
            3'd4: begin
                if ((group_count[2] >= group_count[3]) && (group_count[4] >= group_count[5])
                    && (group_count[6] >= group_count[7])) begin
                    ns = 3'd5;
                end 
                else begin
                    ns = 3'd3;
                end
            end

            // MERGE
            3'd5: begin
                if (total_groups == 4'd2) begin
                    ns = 3'd6;
                end
                else begin
                    ns = 3'd3;
                end
            end

            // OUTPUT HC
            3'd6: begin
                // do nothing
            end
        endcase
    end

    always @(posedge clk) begin
        CNT_valid <= 0;
        code_valid <= 0;
        case (cs)
            // IDLE
            3'd0: begin 
                total_groups <= 4'd8;
                group_count[1] <= 8'd0;
                group_count[2] <= 8'd0;
                group_count[3] <= 8'd0;
                group_count[4] <= 8'd0;
                group_count[5] <= 8'd0;
                group_count[6] <= 8'd0;
                group_count[7] <= 8'd0;
                group_count[8] <= 8'd0;
                HC[1] <= 8'd0;
                HC[2] <= 8'd0;
                HC[3] <= 8'd0;
                HC[4] <= 8'd0;
                HC[5] <= 8'd0;
                HC[6] <= 8'd0;
                HC[7] <= 8'd0;
                HC[8] <= 8'd0;
                M[1] <= 8'd0;
                M[2] <= 8'd0;
                M[3] <= 8'd0;
                M[4] <= 8'd0;
                M[5] <= 8'd0;
                M[6] <= 8'd0;
                M[7] <= 8'd0;
                M[8] <= 8'd0;
                group_member[1] <= 8'b00000001;
			    group_member[2] <= 8'b00000010;
			    group_member[3] <= 8'b00000100;
			    group_member[4] <= 8'b00001000;
			    group_member[5] <= 8'b00010000;
			    group_member[6] <= 8'b00100000;
			    group_member[7] <= 8'b01000000;
			    group_member[8] <= 8'b10000000;
                counter <= 7'd0;
            end

            // READ DATA
            3'd1: begin 
                if (gray_valid) begin
                    case (gray_data)
                        8'h01: group_count[1] <= group_count[1] + 8'd1;
                        8'h02: group_count[2] <= group_count[2] + 8'd1;
                        8'h03: group_count[3] <= group_count[3] + 8'd1;
                        8'h04: group_count[4] <= group_count[4] + 8'd1;
                        8'h05: group_count[5] <= group_count[5] + 8'd1;
                        8'h06: group_count[6] <= group_count[6] + 8'd1;
                        8'h07: group_count[7] <= group_count[7] + 8'd1;
                        8'h08: group_count[8] <= group_count[8] + 8'd1;
                    endcase
                end
                counter <= counter + 7'd1;
            end

            // OUTPUT CNT
            3'd2: begin 
                CNT_valid <= 1;
            end

            // SORT EVEN
            3'd3: begin 
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
                if (group_count[7] < group_count[8]) begin
                    group_count[7] <= group_count[8];
                    group_count[8] <= group_count[7];
                    group_member[7] <= group_member[8];
                    group_member[8] <= group_member[7];
                end
            end

            // SORT ODD
            3'd4: begin 
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
                if (group_count[6] < group_count[7]) begin
                    group_count[6] <= group_count[7];
                    group_count[7] <= group_count[6];
                    group_member[6] <= group_member[7];
                    group_member[7] <= group_member[6];
                end
            end

            // MERGE
            3'd5: begin 
                for (i=1; i<=8; i=i+1) begin
                    if (group_member[total_groups][i]) begin // right node -> code 1
                        HC[i] <= HC[i] | (M[i] ^ M_next[i]);
                        M[i] <= M_next[i];
                    end
                    if (group_member[total_groups - 1][i]) begin // left node -> code 0
                        M[i] <= M_next[i];
                    end
                end
                group_count[total_groups-1] <= group_count[total_groups-1] + group_count[total_groups];
                group_member[total_groups-1] <= group_member[total_groups-1] | group_member[total_groups];
                total_groups <= total_groups - 4'd1;
            end

            // OUTPUT HC
            3'd6: begin 
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
    assign CNT7 = group_count[7];
    assign CNT8 = group_count[8];
    assign HC1 = HC[1];
    assign HC2 = HC[2];
    assign HC3 = HC[3];
    assign HC4 = HC[4];
    assign HC5 = HC[5];
    assign HC6 = HC[6];
    assign HC7 = HC[7];
    assign HC8 = HC[8];
    assign M1 = M[1];
    assign M2 = M[2];
    assign M3 = M[3];
    assign M4 = M[4];
    assign M5 = M[5];
    assign M6 = M[6];
    assign M7 = M[7];
    assign M8 = M[8];
endmodule
