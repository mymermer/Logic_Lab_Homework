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
    input wire enabled;
    input wire D;

    wire Dnot;
    
    nand_module A(D,D,Dnot);
    
    output wire Q,Qnot;

    enabled_SR_latch D1(enabled,D,Dnot,Q,Qnot);    //I already created an enabled SR latch which is made from NAND gates, so I will be reusing it instead of writing everything with NANDS again
endmodule

module D_flip_flop(clk,D,Q,Qnot);
    input wire clk;
    input wire D;
    
    wire tempQ,tempQnot;
    wire clknot;
    
    nand_module inverter(clk,clk,clknot);
    output wire Q,Qnot;

    enabled_D_latch master(clk,D,tempQ,tempQnot);    //I already created an enabled D latch which is made from NAND gates, so I will be reusing it instead of writing everything with NANDS again
    enabled_D_latch slave(clknot,tempQ,Q,Qnot);    //I already created an enabled D latch which is made from NAND gates, so I will be reusing it instead of writing everything with NANDS again
endmodule

module SR_flip_flop(clk,S,R,Q,Qnot);
    input wire clk,S,R;
    output wire Q,Qnot;
    
    wire tempQ,tempQnot;
    wire clknot;
    
    nand_module inverter(clk,clk,clknot);
    
    enabled_SR_latch master(clknot,S,R,tempQ,tempQnot);
    enabled_SR_latch slave(clk,tempQ,tempQnot,Q,Qnot);
endmodule
/*
module JK_flip_flop(clk,J,K,Q,Qnot);
    input wire J,K,clk;
    output wire Q,Qnot;
    
    wire notclk,tempQ,tempQnot;
    
    wire notJclk,Jclk,J2;
    wire notKclk,Kclk,K2;
    
    nand_module inverter (clk,clk,notclk);
    
    nand_module NAND1(J,notclk,notJclk);  
    nand_module NAND2(notJclk,notJclk,Jclk);
    nand_module NAND3(Jclk,Qnot,J2);
    
    nand_module NAND4(K,notclk,notKclk);  
    nand_module NAND5(notKclk,notKclk,Kclk);
    nand_module NAND6(Kclk,Q,K2);
    
    SR_latch SR1(J2,K2,tempQ,tempQnot);
    
    enabled_SR_latch slave(clk,tempQ,tempQnot,Q,Qnot);
    
endmodule    
*/
/*
module JK_flip_flop(clk,J,K,Q,Qnot);
    input wire J,K,clk;
    output wire Q,Qnot;
    wire notK,temp1,temp2,D;
    assign notK = ~K;
    nand_module NAND1(J,Qnot,temp1);
    nand_module NAND2(notK,Q,temp2);
    nand_module NAND3(temp1,temp2,D);
    
    D_flip_flop HE(clk,D,Q,Qnot);
endmodule
*/

module JK_flip_flop(clk,J,K,Q,Qnot);
    input wire J,K,clk;
    output wire Q,Qnot;
    wire temp1,temp2,S,R;
    nand_module NAND1(J,Qnot,temp1);
    nand_module NAND2(K,Q,temp2);
    nand_module inverter1(temp1,temp1,S);
    nand_module inverter2(temp2,temp2,R);
    
    SR_flip_flop flippy(clk,S,R,Q,Qnot);
endmodule

module pulse_generator(input[15:0] in, input clock, input load_flag, output reg o);
reg[15:0] out;

always @(posedge clock) begin
    //most significant bit is in out[15], so left circuluar shift will occur.
    out[0]<=  (out[15] & ~load_flag  ) | (in[0] & load_flag );
    out[1]<=  (out[0] & ~load_flag  ) | (in[1] & load_flag );
    out[2]<=  ( out[1] & ~load_flag  ) | (in[2] & load_flag );
    out[3]<=  ( out[2] & ~load_flag  ) | (in[3] & load_flag );
    out[4]<=  ( out[3] & ~load_flag  ) | (in[4] & load_flag );
    out[5]<=  ( out[4] & ~load_flag  ) | (in[5] & load_flag );
    out[6]<=  ( out[5] & ~load_flag  ) | (in[6] & load_flag );
    out[7]<=  ( out[6] & ~load_flag  ) | (in[7] & load_flag );
    out[8]<=  ( out[7] &  ~load_flag ) | (in[8] & load_flag );
    out[9]<=  ( out[8]   & ~load_flag) | (in[9] & load_flag );
    out[10]<= ( out[9]  & ~load_flag) | (in[10] & load_flag) ;
    out[11]<= ( out[10] & ~load_flag) | (in[11] & load_flag) ;
    out[12]<= ( out[11] & ~load_flag) | (in[12] & load_flag) ;
    out[13]<= ( out[12] & ~load_flag) | (in[13] & load_flag) ;
    out[14]<= ( out[13] & ~load_flag) | (in[14] & load_flag) ;
    out[15]<= ( out[14] & ~load_flag) | (in[15] & load_flag) ;
    o<=out[15];
end

endmodule