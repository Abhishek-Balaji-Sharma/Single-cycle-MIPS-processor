module instrmem(pcread, opcode, rs, rt, rd, func, imm);
	input [31:0] pcread;
	output reg [5:0] opcode, func;
	output reg [4:0] rs, rt, rd;
	output reg [15:0] imm;
	reg[31:0] mem[63:0];
	initial begin
		mem[0] = 32'h 20080005; //addi $t0, $zero, 5 
		mem[4] = 32'h 20090007; //addi $t1, $zero, 7 
		mem[8] = 32'h 00005020; //add $t2, $zero, $zero 
		mem[12] = 32'h 3c0b1000; // lui $t3 0x1000
		mem[16] = 32'h 200c0001; // addi $t4 $zero 1
		mem[20] = 32'h 00006820; // add $t5 $zero $zero
		mem[24] = 32'b 00100000000011100000000000000110;
		mem[28] = 32'b 00000001110010000101000000100000;
		mem[32] = 32'h ad6a0000; // sw $t2 0 ($t3)
		mem[36] = 32'h 8d6a0000; // lw $t2 0 ($t3)
		mem[40] = 32'h 014b6824; // and $t5 $t2 $t3
		mem[44] = 32'h 014b6825; // or $t5 $t2 $t3
		mem[48] = 32'h 01485020; // add $t2 $t2 $t0
		mem[52] = 32'h 012c4822; // sub $t1 $t1 $t4
		mem[56] = 32'h 216b0004; // addi $t3 $t3 4
		mem[60] = 32'h ad6a0000; // sw $t2 0 ($t3)
		mem[64] = 32'h 012c682a; // slt $t5 $t1 $t4
		mem[68] = 32'b 00010001101000001111111111111000;//branch
	end
	
	always @(pcread) 
	begin
		opcode <= mem[pcread][31:26];
		rs <= mem[pcread][25:21];
		rt <= mem[pcread][20:16];
		rd <= mem[pcread][15:11];
		func <= mem[pcread][5:0];
		imm <= mem[pcread][15:0];
	end
endmodule
