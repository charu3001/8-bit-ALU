`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2026 12:15:10
// Design Name: 
// Module Name: alu_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_alu;

reg [7:0] A;
reg [7:0] B;
reg [2:0] opcode;

wire [7:0] result;
wire carry;

alu_8bit uut (
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result),
    .carry(carry)
);

initial begin

A = 8'b00000101; 
B = 8'b00000100;

opcode = 3'b000; #10; // add
opcode = 3'b001; #10; // subtract
opcode = 3'b010; #10; // and
opcode = 3'b011; #10; // or
opcode = 3'b100; #10; // xor
opcode = 3'b101; #10; // shift left
opcode = 3'b110; #10; // shift right
opcode = 3'b111; #10; // not

$finish;

end

endmodule