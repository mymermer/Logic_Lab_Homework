`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Abdullah Jafar Mansour Shamout 150200919
//
//////////////////////////////////////////////////////////////////////////////////


module Tristate_buffer_test();
reg [7:0]I;
reg E;
wire [7:0]O;

Tristate_buffer uut(I,E,O);

initial begin
    I=8'd14;     E=0;    #200;   
    I=8'd5;      E=1;    #200;   
    I=8'd17;     E=1;    #200;    
    I=8'd5;      E=0;    #200;
    I=8'd25;     E=1;    #200;
end

endmodule



module Memory_8bit_test();
reg [7:0]I;
reg clk;
reg select;
reg read;
reg write;
reg reset;
wire [7:0]O;

Memory_8bit uut(clk,I,select,read,write,reset,O);

    initial begin
        clk=0; 
        forever #20 clk = ~clk;    
    end

initial begin
    I=8'd14;     select=0;  read=0;     write=1;    reset=1;    #100; //reset is active negedge     
    I=8'd5;      select=0;  read=0;     write=1;    reset=0;    #100; //reset is active negedge   
    I=8'd5;      select=1;  read=1;     write=1;    reset=1;    #100; //reset is active negedge
    I=8'd17;     select=1;  read=1;     write=0;    reset=1;    #100; //reset is active negedge  
    I=8'd25;     select=1;  read=0;     write=1;    reset=1;    #100; //reset is active negedge
    I=8'd14;     select=0;  read=0;     write=0;    reset=0;    #100; //reset is active negedge   
    I=8'd5;      select=1;  read=1;     write=0;    reset=0;    #100; //reset is active negedge   
    I=8'd17;     select=1;  read=1;     write=1;    reset=1;    #100; //reset is active negedge   
    I=8'd5;      select=1;  read=1;     write=1;    reset=1;    #100; //reset is active negedge
    I=8'd25;     select=1;  read=0;     write=0;    reset=0;    #100; //reset is active negedge
end

endmodule

module Memory_8byte_test();
reg [7:0]I;
reg clk;
reg [2:0]address;
reg chipselect;
reg read;
reg write;
reg reset;
wire [7:0]O;

Memory_8byte uut(clk,I,address,chipselect,read,write,reset,O);
    initial begin
        clk=0; 
        forever #20 clk = ~clk;    
    end

initial begin
    I=8'd15;    address=3'd0;    chipselect=1;    read=1;     write=0;    reset=1;    #100;
    I=8'd15;    address=3'd0;    chipselect=1;    read=1;     write=0;    reset=0;    #100; //reset all lines

    I=8'd25;    address=3'd3;    chipselect=1;    read=1;     write=1;    reset=1;    #100; //writing to address 3 <= 25 and reading from address 3

    I=8'd15;    address=3'd2;    chipselect=1;    read=0;     write=1;    reset=1;    #100; //writing to address 2 <= 15 and not reading anything "High impedence"

    I=8'd15;    address=3'd4;    chipselect=1;    read=1;     write=0;    reset=1;    #100; //reading the from address 4

    I=8'd18;    address=3'd5;    chipselect=1;    read=0;     write=1;    reset=1;    #100; //writing to address 5 <= 18 and not reading anything "High impedence"
    I=8'd18;    address=3'd6;    chipselect=1;    read=1;     write=0;    reset=1;    #100; //reading from address 6
    I=8'd18;    address=3'd5;    chipselect=1;    read=1;     write=0;    reset=1;    #100; //reading from address 5  
    I=8'd18;    address=3'd3;    chipselect=1;    read=1;     write=0;    reset=1;    #100; //reading from address 3   
end

endmodule

