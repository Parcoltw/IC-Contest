module CONVEX (CLK, RST, PT_XY, READ_PT, DROP_X, DROP_Y, DROP_V);
input CLK;
input RST;
input [4:0] PT_XY;
output reg READ_PT;
output reg [9:0] DROP_X;
output reg [9:0] DROP_Y;
output reg DROP_V;

localparam INIT_REQ = 4'd0;
localparam INIT_READ = 4'd1;
localparam INIT_SCAN = 4'd2;
localparam INIT_SORT = 4'd3;
localparam REQ = 4'd4;
localparam READ = 4'd5;
localparam SCAN = 4'd6;
localparam DROP = 4'd7;
localparam UPDATE = 4'd8;

integer i;
reg [3:0] cs, ns;
reg [1:0] init_cnt;
reg [1:0] read_cnt;
reg [19:0] XY;
reg [19:0] hull [0:11];
reg [3:0] hull_size;
reg [3:0] scan_cnt;
reg [0:11] flag;
wire prev_flag;
reg drop_new;
reg [19:0] new_hull [0:11];
reg [3:0] write_cnt;
reg [19:0] P0, P1, P2;
reg [19:0] alu_p0, alu_p1, alu_p2;
wire is_ccw, is_cw, is_on_segment, is_extending;


assign prev_flag = (scan_cnt == 4'd0) ? flag[hull_size - 4'd1] : flag[scan_cnt - 4'd1];

ALU ALU (
    .P0(alu_p0),
    .P1(alu_p1),
    .P2(alu_p2),
    .is_ccw(is_ccw),
    .is_cw(is_cw),
    .is_on_segment(is_on_segment),
    .is_extending(is_extending)
);

always @(*) begin
    alu_p0 = 20'd0;
    alu_p1 = 20'd0;
    alu_p2 = 20'd0;
    if (cs == INIT_SCAN || cs == INIT_SORT) begin
        alu_p0 = P0;
        alu_p1 = P1;
        alu_p2 = P2;
    end
    else if (cs == SCAN) begin
        alu_p0 = hull[scan_cnt];
        alu_p1 = (scan_cnt == hull_size - 4'd1) ? hull[0] : hull[scan_cnt + 4'd1];
        alu_p2 = XY;
    end
end

always @(*) begin
    if (cs == INIT_REQ || cs == REQ) begin
        READ_PT = 1'd1;
    end
    else begin
        READ_PT = 1'd0;
    end
end

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        cs <= INIT_REQ;
    end
    else begin
        cs <= ns;
    end
end

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        P0 <= 20'd0;
        P1 <= 20'd0;
        P2 <= 20'd0;
        init_cnt <= 2'd0;
        read_cnt <= 2'd0;
        XY <= 20'd0;
        hull_size <= 4'd0;
        scan_cnt <= 4'd0;
        flag <= 12'd0;
        drop_new <= 1'd0;
        write_cnt <= 4'd0;
        DROP_X <= 10'd0;
        DROP_Y <= 10'd0;
        DROP_V <= 1'd0;
    end
    else begin
        DROP_V <= 1'd0;
        case (cs)
            INIT_REQ: begin

            end

            INIT_READ: begin
                XY <= {XY[14:0], PT_XY};
                read_cnt <= read_cnt + 2'd1;
                if (read_cnt == 2'd3) begin
                    init_cnt <= init_cnt + 2'd1;
                    if (init_cnt == 2'd0) P0 <= {XY[14:0], PT_XY};
                    if (init_cnt == 2'd1) P1 <= {XY[14:0], PT_XY};
                    if (init_cnt == 2'd2) P2 <= {XY[14:0], PT_XY};
                end
            end

            INIT_SCAN: begin

            end

            INIT_SORT: begin
                hull_size <= 4'd3;
                if (is_ccw) begin
                    hull[0] <= P0;
                    hull[1] <= P1;
                    hull[2] <= P2;
                end
                else begin
                    hull[0] <= P0;
                    hull[1] <= P2;
                    hull[2] <= P1;
                end
            end

            REQ: begin
                
            end

            READ: begin
                XY <= {XY[14:0], PT_XY};
                read_cnt <= read_cnt + 2'd1;
                if (read_cnt == 2'd3) begin
                    scan_cnt <= 4'd0;
                    flag <= 12'd0;
                    drop_new <= 1'd0;
                end
            end

            SCAN: begin
                flag[scan_cnt] <= is_cw || is_extending;
                if (is_on_segment) begin
                    drop_new <= 1'd1;
                end

                if (scan_cnt == hull_size - 4'd1) begin
                    scan_cnt <= 4'd0;
                end
                else begin
                    scan_cnt <= scan_cnt + 4'd1;
                end
            end

            DROP: begin
                if (scan_cnt < hull_size) begin
                    if (prev_flag == 1'd1 && flag[scan_cnt] == 1'd1) begin
                        DROP_X <= hull[scan_cnt][19:10];
                        DROP_Y <= hull[scan_cnt][9:0];
                        DROP_V <= 1'd1;
                    end
                    scan_cnt <= scan_cnt + 4'd1;
                end
                else begin
                    if (drop_new == 1'd1 || flag == 12'd0) begin
                        DROP_X <= XY[19:10];
                        DROP_Y <= XY[9:0];
                        DROP_V <= 1'd1;
                    end
                    scan_cnt <= 4'd0;
                    write_cnt <= 4'd0;
                end
            end

            UPDATE: begin
                if (drop_new == 1'd1 || flag == 12'd0) begin

                end
                else if (scan_cnt < hull_size) begin
                    if (prev_flag == 1'd0 && flag[scan_cnt] == 1'd1) begin
                        new_hull[write_cnt] <= hull[scan_cnt];
                        new_hull[write_cnt + 4'd1] <= XY;
                        write_cnt <= write_cnt + 4'd2;
                    end
                    else if (!(prev_flag == 1'd1 && flag[scan_cnt] == 1'd1)) begin
                        new_hull[write_cnt] <= hull[scan_cnt];
                        write_cnt <= write_cnt + 4'd1;
                    end
                    scan_cnt <= scan_cnt + 4'd1;
                end
                else begin
                    for (i=0; i<12; i=i+1) begin
                        hull[i] <= new_hull[i];
                    end
                    hull_size <= write_cnt;
                end
            end
        endcase
    end
end

always @(*) begin
    case (cs)
        INIT_REQ: begin
            ns = INIT_READ;
        end

        INIT_READ: begin
            if (read_cnt == 2'd3) begin
                if (init_cnt == 2'd2) begin
                    ns = INIT_SCAN;
                end
                else begin
                    ns = INIT_REQ;
                end
            end
            else begin
                ns = INIT_READ;
            end
        end

        INIT_SCAN: begin
            ns = INIT_SORT;
        end

        INIT_SORT: begin
            ns = REQ;
        end

        REQ: begin
            ns = READ;
        end

        READ: begin
            if (read_cnt == 2'd3) begin
                ns = SCAN;
            end
            else begin
                ns = READ;
            end
        end

        SCAN: begin
            if (scan_cnt == hull_size - 4'd1) begin
                ns = DROP;
            end
            else begin
                ns = SCAN;
            end
        end

        DROP: begin
            if (scan_cnt == hull_size) begin
                ns = UPDATE;
            end
            else begin
                ns = DROP;
            end
        end

        UPDATE: begin
            if (drop_new == 1'd1 || flag == 12'd0) begin
                ns = REQ;
            end
            else if (scan_cnt == hull_size) begin
                ns = REQ;
            end
            else begin
                ns = UPDATE;
            end
        end

        default: begin
            ns = INIT_REQ;
        end
    endcase
end

endmodule


module ALU (P0, P1, P2, is_ccw, is_cw, is_on_segment, is_extending);
input [19:0] P0, P1, P2;
output is_ccw, is_cw, is_on_segment, is_extending;

wire is_col;
wire signed [10:0] dx1, dx2, dy1, dy2;
wire signed [21:0] cross_m1, cross_m2;
wire signed [22:0] cross_z;
wire in_x_range, in_y_range;

assign dx1 = $signed({1'd0, P1[19:10]}) - $signed({1'd0, P0[19:10]});
assign dx2 = $signed({1'd0, P2[19:10]}) - $signed({1'd0, P0[19:10]});
assign dy1 = $signed({1'd0, P1[9:0]}) - $signed({1'd0, P0[9:0]});
assign dy2 = $signed({1'd0, P2[9:0]}) - $signed({1'd0, P0[9:0]});
assign cross_m1 = dx1 * dy2;
assign cross_m2 = dx2 * dy1;
assign cross_z = cross_m1 - cross_m2;

assign is_ccw = (cross_z > 23'sd0);
assign is_cw = (cross_z < 23'sd0);
assign is_col = (cross_z == 23'sd0);

assign in_x_range = (P0[19:10] <= P2[19:10] && P2[19:10] <= P1[19:10]) ||
                    (P1[19:10] <= P2[19:10] && P2[19:10] <= P0[19:10]);
assign in_y_range = (P0[9:0] <= P2[9:0] && P2[9:0] <= P1[9:0]) ||
                    (P1[9:0] <= P2[9:0] && P2[9:0] <= P0[9:0]);

assign is_on_segment = is_col && (in_x_range && in_y_range);
assign is_extending = is_col && !(in_x_range && in_y_range);

endmodule
