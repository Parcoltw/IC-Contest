module REFRACT (CLK, RST, RI, SRAM_A, SRAM_D, SRAM_Q, SRAM_WE, DONE);
input wire CLK;
input wire RST;
input wire [3:0] RI;
output reg [8:0] SRAM_A;
output reg [15:0] SRAM_D;
input wire [15:0] SRAM_Q;
output reg SRAM_WE;
output reg DONE;


reg valid_pipe [0:65];
reg [3:0] X_pipe [0:65];
reg [3:0] Y_pipe [0:65];
reg signed [18:0] gx_pipe [0:65];
reg signed [18:0] gy_pipe [0:65];
reg [18:0] Z_pipe [0:65];
reg [15:0] eta_pipe [0:65];
reg [35:0] term1_pipe [0:65];


reg [3:0] X, Y;
reg enable, toggle;
wire valid = (enable && !toggle);

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        X <= 0;
        Y <= 0;
        enable <= 1;
        toggle <= 0;
    end
    else begin
        if (enable) begin
            toggle <= ~toggle;
            if (!toggle) begin
                if (X == 15) begin
                    X <= 0;
                    if (Y == 15) begin
                        enable <= 0;
                    end
                    else begin
                        Y <= Y + 1;
                    end
                end
                else begin
                    X <= X + 1;
                end
            end
        end
    end
end


wire signed [4:0] A = X_pipe[0] - 5'sd8;
wire signed [4:0] B = Y_pipe[0] - 5'sd8;

wire signed [9:0] A2 = A * A;
wire signed [9:0] B2 = B * B;

wire signed [19:0] A4 = A2 * A2;
wire signed [19:0] B4 = B2 * B2;

wire signed [39:0] A8 = A4 * A4;
wire signed [34:0] A7 = A4 * A2 * A;
wire signed [39:0] B8 = B4 * B4;
wire signed [34:0] B7 = B4 * B2 * B;


wire signed [18:0] gx = A7 >>> 4;
wire signed [18:0] gy = B7 >>> 4;
wire [17:0] Za = A8 >>> 7;
wire [17:0] Zb = B8 >>> 7;

wire [16:0] eta = 17'd65536 / RI;
wire [33:0] w_eta2 = eta * eta;
wire [15:0] eta2 = w_eta2[31:16];


integer i;

reg [15:0] eta2_p1, eta2_p2, eta2_p3;
reg [17:0] Za_p1, Zb_p1;
reg [18:0] gx2_p2, gy2_p2;
reg [19:0] h2_p3, h2_p4, h2_p5;
reg [35:0] term_p4;
reg [35:0] kgg_p5;

wire [35:0] term = eta_pipe[5] * h2_p5;

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        for (i=0; i<=65; i=i+1) begin
            valid_pipe[i] <= 0;
        end
    end
    else begin
        for(i=0; i<65; i=i+1) begin
            valid_pipe[i+1] <= valid_pipe[i];
            X_pipe[i+1] <= X_pipe[i];
            Y_pipe[i+1] <= Y_pipe[i];
            gx_pipe[i+1] <= gx_pipe[i];
            gy_pipe[i+1] <= gy_pipe[i];
            Z_pipe[i+1] <= Z_pipe[i];
            eta_pipe[i+1] <= eta_pipe[i];
            term1_pipe[i+1] <= term1_pipe[i];
        end

        valid_pipe[0] <= valid;
        X_pipe[0] <= X;
        Y_pipe[0] <= Y;
        gx_pipe[1] <= gx;
        gy_pipe[1] <= gy;
        eta_pipe[1] <= eta[15:0];
        Z_pipe[2] <= 19'd393216 - Za_p1 - Zb_p1;
        term1_pipe[6] <= term;
    end
end


wire signed [37:0] w_gx2_p1 = gx_pipe[1] * gx_pipe[1];
wire signed [37:0] w_gy2_p1 = gy_pipe[1] * gy_pipe[1];

