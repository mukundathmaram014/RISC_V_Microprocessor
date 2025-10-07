module logical(A, B, OA, Y);

  // inputs
  input [7:0] A, B;
  input OA;

  // outputs
  output reg [7:0] Y;

  /* ADD YOUR CODE BELOW THIS LINE */
  always @(*) begin
    if (OA == 0) begin
		Y[7] <= A[7] | B[7];
		Y[6] <= A[6] | B[6];
		Y[5] <= A[5] | B[5];
		Y[4] <= A[4] | B[4];
		Y[3] <= A[3] | B[3];
		Y[2] <= A[2] | B[2];
		Y[1] <= A[1] | B[1];
		Y[0] <= A[0] | B[0];
	 end
	 else begin
		Y[7] <= A[7] & B[7];
		Y[6] <= A[6] & B[6];
		Y[5] <= A[5] & B[5];
		Y[4] <= A[4] & B[4];
		Y[3] <= A[3] & B[3];
		Y[2] <= A[2] & B[2];
		Y[1] <= A[1] & B[1];
		Y[0] <= A[0] & B[0];
	 end
  
  
  end

  /* ADD YOUR CODE ABOVE THIS LINE */

endmodule
