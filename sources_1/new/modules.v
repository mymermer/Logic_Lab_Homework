`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Abdullah Jafar Mansour Shamout 150200919
//
//////////////////////////////////////////////////////////////////////////////////


module Tristate_buffer(I,E,O);
    input wire [7:0] I;
    input wire E;
    output wire [7:0] O;
    assign O = E ? I : 8'bZ;
endmodule

module Bus_8bit(D1,D2,S,O);
    input wire [7:0] D1;
    input wire [7:0] D2;
    input wire S;
    output wire [7:0] O;
    wire [7:0] O1;
    wire [7:0] O2;
    Tristate_buffer buf1(D1,~S,O1);
    Tristate_buffer buf2(D2,S,O2);
    assign O = O1|O2; 
endmodule

module Memory_8bit(clk,I,select,read,write,reset,O);
    input wire [7:0] I;
    input wire select,clk,read,write,reset;
    output reg [7:0] O;
    reg [7:0] storage;
    
    always @(posedge clk) begin
        if(select && write) begin
            storage <= I;
        end
    end
    
    always @(negedge reset) begin
            storage <= 8'd0;
    end
    
    always @(*)begin
        if(select && read) begin
            O <= storage;
        end
        else begin
            O <= 8'bZ;
        end
    end
endmodule

module Memory_8byte(clk,I,address,chipselect,read,write,reset,O);
    input wire [7:0] I;
    input wire clk,read,write,reset;
    input wire chipselect;
    input wire [2:0] address;
    wire [7:0] tempO;
    output wire [7:0] O;
    wire [7:0] ATS; //Address table selection
        generate
            for (genvar i = 0; i < 8; i = i + 1) begin
                assign ATS[i] = (i == address) ? 1'b1 : 1'b0;
                Memory_8bit N(
                    .clk(clk),
                    .I(I),
                    .select(ATS[i]),
                    .read(read),
                    .write(write),
                    .reset(reset),
                    .O(tempO)
                );
            end
        endgenerate
    Tristate_buffer buf1(tempO,chipselect,O);
endmodule

