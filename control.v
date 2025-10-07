module control(FS, BSEL, CISEL, CSEL, OSEL, SHIFT_LA, SHIFT_LR, LOGICAL_OA); // add other outputs here

  // inputs
  input  [2:0]  FS;

  // constants for the function select
  localparam FS_ADD = 3'b000;
  localparam FS_SUB = 3'b001;
  localparam FS_SRA = 3'b010;
  localparam FS_SRL = 3'b011;
  localparam FS_SLL = 3'b100;
  localparam FS_AND = 3'b101;
  localparam FS_OR  = 3'b110;


  // outputs 
  output reg BSEL;
  output reg CISEL;
  output reg [1:0] CSEL;
  output reg [1:0] OSEL;
  output reg SHIFT_LA;
  output reg SHIFT_LR;
  output reg LOGICAL_OA;
  

  // constants for outputs
  localparam BSEL_B  = 1'b0;
  localparam BSEL_BN = 1'b1;
  localparam CISEL_B = 1'b0;
  localparam CISEL_BN = 1'b1;
  localparam CSEL_AS = 2'b00;
  localparam OSEL_AS = 2'b00;
  localparam CSEL_S = 2'b10;
  localparam OSEL_S = 2'b01;
  localparam CSEL_L = 2'b01;
  localparam OSEL_L = 2'b10;

  // internal variables (you can add more)

  // implement the control logic here
  always @(*) begin
    case (FS)
      FS_ADD: begin
        BSEL = BSEL_B;
		  CISEL = CISEL_B;
		  CSEL = CSEL_AS;
		  OSEL = OSEL_AS;
		  SHIFT_LR = 1'b0;
		  SHIFT_LA = 1'b0;
		  LOGICAL_OA = 1'b0;
      end
      FS_SUB: begin
        BSEL = BSEL_BN;
		  CISEL = CISEL_BN;
		  CSEL = CSEL_AS;
		  OSEL = OSEL_AS;
		  SHIFT_LR = 1'b0;
		  SHIFT_LA = 1'b0;
		  LOGICAL_OA = 1'b0;
      end
		FS_SRA: begin
		  BSEL = 1'b0;
		  CISEL = 1'b0;
		  CSEL = CSEL_S;
		  OSEL = OSEL_S;
		  SHIFT_LR = 1'b1;
		  SHIFT_LA = 1'b1;
		  LOGICAL_OA = 1'b0;
		  
		end
		FS_SRL: begin
		  BSEL = 1'b0;
		  CISEL = 1'b0;
		  CSEL = CSEL_S;
		  OSEL = OSEL_S;
		  SHIFT_LR = 1'b1;
		  SHIFT_LA = 1'b0;
		  LOGICAL_OA = 1'b0;
		end
		FS_SLL: begin
		  BSEL = 1'b0;
		  CISEL = 1'b0;
		  CSEL = CSEL_S;
		  OSEL = OSEL_S;
		  SHIFT_LR = 1'b0;
		  SHIFT_LA = 1'b0;
		  LOGICAL_OA = 1'b0;
		end
		FS_AND : begin
		  BSEL = 1'b0;
		  CISEL = 1'b0;
		  CSEL = CSEL_L;
		  OSEL = OSEL_L;
		  SHIFT_LR = 1'b0;
		  SHIFT_LA = 1'b0;
		  LOGICAL_OA = 1'b1;
		end
		FS_OR : begin
		  BSEL = 1'b0;
		  CISEL = 1'b0;
		  CSEL = CSEL_L;
		  OSEL = OSEL_L;
		  SHIFT_LR = 1'b0;
		  SHIFT_LA = 1'b0;
		  LOGICAL_OA = 1'b0;
		end
      default: begin
        BSEL = 1'b0;
		  CISEL = 1'b0;
		  CSEL = 2'b00;
		  OSEL = 2'b00;
		  SHIFT_LR = 1'b0;
		  SHIFT_LA = 1'b0;
		  LOGICAL_OA = 1'b0;
		  
      end
    endcase
  end

  /* ADD YOUR CODE ABOVE THIS LINE */

endmodule
