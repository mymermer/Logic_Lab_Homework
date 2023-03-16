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
    assign o = in1 | in2 | in3 | in4 | in5 | in6 | in7 | in8;
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
    
    wire a1,a2,a3,a4,a5,a6,a7,a8;
    wire nots1,nots2,nots3;
    
    not_module not1(s1,nots1);
    not_module not2(s2,nots2);
    not_module not3(s3,nots3);
    
    four_and_module and1(in1,nots1,nots2,nots3,a1);
    four_and_module and2(in2,nots1,nots2,s3,a2);
    four_and_module and3(in3,nots1,s2,nots3,a3);
    four_and_module and4(in4,nots1,s2,s3,a4);
    four_and_module and5(in5,s1,nots2,nots3,a5);
    four_and_module and6(in6,s1,nots2,s3,a6);
    four_and_module and7(in7,s1,s2,nots3,a7);
    four_and_module and8(in8,s1,s2,s3,a8);
    
    eight_or_module or1(a1,a2,a3,a4,a5,a6,a7,a8,o);
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
    wire carry1,carry2;
    output wire sum,carry;
    bit_halfadder_module half_adder1(a,b,sum1,carry1);
    bit_halfadder_module half_adder2(sum1,cin,sum,carry2);
    or_module or1(carry1,carry2,carry);
endmodule

module four_bitadder_module(a,b,cin1,sum, carry);
    input wire [3:0] a;
    input wire [3:0] b;
    input wire cin1;
    wire cin2,cin3,cin4;
    output wire [3:0] sum;
    output wire carry;
    
    bit_fulladder_module adder1(a[0],b[0],cin1,sum[0],cin2);
    bit_fulladder_module adder2(a[1],b[1],cin2,sum[1],cin3);
    bit_fulladder_module adder3(a[2],b[2],cin3,sum[2],cin4);
    bit_fulladder_module adder4(a[3],b[3],cin4,sum[3],carry);
   
endmodule

module eight_bitadder_module(a,b,cin1,sum, carry);
    input wire [7:0] a;
    input wire [7:0] b;
    input wire cin1;
    wire cin2,cin3,cin4,cin5,cin6,cin7,cin8;
    output wire [7:0] sum;
    output wire carry;
    
    bit_fulladder_module adder1(a[0],b[0],cin1,sum[0],cin2);
    bit_fulladder_module adder2(a[1],b[1],cin2,sum[1],cin3);
    bit_fulladder_module adder3(a[2],b[2],cin3,sum[2],cin4);
    bit_fulladder_module adder4(a[3],b[3],cin4,sum[3],cin5);
    bit_fulladder_module adder5(a[4],b[4],cin5,sum[4],cin6);
    bit_fulladder_module adder6(a[5],b[5],cin6,sum[5],cin7);
    bit_fulladder_module adder7(a[6],b[6],cin7,sum[6],cin8);
    bit_fulladder_module adder8(a[7],b[7],cin8,sum[7],carry);
   
endmodule


