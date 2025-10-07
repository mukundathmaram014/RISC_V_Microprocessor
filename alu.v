module alu(A, B, FS, Y, C, V, N, Z);
  input  [7:0]  A;
  input  [7:0]  B;
  input  [2:0]  FS;

  output [7:0]  Y;
  output        C;
  output        V;
  output        N;
  output        Z;


  /* ADD YOUR CODE BELOW THIS LINE */
  
  wire carryoutad;
  wire [7:0] outputad;
  wire carryoutshift;
  wire [7:0] outputshift;
  wire [7:0] outputlogical;
  wire bsel;
  wire cisel;
  wire [1:0] csel;
  wire [1:0] osel;
  wire shift_la;
  wire shift_lr;
  wire logical_oa;
  wire [7:0] b;
  wire ci;
  wire v_adder;
  
  control co(
	.FS(FS), 
	.BSEL(bsel),
	.CISEL(cisel),
	.CSEL(csel),
	.OSEL(osel),
	.SHIFT_LA(shift_la),
	.SHIFT_LR(shift_lr),
	.LOGICAL_OA(logical_oa)
  );

  adder ad(
	.A(A),
   .B(b),
   .CI(ci),
   .Y(outputad),
   .C(carryoutad),
   .V(v_adder)
  );
  
  shifter shift(
	.A(A),
	.LA(shift_la),
	.LR(shift_lr),
	.Y(outputshift),
	.C(carryoutshift)
  );
  
  logical logic(
	.A(A),
	.B(B),
	.OA(logical_oa),
	.Y(outputlogical)
  );
  
  assign b = bsel ? ~B : B;
  assign ci = cisel ? 1'b1 : 1'b0;
  assign V = (FS[2:1] == 2'b00) ? v_adder : 1'b0;
  assign C = csel[1] ? (carryoutshift) : (csel[0] ? 1'b0 : carryoutad);
  assign Y = osel[1] ? (outputlogical) : (osel[0] ? outputshift : outputad);
  assign N = Y[7];
  assign Z = ~(Y[0] | Y[1] | Y[2] | Y[3] | Y[4] | Y[5] | Y[6] | Y[7]);

  /* ADD YOUR CODE ABOVE THIS LINE */


endmodule
