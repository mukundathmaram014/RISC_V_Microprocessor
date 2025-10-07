module full_adder(A, B, CI, S, CO);
	input A, B, CI;
	output S, CO;
	
	assign S = A ^ B ^ CI;
	assign CO = (A & B) | (B & CI) | (A & CI);
  endmodule


module adder(A, B, CI, Y, C, V);

  // inputs
  input [7:0] A, B;
  input CI;

  // outputs
  output [7:0] Y;
  output C, V;

  /* ADD YOUR CODE BELOW THIS LINE */
  
  
  wire [6:0] carry;
	
  full_adder bit0(
	  .A(A[0]),
	  .B(B[0]),
	  .CI(CI),
	  .S(Y[0]),
	  .CO(carry[0])
	);
  full_adder bit1(
	  .A(A[1]),
	  .B(B[1]),
	  .CI(carry[0]),
	  .S(Y[1]),
	  .CO(carry[1])
	);
	full_adder bit2(
	  .A(A[2]),
	  .B(B[2]),
	  .CI(carry[1]),
	  .S(Y[2]),
	  .CO(carry[2])
	);
	full_adder bit3(
	  .A(A[3]),
	  .B(B[3]),
	  .CI(carry[2]),
	  .S(Y[3]),
	  .CO(carry[3])
	);
	full_adder bit4(
	  .A(A[4]),
	  .B(B[4]),
	  .CI(carry[3]),
	  .S(Y[4]),
	  .CO(carry[4])
	);
	full_adder bit5(
	  .A(A[5]),
	  .B(B[5]),
	  .CI(carry[4]),
	  .S(Y[5]),
	  .CO(carry[5])
	);
	full_adder bit6(
	  .A(A[6]),
	  .B(B[6]),
	  .CI(carry[5]),
	  .S(Y[6]),
	  .CO(carry[6])
	);
	full_adder bit7(
	  .A(A[7]),
	  .B(B[7]),
	  .CI(carry[6]),
	  .S(Y[7]),
	  .CO(C)
	);
	
	assign V = carry[6] ^ C;
  

  /* ADD YOUR CODE ABOVE THIS LINE */


endmodule
