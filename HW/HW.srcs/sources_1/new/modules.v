`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//Abdullah Jafar Mansour Shamout 150200919
//Muhammed Yusuf Mermer 150220762
//////////////////////////////////////////////////////////////////////////////////

module and_module(in1,in2,o);
    input wire in1;
    input wire in2;
    output wire o;
    assign o = in1 & in2;
endmodule

module four_and_module(in1,in2,in3,in4,o);
    input wire in1;
    input wire in2;
    input wire in3;
    input wire in4;
    output wire o;
    assign o = in1 & in2 & in3 & in4;
endmodule

module or_module(in1,in2,o);
    input wire in1;
    input wire in2;
    output wire o;
    assign o = in1 | in2;
endmodule

module not_module(in1,o);
    input wire in1;
    output wire o;
    assign o = ~in1;
endmodule

module nand_module(in1,in2,o);
    input wire in1;
    input wire in2;
    output wire o;
    assign o = ~(in1 & in2);
endmodule

//(~A & B) | (A & ~B)
module xor_module(in1,in2,o);
    input wire in1;
    input wire in2;
    output wire o;
    assign o = (~in1 & in2) | (in1 & ~in2);
endmodule
