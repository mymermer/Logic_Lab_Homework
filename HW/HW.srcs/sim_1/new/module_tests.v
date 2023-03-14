`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//Abdullah Jafar Mansour Shamout 150200919
//Muhammed Yusuf Mermer 150220762
//////////////////////////////////////////////////////////////////////////////////

module and_module_test();
    reg in1;
    reg in2;
    
    wire o;
    
    and_module uut(in1,in2,o);
    
    initial begin
    in1=0;  in2=0;   #250;
    in1=0;  in2=1;   #250;
    in1=1;  in2=0;   #250;
    in1=1;  in2=1;   #250;
    end
endmodule

module or_module_test();
    reg in1;
    reg in2;
    
    wire o;
    
    or_module uut(in1,in2,o);
    
    initial begin
    in1=0;  in2=0;   #250;
    in1=0;  in2=1;   #250;
    in1=1;  in2=0;   #250;
    in1=1;  in2=1;   #250;
    end
endmodule

module not_module_test();
    reg in1;
    
    wire o;
    
    not_module uut(in1,o);
    
    initial begin
    in1=0;  #500;
    in1=1;  #500;
    end
endmodule

module nand_module_test();
    reg in1;
    reg in2;
    
    wire o;
    
    nand_module uut(in1,in2,o);
    
    initial begin
    in1=0;  in2=0;   #250;
    in1=0;  in2=1;   #250;
    in1=1;  in2=0;   #250;
    in1=1;  in2=1;   #250;
    end
endmodule

module xor_module_test();
    reg in1;
    reg in2;
    
    wire o;
    
    xor_module uut(in1,in2,o);
    
    initial begin
    in1=0;  in2=0;   #250;
    in1=0;  in2=1;   #250;
    in1=1;  in2=0;   #250;
    in1=1;  in2=1;   #250;
    end
endmodule

module decoder_3to8_module_test();
    reg in1;
    reg in2;
    reg in3;
    
    wire o1,o2,o3,o4,o5,o6,o7,o8;
    
    decoder_3to8_module uut(in1,in2,in3,o1,o2,o3,o4,o5,o6,o7,o8);
    
    initial begin
    in1=0;  in2=0;   in3=0;  #125;
    in1=0;  in2=0;   in3=1;  #125;
    in1=0;  in2=1;   in3=0;  #125;
    in1=0;  in2=1;   in3=1;  #125;
    in1=1;  in2=0;   in3=0;  #125;
    in1=1;  in2=0;   in3=1;  #125;
    in1=1;  in2=1;   in3=0;  #125;
    in1=1;  in2=1;   in3=1;  #125;
    end
endmodule

module F2_module_test();
    reg a;
    reg b;
    reg c;
    
    wire o;
    
    F2 uut(a,b,c,o);
    
    initial begin
    a=0;  b=0;   c=0;  #125;
    a=0;  b=0;   c=1;  #125;
    a=0;  b=1;   c=0;  #125;
    a=0;  b=1;   c=1;  #125;
    a=1;  b=0;   c=0;  #125;
    a=1;  b=0;   c=1;  #125;
    a=1;  b=1;   c=0;  #125;
    a=1;  b=1;   c=1;  #125;
    end
endmodule


module F3_module_test();
    reg a;
    reg b;
    reg c;
    
    wire o;
    
    F3 uut(a,b,c,o);
    
    initial begin
    a=0;  b=0;   c=0;  #125;
    a=0;  b=0;   c=1;  #125;
    a=0;  b=1;   c=0;  #125;
    a=0;  b=1;   c=1;  #125;
    a=1;  b=0;   c=0;  #125;
    a=1;  b=0;   c=1;  #125;
    a=1;  b=1;   c=0;  #125;
    a=1;  b=1;   c=1;  #125;
    end
endmodule

module bit_halfadder_module_test();
    reg in1;
    reg in2;
    
    wire sum,carry;
    
    bit_halfadder_module uut(in1,in2,sum,carry);
    
    initial begin
    in1=0;  in2=0;   #250;
    in1=0;  in2=1;   #250;
    in1=1;  in2=0;   #250;
    in1=1;  in2=1;   #250;
    end
endmodule

module bit_fulladder_module_test();
    reg in1;
    reg in2;
    reg cin;
    
    wire sum,carry;
    
    bit_fulladder_module uut(in1,in2,cin,sum,carry);
    
    initial begin
    in1=0;  in2=0;   cin=0;  #125;
    in1=0;  in2=0;   cin=1;  #125;
    in1=0;  in2=1;   cin=0;  #125;
    in1=0;  in2=1;   cin=1;  #125;
    in1=1;  in2=0;   cin=0;  #125;
    in1=1;  in2=0;   cin=1;  #125;
    in1=1;  in2=1;   cin=0;  #125;
    in1=1;  in2=1;   cin=1;  #125;
    end
endmodule