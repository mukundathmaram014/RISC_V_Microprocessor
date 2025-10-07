module haltlogic(CLK, HLT, EN_L, PCSEL);

	input CLK;
	input HLT;
	input EN_L;
	output PCSEL;
	
	wire intermediate;
	reg previous_EN_L;
	
	always @(posedge CLK) begin
		previous_EN_L <= EN_L;
	end
	
	assign intermediate = previous_EN_L & ~EN_L;
	assign PCSEL = HLT & ~intermediate;



endmodule
