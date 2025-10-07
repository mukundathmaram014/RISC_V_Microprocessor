module pc (CLK, RESET, NextPC, PC);
	input CLK;
	input RESET;
	input [7:0] NextPC;
	output reg [7:0] PC;
	
	
	always @(posedge CLK) begin
		if (RESET)
			PC <= 8'd0;
		else
			PC <= NextPC;	
	
	end
endmodule