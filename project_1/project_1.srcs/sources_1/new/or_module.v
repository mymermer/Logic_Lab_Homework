`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//Abdullah Jafar Mansour Shamout 150200919
//Muhammed Yusuf Mermer 150220762
//////////////////////////////////////////////////////////////////////////////////

module or_module(in1,in2,o);
    input wire in1;
    input wire in2;
    output wire o;
    assign o = in1 | in2;
endmodule
