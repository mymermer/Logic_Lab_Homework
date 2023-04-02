`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Abdullah Jafar Mansour Shamout 150200919
//Muhammed Yusuf Mermer 150220762
//////////////////////////////////////////////////////////////////////////////////

module SR_latch_test();
    reg set;
    reg reset;
    
    wire Q, Qnot;
    
    SR_latch uut(set,reset,Q,Qnot);
    
    initial begin
        set=1; reset=1; #200;
        set=0; reset=0; #200;
        set=1; reset=0; #200;
        set=0; reset=1; #200;
        set=1; reset=1; #200;
    end
endmodule

module enabled_SR_latch_test();
    reg enabled,set,reset;
    wire Q,Qnot;
    
    enabled_SR_latch uut(enabled,set,reset,Q,Qnot);
    initial begin
        enabled= 0; set=0; reset=0; #150;
        enabled= 1; set=0; reset=0; #150;
        enabled= 1; set=0; reset=1; #150;
        enabled= 1; set=1; reset=0; #150;
        enabled= 1; set=0; reset=0; #150;
        enabled= 1; set=1; reset=1; #150;
    end   
endmodule

module D_latch_test();
    reg D;
    
    wire Q, Qnot;
    
    D_latch uut(D,Q,Qnot);
    
    initial begin
        D=1; #500;
        D=0; #500;
    end
endmodule





//change this
module JK_flipflop_test();
reg J,K,clock;
wire Q,Qnot;
JK_flipflop uut(J,K,clock,Q,Qnot);

initial begin

    clock=0;

    J=1'b 0; K=1'b 0; #250;
    J=1'b 0; K=1'b 1; #250;
    J=1'b 1; K=1'b 0; #250;
    J=1'b 1; K=1'b 1; #250;
end
always #125 clock=~clock;
endmodule



module pulse_generator_test_ ();
    reg[15:0] in;
    reg clock;
    reg load_flag;
    wire out;

    pulse_generator pg1(in,clock, load_flag, out);


    initial begin
    clock=0;
    load_flag=1;
    in=16'b101001001010100;   #500;
    in=16'b010010110001101;  #500;
    
    end
always #15 clock=~clock;
always #100 load_flag=~load_flag;

endmodule