always @(posedge CLK) begin
    eta2_p1 <= eta2;
    Za_p1 <= Za;
    Zb_p1 <= Zb;
    
    gx2_p2 <= w_gx2_p1[34:16];
    gy2_p2 <= w_gy2_p1[34:16];
    eta2_p2 <= eta2_p1;

    h2_p3 <= gx2_p2 + gy2_p2;
    eta2_p3 <= eta2_p2;
    
    term_p4 <= eta2_p3 * h2_p3;
    h2_p4 <= h2_p3;
    
    kgg_p5 <= {h2_p4, 16'd0} + 36'd4294967296 - term_p4;
    h2_p5 <= h2_p4;
end


reg [35:0] sqrt_D_pipe [0:18];
reg [17:0] sqrt_Q_pipe [0:18];
reg [19:0] sqrt_R_pipe [0:18];

always @(posedge CLK) begin
    sqrt_D_pipe[0] <= kgg_p5;
    sqrt_Q_pipe[0] <= 18'd0;
    sqrt_R_pipe[0] <= 20'd0;
end

genvar j;
generate
    for (j=0; j<18; j=j+1) begin
        wire [19:0] next_R_sqrt = {sqrt_R_pipe[j][17:0], sqrt_D_pipe[j][35:34]} - {sqrt_Q_pipe[j], 2'b01};
        wire is_geq_sqrt = ({sqrt_R_pipe[j][17:0], sqrt_D_pipe[j][35:34]} >= {sqrt_Q_pipe[j], 2'b01});

        always @(posedge CLK) begin
            if (is_geq_sqrt) begin
                sqrt_R_pipe[j+1] <= next_R_sqrt;
                sqrt_Q_pipe[j+1] <= {sqrt_Q_pipe[j][16:0], 1'b1};
            end
            else begin
                sqrt_R_pipe[j+1] <= {sqrt_R_pipe[j][17:0], sqrt_D_pipe[j][35:34]};
                sqrt_Q_pipe[j+1] <= {sqrt_Q_pipe[j][16:0], 1'b0};
            end
            sqrt_D_pipe[j+1] <= {sqrt_D_pipe[j][33:0], 2'b00};
        end
    end
endgenerate


reg [17:0] term2_pipe;
reg [19:0] div_D_p25;
reg [36:0] div_N_pipe [0:37];
reg [19:0] div_D_pipe [0:37];
reg [36:0] div_Q_pipe [0:37];
reg [20:0] div_R_pipe [0:37];

always @(posedge CLK) begin
    term2_pipe <= sqrt_Q_pipe[18] - {2'b00, eta_pipe[24]};
    div_D_p25 <= term1_pipe[24][35:16] + sqrt_Q_pipe[18];
    
    div_N_pipe[0] <= Z_pipe[25] * term2_pipe;
    div_D_pipe[0] <= div_D_p25;
    div_Q_pipe[0] <= 37'd0;
    div_R_pipe[0] <= 21'd0;
end

generate
    for (j=0; j<37; j=j+1) begin
        wire [20:0] R_temp = {div_R_pipe[j][19:0], div_N_pipe[j][36]};
        wire is_geq_div = (R_temp >= div_D_pipe[j]);
        wire [20:0] next_R_div = R_temp - div_D_pipe[j];

        always @(posedge CLK) begin
            if (is_geq_div) begin
                div_R_pipe[j+1] <= next_R_div;
                div_Q_pipe[j+1] <= {div_Q_pipe[j][35:0], 1'b1};
            end else begin
                div_R_pipe[j+1] <= R_temp;
                div_Q_pipe[j+1] <= {div_Q_pipe[j][35:0], 1'b0};
            end
            div_N_pipe[j+1] <= {div_N_pipe[j][35:0], 1'b0};
            div_D_pipe[j+1] <= div_D_pipe[j];
        end
    end
endgenerate


reg signed [40:0] Zx_p64, Zy_p64;
reg signed [24:0] Zx_p65, Zy_p65;
wire signed [21:0] ratio_p63 = $signed({1'b0, div_Q_pipe[37][20:0]});

always @(posedge CLK) begin
    Zx_p64 <= ratio_p63 * gx_pipe[63];
    Zy_p64 <= ratio_p63 * gy_pipe[63];
    
    Zx_p65 <= $signed({1'b0, X_pipe[64], 16'd0}) - Zx_p64[40:16];
    Zy_p65 <= $signed({1'b0, Y_pipe[64], 16'd0}) - Zy_p64[40:16];
end


reg [3:0] X_out, Y_out;
reg [15:0] Zy_out;
reg Zy_wen;
reg finish;
reg buffer;

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        SRAM_WE <= 0;
        SRAM_A <= 0;
        SRAM_D <= 0;
        Zy_wen <= 0;
        finish <= 0;
        buffer <= 0;
        DONE <= 0;
    end
    else begin
        if (valid_pipe[65]) begin
            SRAM_A <= {Y_pipe[65], X_pipe[65], 1'b0};
            SRAM_D <= Zx_p65[19:4] + Zx_p65[3];
            SRAM_WE <= 1;

            X_out <= X_pipe[65];
            Y_out <= Y_pipe[65];
            Zy_out <= Zy_p65[19:4] + Zy_p65[3];
            Zy_wen <= 1;

            if (X_pipe[65] == 15 && Y_pipe[65] == 15) begin
                finish <= 1;
            end
        end
        else if (Zy_wen) begin
            SRAM_A <= {Y_out, X_out, 1'b1};
            SRAM_D <= Zy_out;
            SRAM_WE <= 1;
            Zy_wen <= 0;
            
            if (finish) begin
                buffer <= 1;
                finish <= 0;
            end
        end 
        else begin
            SRAM_WE <= 0;
            if (buffer) begin
                DONE <= 1;
                buffer <= 0;
            end
        end
    end
end

endmodule