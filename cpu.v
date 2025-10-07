module cpu(CLK, RESET, EN_L, Iin, Din, PC, NextPC, DataA, DataB, DataC, DataD, MW);
  input         CLK;
  input         RESET;
  input         EN_L;
  input  [15:0] Iin;
  input  [7:0]  Din;

  output [7:0]  PC;
  output [7:0]  NextPC;
  output [7:0]  DataA;
  output [7:0]  DataB;
  output [7:0]  DataC;
  output [7:0]  DataD;
  output        MW;

  
  wire [2:0] DR;
  wire [2:0] SA;
  wire [2:0] SB;
  wire [5:0] IMM;
  wire MB;
  wire [2:0] FS;
  wire MD;
  wire LD;
  wire [7:0] IMME;
  wire H;
  wire [1:0] PCSEL;
  reg MP;
  wire [2:0] BS;
  wire [5:0] OFF;
  wire [7:0] OFFESE;
  
  assign OFFESE = {OFF[5], OFF, 1'b0};
 
  
  wire C;
  wire V;
  wire N;
  wire Z;
  
  wire [7:0] DataBalu;
  assign PCSEL = (H) ? 2'b10 : ((MP) ? 2'b01 : 2'b00);
  assign DataBalu = (MB) ? IMME : DataB;
  assign NextPC = (PCSEL[1]) ? PC : (PCSEL[0] ? PC + OFFESE + 8'd2: PC + 8'd2);
  assign DataC = (MD) ? Din : DataD;
  
  
  always @(*) begin
	case(BS)
		3'b000:
			begin
			MP = Z;
			end
		3'b001:
			begin
			MP = ~Z;
			end
		3'b010:
			begin
			MP = ~N;
			end
		3'b011:
			begin
			MP = N;
			end
		3'b100:
			begin
			MP = 1'b0;
			end
		default
			begin
			MP = 1'b0;
			end
	endcase
  end
  
  
  pc programCounter(
	.CLK(CLK),
	.RESET(RESET),
	.NextPC(NextPC),
	.PC(PC)
  );
  
 
  haltlogic hl(
	.CLK(CLK),
	.HLT(HLT),
	.EN_L(EN_L),
	.PCSEL(H)
  );
 
  
  decoder dc(
	.INST(Iin),
	.DR(DR),
	.SA(SA),
	.SB(SB),
	.IMM(IMM),
	.MB(MB),
	.FS(FS),
	.MD(MD),
	.LD(LD),
	.MW(MW),
	.HLT(HLT),
	.BS(BS),
	.OFF(OFF)
  );
  
  regfile register(
	.CLK(CLK),
	.RESET(RESET),
	.SA(SA),
	.SB(SB),
	.LD(LD),
	.DR(DR),
	.D_in(DataC),
	.DataA(DataA),
	.DataB(DataB)
  );
  
  signextend se(
	.Y(IMM),
	.Q(IMME)
  );
  
  
   alu al(
	.A(DataA),
	.B(DataBalu),
	.FS(FS),
	.Y(DataD),
	.C(C),
	.V(V),
	.N(N),
	.Z(Z)
  );
  


endmodule
