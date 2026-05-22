`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2026 12:12:59
// Design Name: 
// Module Name: alu_8bit
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


module alu_8bit(
input [7:0] A,
input [7:0] B,
input [2:0] opcode,
output reg [7:0] result,
output reg carry
);

always @(*) begin
    case(opcode)

    3'b000: {carry, result} = A + B;

    3'b001: {carry, result} = A - B;

    3'b010: result = A & B;

    3'b011: result = A | B;

    3'b100: result = A ^ B;

    3'b101: result = A << 1;

    3'b110: result = A >> 1;

    3'b111: result = ~A;

    default: result = 8'b00000000;

    endcase
end

endmodule