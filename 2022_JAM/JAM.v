`timescale 1ns/10ps
module JAM (CLK, RST, W, J, Cost, MatchCount, MinCost, Valid);
input CLK;
input RST;
output reg [2:0] W;
output reg [2:0] J;
input [6:0] Cost;
output reg [3:0] MatchCount;
output reg [9:0] MinCost;
output reg Valid;

integer i;
reg [1:0] cs, ns;
reg [2:0] idx;
reg done;
reg [2:0] C [7:1];
reg [2:0] arr [0:7];
reg [2:0] target;
reg [2:0] cnt;
reg [9:0] sum;

localparam CALC = 2'd0;
localparam COMP = 2'd1;
localparam SORT = 2'd2;
localparam FINISH = 2'd3;

always @(*) begin
    W = cnt;
    J = arr[cnt];
end

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        cs <= CALC;
    end
    else begin
        cs <= ns;
    end
end

always @(*) begin
    idx = 3'd0;
    done = 1'd0;
    if (C[1] < 1) begin idx = 3'd1; end
    else if (C[2] < 2) begin idx = 3'd2; end
    else if (C[3] < 3) begin idx = 3'd3; end
    else if (C[4] < 4) begin idx = 3'd4; end
    else if (C[5] < 5) begin idx = 3'd5; end
    else if (C[6] < 6) begin idx = 3'd6; end
    else if (C[7] < 7) begin idx = 3'd7; end
    else begin done = 1'd1; end

    if (idx[0] == 3'd0) begin
        target = 3'd0;
    end
    else begin
        target = C[idx];
    end
end

always @(*) begin
    case (cs)
        CALC: begin
            if (cnt == 3'd7) begin
                ns = COMP;
            end
            else begin
                ns = CALC;
            end
        end

        COMP: begin
            if (done) begin
                ns = FINISH;
            end
            else begin
                ns = SORT;
            end
        end

        SORT: begin
            ns = CALC;
        end

        FINISH: begin
            ns = FINISH;
        end
    endcase
end

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        cnt <= 3'd0;
        sum <= 10'd0;
        MatchCount <= 4'd1;
        MinCost <= 10'd1023;
        Valid <= 1'd0;
        for (i=1; i<=7; i=i+1) begin
            C[i] <= 3'd0;
        end
        arr[0] <= 3'd0;
        arr[1] <= 3'd1;
        arr[2] <= 3'd2;
        arr[3] <= 3'd3;
        arr[4] <= 3'd4;
        arr[5] <= 3'd5;
        arr[6] <= 3'd6;
        arr[7] <= 3'd7;
    end
    else begin
        case (cs)
            CALC: begin
                sum <= sum + Cost;
                cnt <= cnt + 3'd1;
            end

            COMP: begin
                if (sum < MinCost) begin
                    MinCost <= sum;
                    MatchCount <= 4'd1;
                end
                else if (sum == MinCost) begin
                    MatchCount <= MatchCount + 4'd1;
                end
            end

            SORT: begin
                sum <= 10'd0;
                arr[idx] <= arr[target];
                arr[target] <= arr[idx];
                C[idx] <= C[idx] + 3'd1;
                if (idx > 3'd1) begin C[1] <= 3'd0; end
                if (idx > 3'd2) begin C[2] <= 3'd0; end
                if (idx > 3'd3) begin C[3] <= 3'd0; end
                if (idx > 3'd4) begin C[4] <= 3'd0; end
                if (idx > 3'd5) begin C[5] <= 3'd0; end
                if (idx > 3'd6) begin C[6] <= 3'd0; end
                if (idx > 3'd7) begin C[7] <= 3'd0; end
            end

            FINISH: begin
                Valid <= 1'd1;
            end
        endcase
    end
end

endmodule