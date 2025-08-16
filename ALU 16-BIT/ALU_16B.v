module ALU_16B (
    input [15:0]A,
    input [15:0]B,
    input [3:0]ALU_FUN,
    input CLK,
    output reg [15:0]ALU_OUT,
    output reg Carry_Flag,
    output reg Arith_Flag,
    output reg Logic_Flag,
    output reg CMP_Flag,
    output reg Shift_Flag
);

    reg [16:0] temp;

    always @(negedge CLK) begin
        ALU_OUT <= 16'b0;
        Carry_Flag <= 1'b0;
        Arith_Flag <= 1'b0;
        Logic_Flag <= 1'b0;
        CMP_Flag <= 1'b0;
        Shift_Flag <= 1'b0;

        case (ALU_FUN)
            4'b0000: begin
                temp <= A + B;
                ALU_OUT <= temp[15:0];
                Carry_Flag <= temp[16];
                Arith_Flag <=1'b1;
            end
            4'b0001: begin
                temp <= A -B;
                ALU_OUT <=  temp[15:0];
                Carry_Flag <=  temp[16];
                Arith_Flag <= 1'b1;
            end
            4'b0010: begin
                ALU_OUT <= A * B;
                Arith_Flag <= 1'b1; 
            end
            4'b0011: begin
                if (B != 0) begin
                    ALU_OUT <= A / B;
                end
                else begin
                ALU_OUT <= 16'd0;
                end
                Arith_Flag <= 1'b1;
            end
            4'b0100: begin
                ALU_OUT <= A & B;
                Logic_Flag <= 1'b1;
            end

            4'b0101: begin
                ALU_OUT <= A | B;
                Logic_Flag <= 1'b1;
            end

            4'b0110: begin
                ALU_OUT <= ~(A & B);
                Logic_Flag <= 1'b1;
            end

            4'b0111: begin
                ALU_OUT <= ~(A | B);
                Logic_Flag <= 1'b1;
            end

            4'b1000: begin
                ALU_OUT <= A ^ B;
                Logic_Flag <= 1'b1;
            end

            4'b1001: begin
                ALU_OUT <= ~(A ^ B);
                Logic_Flag <= 1'b1;
            end
            4'b1010: begin
                ALU_OUT <= (A == B) ? 16'd1 : 16'b0;
                CMP_Flag <= 1'b1;    
            end
            4'b1011: begin
                ALU_OUT <= (A > B) ? 16'd2 : 16'b0;
                CMP_Flag <= 1'b1;    
            end
            4'b1100: begin
                ALU_OUT <= (A < B) ? 16'd3 : 16'b0;
                CMP_Flag <= 1'b1;    
            end
            4'b1101: begin
                ALU_OUT <=  A >> 1;
                Shift_Flag <=1'b1;
            end
            4'b1110: begin
                ALU_OUT <=  A << 1;
                Shift_Flag <=1'b1;
            end
            default: ALU_OUT <= 16'd0;
        endcase
    end
endmodule