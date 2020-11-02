module  datamem(clk,ce,addr, wrdata, memwrite, memread, rdata);
input clk, ce, memwrite, memread;
input[31:0] addr, wrdata;
output[31:0] rdata;
reg [31:0]mem[100:0]; //268435456 //byte addressable as using 32 bit width reg is too large to process
	//Assigning via byte (8bit) with 
	assign rdata[31:24] = mem[addr[7:0]];	
	assign rdata[23:16] = mem[addr[7:0]+1];	
	assign rdata[15:8] = mem[addr[7:0]+2];	
	assign rdata[7:0] = mem[addr[7:0]+3];	

initial begin 
	mem[0] <= 0;
	mem[1] <= 1;
	mem[2] <= 2;
	mem[3] <= 3;
	mem[4] <= 4;
	mem[5] <= 5;
	mem[6] <= 6;
	mem[7] <= 7;
	mem[8] <= 8;
	mem[9] <= 9;
	mem[10] <= 10;
	mem[11] <= 11;
	mem[12] <= 12;
	mem[13] <= 13;
	mem[14] <= 14;
	mem[15] <= 15;
	mem[16] <= 16;
	mem[17] <= 17;
	mem[18] <= 18;
	mem[19] <= 19;
	mem[20] <= 20;
	mem[21] <= 21;
	mem[22] <= 22;
	mem[23] <= 23;
	mem[24] <= 24;
	mem[25] <= 25;
	mem[26] <= 26;
	mem[27] <= 27;
	mem[28] <= 28;
	mem[29] <= 29;
	mem[30] <= 30;
	mem[31] <= 31;
end

always @(posedge clk)
	begin
		if(memwrite) begin
			
			mem[addr[6:0]] <= wrdata[31:24];
			mem[addr[6:0]+1] <= wrdata[23:16];
			mem[addr[6:0]+2] <= wrdata[15:8];
			mem[addr[6:0]+3] <= wrdata[7:0];
		end
	end
endmodule
