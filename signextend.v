module signextend(Y, Q);
	input [5:0] Y;
	output [7:0] Q;
	
	assign Q[0] = Y[0];
	assign Q[1] = Y[1];
	assign Q[2] = Y[2];
	assign Q[3] = Y[3];
	assign Q[4] = Y[4];
	assign Q[5] = Y[5];
	assign Q[6] = Y[5];
	assign Q[7] = Y[5];
	
	

endmodule