`timescale 1ns/10ps
// `include "./huffman.v"
`include "./huffman_syn.v"
`include "./N16ADFP_StdCell.v"

`define CLK_period 0.8  // CLK period.


`define CYCLE 200 // The Calculate cycle you expected
`define SDFFILE "./huffman_syn.sdf"

`ifdef tb1
  `define PAT "./pattern1.dat"
  `define EXP "./golden1.dat"
`endif
`ifdef tb2
  `define PAT "./pattern2.dat"
  `define EXP "./golden2.dat"
`endif
`ifdef tb3
  `define PAT "./pattern3.dat"
  `define EXP "./golden3.dat"
`endif

module tb;
reg CLK;
reg reset;
reg [7:0] pat_mem [0:99];
reg [7:0] exp_mem [0:23];
reg gray_valid;
reg [7:0] gray_data;
integer i;
integer k;
reg [10:0] clk_count;
reg test_se;
reg test_si;
wire test_so;
wire CNT_valid;
wire [7:0] CNT1, CNT2, CNT3, CNT4, CNT5, CNT6, CNT7, CNT8;
wire code_valid;
wire [7:0] HC1, HC2, HC3, HC4, HC5, HC6, HC7, HC8;
wire [7:0] M1, M2, M3, M4, M5, M6, M7, M8; 

reg flag1; // CNT PASS or not
reg flag2; // HC PASS or not
reg flag3; // M PASS or not
reg done1;

reg  [63:0] CNT_G;//Your anwser
wire [63:0] CNT_EXP;
reg [63:0] HC_G;
wire[63:0] HC_EXP;
reg [63:0] M_G;
wire[63:0] M_EXP;


`ifdef SDF
	initial $sdf_annotate(`SDFFILE, u_huffman);
`endif



initial begin
  $fsdbDumpfile("./huffman.fsdb");
  $fsdbDumpvars;
end


huffman u_huffman(
    .clk(CLK),
    .reset(reset), 
    .gray_valid(gray_valid), 
    .gray_data(gray_data),
    .CNT_valid(CNT_valid), 
    .CNT1(CNT1), .CNT2(CNT2), .CNT3(CNT3), .CNT4(CNT4), 
    .CNT5(CNT5), .CNT6(CNT6), .CNT7(CNT7), .CNT8(CNT8),
    .code_valid(code_valid), 
    .HC1(HC1), .HC2(HC2), .HC3(HC3), .HC4(HC4), 
    .HC5(HC5), .HC6(HC6), .HC7(HC7), .HC8(HC8),
    .M1(M1), .M2(M2), .M3(M3), .M4(M4), 
    .M5(M5), .M6(M6), .M7(M7), .M8(M8)
    );

assign CNT_EXP = {exp_mem[0], exp_mem[1], exp_mem[2], exp_mem[3], exp_mem[4], exp_mem[5], exp_mem[6], exp_mem[7]};
assign HC_EXP = {exp_mem[8], exp_mem[9], exp_mem[10], exp_mem[11], exp_mem[12], exp_mem[13], exp_mem[14], exp_mem[15]};
assign M_EXP = {exp_mem[16], exp_mem[17], exp_mem[18], exp_mem[19], exp_mem[20], exp_mem[21], exp_mem[22], exp_mem[23]};

initial $readmemh(`PAT, pat_mem);
initial $readmemh(`EXP, exp_mem);
initial $display("%s and %s were used for this simulation.", `PAT, `EXP);

initial CLK = 1'b0;
initial clk_count = 11'b0;

always begin #(`CLK_period/2) CLK = ~CLK; end

always begin #(`CLK_period) clk_count = clk_count+1 ; end
initial begin
  #0 reset = 1'b0;
  #`CLK_period reset = 1'b1;
  #(`CLK_period*2) reset = 1'b0;
end

initial begin
  #0 gray_valid = 1'b0;
  #0 CNT_G = 64'b0;
  #0 HC_G = 64'b0;
  #0 M_G = 64'b0;
     i = 0;
     k = 0;
  #(`CLK_period*5);

  @(negedge CLK) gray_valid = 1'b1;

  gray_data = pat_mem[i];

  for (i=1;i<100;i=i+1)
    @(negedge CLK) gray_data = pat_mem[i];

  @(negedge CLK) gray_valid = 1'b0;
       gray_data = 8'b0;
end

always@(*) begin
  if (CNT_valid)
  for (k=0; k<8; k=k+1) begin
        case(k)
            0: CNT_G[(63-(k*8)) -: 8] = CNT1;
            1: CNT_G[(63-(k*8)) -: 8] = CNT2;
            2: CNT_G[(63-(k*8)) -: 8] = CNT3;
            3: CNT_G[(63-(k*8)) -: 8] = CNT4;
            4: CNT_G[(63-(k*8)) -: 8] = CNT5;
            5: CNT_G[(63-(k*8)) -: 8] = CNT6;
            6: CNT_G[(63-(k*8)) -: 8] = CNT7;
            7: CNT_G[(63-(k*8)) -: 8] = CNT8;
        endcase
  end
end
always@(*) begin
  if (code_valid)
    for (k=0; k<8; k=k+1) begin
        case(k)
            0: begin HC_G[(63-(k*8)) -: 8] = HC1; M_G[(63-(k*8)) -: 8] = M1; end
            1: begin HC_G[(63-(k*8)) -: 8] = HC2; M_G[(63-(k*8)) -: 8] = M2; end
            2: begin HC_G[(63-(k*8)) -: 8] = HC3; M_G[(63-(k*8)) -: 8] = M3; end
            3: begin HC_G[(63-(k*8)) -: 8] = HC4; M_G[(63-(k*8)) -: 8] = M4; end
            4: begin HC_G[(63-(k*8)) -: 8] = HC5; M_G[(63-(k*8)) -: 8] = M5; end
            5: begin HC_G[(63-(k*8)) -: 8] = HC6; M_G[(63-(k*8)) -: 8] = M6; end
            6: begin HC_G[(63-(k*8)) -: 8] = HC7; M_G[(63-(k*8)) -: 8] = M7; end
            7: begin HC_G[(63-(k*8)) -: 8] = HC8; M_G[(63-(k*8)) -: 8] = M8; end
        endcase
  end
end
/////////////////////////Don't Modify//////////////////////
initial begin                                            //
#(`CLK_period*(`CYCLE+1000));                            //
$finish;                                                 //
end                                                      //
///////////////////////////////////////////////////////////

always@(posedge CLK) begin
  if (reset) begin
    done1 <= 1'b0;
    flag1 <= 1'b0;
    flag2 <= 1'b0;
    flag3 <= 1'b0;
  end else begin 

    if(CNT_valid == 1'b1) begin
		if (CNT_G == CNT_EXP) begin     // flag1 1 means PASS, 0 means ERROR
			$display("Check CNT : PASS");
			flag1 <= 1'b1;
		end 
		else begin
			$display("Check CNT : ERROR. Please fixed it first!");
			$display("Simulation stop here.");
			$finish;//If you want to keep simulate after error occuring in CNT,please delete finish.
		end
    done1 <= 1'b1;
    end

    if(code_valid == 1'b1) begin

		case ({(HC_G == HC_EXP),(M_G == M_EXP)})   // (HC_G == HC_EXP) true means HC PASS
        2'b00: begin                             // (M_G == M_EXP) true means M PASS
                 $display("Check HC : ERROR");
                 $display("Check M : ERROR");
                 $display("Simulation stop here.");
                 $finish;
               end
        2'b01: begin
				 $display("Check HC : ERROR");
				 $display("Check M : PASS");
				 $display("Simulation stop here.");
				 $finish;
               end
        2'b10: begin
                 $display("Check HC : PASS");
                 $display("Check M : ERROR");
                 $display("Simulation stop here.");
                 $finish;
               end
        2'b11: begin
                 $display("Check HC : PASS");
                 $display("Check M : PASS");
                 if(flag1 == 1'b1)
                   $display("You PASS the contest now.");
                 else
                   $display("Where are those CNT output?");
               end
		default:    $finish;	
        endcase
		$display("total use %d cycle.", clk_count);
        $finish;		
    end

  end
end
/*
initial begin
  for (i=0; i<100; i=i+1) begin
    $display("%3d %h", i, pat_mem[i]);
  end
  $display("--------------------------------------");
  for( i=0; i<24; i=i+1) begin
    $display("%3d %h", i, exp_mem[i]);
  end
end
*/

endmodule

