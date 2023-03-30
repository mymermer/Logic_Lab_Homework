`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Abdullah Jafar Mansour Shamout 150200919
//Muhammed Yusuf Mermer 150220762
//////////////////////////////////////////////////////////////////////////////////

module nand_module(in1,in2,o);
    input wire in1;
    input wire in2;
    output wire o;
    assign o = ~(in1 & in2);
endmodule

module SR_latch(set,reset,Q,Qnot);
    input wire set;
    input wire reset;
    output wire Q;
    output wire Qnot;
    
    nand_module A(set, Qnot, Q);
    nand_module B(reset, Q, Qnot);
endmodule

module enabled_SR_latch(enabled,set,reset,Q,Qnot);
    input wire enabled;
    input wire set;
    input wire reset;
    
    wire notset,notreset;
    
    output wire Q;
    output wire Qnot;
    
    nand_module E1(enabled,set,notset);
    nand_module E2(enabled,reset,notreset);

    SR_latch SR1(notset,notreset,Q,Qnot);   //I already created a SR latch which is made from NAND gates, so I will be reusing it instead of writing everything with NANDS again
endmodule

module enabled_D_latch(enabled,D,Q,Qnot);

    input wire enabled,D;
    wire Dnot;
    assign Dnot = ~D;//as it was said in the introduction part, it is fine to use ~,&,|,{} operators in our project
    // that is why I used the assignment with ~instead of using a nand 
    
    output wire Q,Qnot;
    enabled_SR_latch D1(enabled,D,Dnot,Q,Qnot);
    
endmodule


module JK_flipflop(input wire J, input wire K, input wire clock, output wire Q, output wire Qnot);
    wire notOfJQnot, JQnot, snot;
    wire notOfKQ,KQ,rnot;
    

    nand_module nand1(J,Qnot,notOfJQnot);
    nand_module nand2(notOfJQnot,notOfJQnot,JQnot);
    nand_module nand3(JQnot,clock,snot);
    
    nand_module nand4(K,Q,notOfKQ);
    nand_module nand5(notOfKQ,notOfKQ,KQ);
    nand_module nand6(KQ,clock,rnot);

    nand_module nand7(snot,Qnot, Q);
    nand_module nand8(rnot,Q,Qnot);


endmodule

