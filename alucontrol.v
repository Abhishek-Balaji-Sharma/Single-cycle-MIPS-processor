module alucontrol(
	input [1:0] aluop, 
	input [5:0] funcode, 
	output reg [3:0] aluctrl
	);

always @(aluop, funcode) begin
    if ( aluop == 2 )
        case (funcode)
            32: aluctrl<=2; // add
            34: aluctrl<=6; //subtract
            36: aluctrl<=0; // and
            37: aluctrl<=1; // or
            39: aluctrl<=12; // nor
            42: aluctrl<=7; // slt
            default: aluctrl<=15; // should not happen
        endcase
    else
        case (aluop)
            0:  aluctrl<=2; 
            1: aluctrl<=6;
				3: aluctrl <= 4;
            default: aluctrl<=15; // should not happen mother fucker
        endcase
end
endmodule
