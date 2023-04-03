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

module enabled_D_latch_test();
    reg enabled, D;
    wire Q, Qnot;
    
    enabled_D_latch uut(enabled,D,Q,Qnot);
    initial begin
        enabled=0; D=0; #200;
        enabled=1; D=1; #200;
        enabled=0; D=1; #200;
        enabled=1; D=1; #200;
        enabled=1; D=0; #200;
    end 
endmodule

module D_flip_flop_test();
    reg clk, D;
    wire Q, Qnot;
    
    D_flip_flop uut(clk,D,Q,Qnot);
    initial begin
        clk=0; 
        forever #20 clk = ~clk;    
    end
    initial begin
        D=0; #100;
        D=1; #100;
        D=1; #100;
        D=0; #100;
        D=1; #100;
        D=0; #100;
        D=0; #100;
        D=1; #100;
        D=0; #100;
        D=1; #100;
    end
endmodule

/*
module edge_detector_test();
    reg clk;
    wire o;
    edge_detector uut(clk,o);
    initial begin
    clk = 0;
    forever #50 clk = ~clk;
    end
endmodule
*/
module JK_flip_flop_test();
    reg J,K,clk;
    wire Q,Qnot;
    JK_flip_flop uut(clk,J,K,Q,Qnot);
    initial begin
        clk=0; 
        forever #20 clk = ~clk;   
    end
    initial begin
        J=0; K=0; #125;
        J=0; K=1; #125;
        J=1; K=0; #125;
        J=1; K=1; #125;
        J=1; K=0; #125;
        J=1; K=1; #125;
        J=0; K=0; #125;
        J=0; K=1; #125;
    end
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