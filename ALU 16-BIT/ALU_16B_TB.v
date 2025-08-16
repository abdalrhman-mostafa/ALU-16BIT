`timescale 1ns/1ps
module ALU_16B_TB ();
reg [15:0] A;
reg [15:0] B;
reg [3:0] ALU_FUN;
reg CLK;
wire [15:0] ALU_OUT;
wire Carry_Flag;
wire Arith_Flag;
wire Logic_Flag;
wire CMP_Flag;
wire Shift_Flag;

ALU_16B DUT(
    .A(A),
    .B(B),
    .ALU_FUN(ALU_FUN),
    .CLK(CLK),
    .ALU_OUT(ALU_OUT),
    .Carry_Flag(Carry_Flag),
    .Arith_Flag(Arith_Flag),
    .Logic_Flag(Logic_Flag),
    .CMP_Flag(CMP_Flag),
    .Shift_Flag(Shift_Flag)
);
always begin
    CLK <= 1'b0;
    #5000;
    CLK <= 1'b1;
    #5000;
end

initial begin
        
        A = 16'd15;
        B = 16'd20;
        ALU_FUN = 4'b0000;
        @(negedge CLK);
        @(negedge CLK);
        #10000;
        


        A = 16'd10;
        B = 16'd8;
        ALU_FUN = 4'b0001;
        @(negedge CLK);
        @(negedge CLK);
        #10000;
        
        A = 16'd23;
        B = 16'd19;
        ALU_FUN = 4'b0010;
        @(negedge CLK);
        @(negedge CLK);
        #10000;
        
        A = 16'd32;
        B = 16'd4;
        ALU_FUN = 4'b0011;
        @(negedge CLK);
        @(negedge CLK);     
        #10000;

        A = 16'd23;
        B = 16'd54;
        ALU_FUN = 4'b0100;
        @(negedge CLK);
        @(negedge CLK);
        #10000;
        
        ALU_FUN = 4'b0110;
        @(negedge CLK);
        @(negedge CLK);
        #10000;
        
        ALU_FUN = 4'b0101;
        @(negedge CLK);
        @(negedge CLK);
        #10000;
        
        ALU_FUN = 4'b0111;
        @(negedge CLK);
        @(negedge CLK);
        #10000;
        
        ALU_FUN = 4'b1000;
        @(negedge CLK);
        @(negedge CLK);
        #10000;
        
        ALU_FUN = 4'b1001;
        @(negedge CLK);
        @(negedge CLK);       
        #10000;

        A = 16'd26;
        B = 16'd26;
        ALU_FUN = 4'b1010;
        @(negedge CLK);
        @(negedge CLK);
        #10000;
        
        A = 16'd43;
        B = 16'd49;
        ALU_FUN = 4'b1011;
        @(negedge CLK);
        @(negedge CLK);
        #10000;

        A = 16'd31;
        B = 16'd91;
        ALU_FUN = 4'b1100;
        @(negedge CLK);
        @(negedge CLK);
        #10000;
        
        A = 16'd20;
        ALU_FUN = 4'b1101;
        @(negedge CLK);
        @(negedge CLK);
        #10000;

        A = 16'd31;
        ALU_FUN = 4'b1110;
        @(negedge CLK);
        @(negedge CLK);
        #10000;

    
        $stop;
end
endmodule
