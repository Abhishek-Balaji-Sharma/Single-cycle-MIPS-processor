module control(opcode, regdst, branch, memread, memtoreg, aluop, memwrite, alusrc, regwrite);
//ab
	input[5:0] opcode;
	output reg regdst, branch, memread, memtoreg, memwrite, alusrc, regwrite;
	output reg [1:0] aluop;
	always@(*)
	begin
		if(opcode == 0)//r-type instruction
			regdst = 1;
		else
			regdst = 0;
		if(opcode == 4)// 000100 branch if equal
			branch = 1;
		else
			branch = 0;
			
		if(opcode == 35)
			memread = 1;
		else 
			memread = 0;
			
		if(opcode == 35)
			memtoreg = 1;
		else
			memtoreg = 0;
			
		if(opcode == 8 || opcode == 35 || opcode == 43)
			aluop = 0;
		else if(opcode == 0)
			aluop = 2;
		else if(opcode == 15)
			aluop = 3;
		else 
			aluop = 1;
			
		if(opcode == 43)
			memwrite = 1;
		else
			memwrite = 0;
			
		if(opcode == 8 || opcode == 35 || opcode == 43 || opcode == 15)
			alusrc = 1;
		else
			alusrc = 0;
			
		if(opcode == 8 || opcode == 35 || opcode == 0 || opcode === 15)
			regwrite = 1;
		else 
			regwrite = 0;
	end
		
endmodule
