`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Abdullah Jafar Mansour Shamout 150200919
//Muhammed Yusuf Mermer 150220762
//////////////////////////////////////////////////////////////////////////////////

module SR_latch_test();
    reg set;
    reg reset;
    
    wire Q, notQ;
    
    SR_latch uut(set,reset,Q,notQ);
    
    initial begin
        set=0; reset=0; #250;
        set=1; reset=0; #250;
        set=0; reset=1; #250;
        set=1; reset=1; #250;
    end
endmodule

module enabled_SR_latch_test();
    reg enabled,set,reset;
    wire Q,notQ;
    enabled_SR_latch uut(enabled,set,reset,Q,notQ);
    initial begin
        enabled= 0; set=0; reset=0; #125;
        enabled= 0; set=0; reset=1; #125;
        enabled= 0; set=1; reset=0; #125;
        enabled= 0; set=1; reset=1; #125;
        enabled= 1; set=0; reset=0; #125;
        enabled= 1; set=0; reset=1; #125;
        enabled= 1; set=1; reset=0; #125;
        enabled= 1; set=1; reset=1; #125;
    end   
endmodule


module JK_flipflop_test();
reg J,K,clock;
wire Q,Qnot;
JK_flipflop uut(J,K,clock,Q,Qnot);

initial begin
    clock=;
    J=1'b 0; K=1'b 0; #250;
    J=1'b 0; K=1'b 1; #250;
    J=1'b 1; K=1'b 0; #250;
    J=1'b 1; K=1'b 1; #250;
end
always #125 clock=~clock;
endmodule
