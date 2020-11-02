module registerfile (read1,read2,writereg,writedata,regwrite,data1,data2,clock);
input [4:0] read1,read2,writereg; // the registers numbers to read or write
input [31:0] writedata; // data to write
input regwrite, // The write control
clock; // the clock to trigger write
output [31:0] data1, data2; // the register values read
reg [31:0] RF [31:0]; // 32 registers each 32 bits long
assign data1 = RF[read1];
assign data2 = RF[read2];
always begin
// write the register with new value if regwrite is high
@(posedge clock) if (regwrite) RF[writereg] <= writedata;
end
endmodule