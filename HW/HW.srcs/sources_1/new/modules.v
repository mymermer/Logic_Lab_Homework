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

module three_and_module(in1,in2,in3,o);
    input wire in1;
    input wire in2;
    input wire in3;
    output wire o;
    assign o = in1 & in2 & in3;
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

module eight_or_module(in1,in2,in3,in4,in5,in6,in7,in8,o);
    input wire in1,in2,in3,in4,in5,in6,in7,in8;
    output wire o;
    assign o = in1 | in2 | in3 | in4 | in5 | in6 | in7 |in8;
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

module mux_8to1_module(in1,in2,in3,in4,in5,in6,in7,in8,s1,s2,s3,o);
    input wire in1,in2,in3,in4,in5,in6,in7,in8;
    input wire s1,s2,s3;
    output wire o;
    
    wire x1,x2,x3,x4,x5,x6,x7,x8;
    wire nots1,nots2,nots3;
    
    not_module not1(s1,nots1);
    not_module not2(s2,nots2);
    not_module not3(s3,nots3);
    
    four_and_module and1(in1,nots1,nots2,nots3,x1);
    four_and_module and2(in2,nots1,nots2,s3,x2);
    four_and_module and3(in3,nots1,s2,nots3,x3);
    four_and_module and4(in4,nots1,s2,s3,x4);
    four_and_module and5(in5,ns1,nots2,nots3,x5);
    four_and_module and6(in6,s1,nots2,s3,x6);
    four_and_module and7(in7,s1,s2,nots3,x7);
    four_and_module and8(in8,s1,s2,s3,x8);
    
    eight_or_module or1(x1,x2,x3,x4,x5,x6,x7,x8,o);
endmodule

module decoder_3to8_module(in1,in2,in3,o1,o2,o3,o4,o5,o6,o7,o8);
    input wire in1,in2,in3;
    output wire o1,o2,o3,o4,o5,o6,o7,o8;
    
    wire notin1,notin2,notin3;
    
    not_module not1(in1, notin1);
    not_module not2(in2, notin2);
    not_module not3(in3, notin3);
    
    three_and_module and1(notin1,notin2,notin3,o1);
    three_and_module and2(notin1,notin2,in3,o2);
    three_and_module and3(notin1,in2,notin3,o3);
    three_and_module and4(notin1,in2,in3,o4);
    three_and_module and5(in1,notin2,notin3,o5);
    three_and_module and6(in1,notin2,in3,o6);
    three_and_module and7(in1,in2,notin3,o7);
    three_and_module and8(in1,in2,in3,o8);
    
endmodule

module F2(a,b,c,o);
    input wire a,b,c;
    wire o1,o2,o3,o4,o5,o6,o7,o8;
    output wire o;
    
    decoder_3to8_module decoder(a,b,c,o1,o2,o3,o4,o5,o6,o7,o8);
    
    or_module orA(o4,o6,o);
endmodule

module F3(a,b,c,o);
    input wire a,b,c;
    wire o1,o2,o3,o4,o5,o6,o7,o8;
    wire extra;
    output wire o;
    
    decoder_3to8_module decoder(a,b,c,o1,o2,o3,o4,o5,o6,o7,o8);
    
    or_module orA(o8,o7,extra);
    or_module orB(extra,o7,o);
endmodule

module bit_halfadder_module(a,b,sum,carry);
    input wire a,b;
    output wire sum,carry;
    xor_module xorA(a,b,sum);
    and_module andA(a,b,carry);
endmodule

module bit_fulladder_module(a,b,cin,sum,carry);
    input wire a,b,cin;
    output wire sum,carry;
    
endmodule







