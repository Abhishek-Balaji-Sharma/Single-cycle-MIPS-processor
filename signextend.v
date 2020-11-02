module signextend (inst_16,inst_32);

input[15:0] inst_16;
output reg[31:0] inst_32;
always@(inst_16)

begin
      inst_32 <= $signed(inst_16);
end

endmodule