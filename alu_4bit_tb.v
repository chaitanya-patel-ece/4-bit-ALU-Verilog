
`timescale 1ns / 1ps

module alu_4bit_tb;

    // Inputs
    reg [3:0] A;
    reg [3:0] B;
    reg [3:0] opcode;

    // Outputs
    wire [4:0] result;
    wire zero, carry, equal, greater;

    // Instantiate the ALU
    alu_4bit uut (
        .A(A),
        .B(B),
        .opcode(opcode),
        .result(result),
        .zero(zero),
        .carry(carry),
        .equal(equal),
        .greater(greater)
    );

    // Task to display results
    task show_result;
        input [63:0] op_name; // just for display
        begin
            #10;
            $display("OP: %s | A=%b(%0d) B=%b(%0d) | Result=%b(%0d) | Zero=%b Carry=%b Equal=%b Greater=%b",
                op_name, A, A, B, B, result, result, zero, carry, equal, greater);
        end
    endtask

    initial begin
        $display("==============================================");
        $display("       4-bit ALU Testbench - Chaitanya Patel ");
        $display("==============================================");

        // ---- ADD ----
        A = 4'd5; B = 4'd3; opcode = 4'b0000;
        #10; $display("ADD  | A=%0d B=%0d | Result=%0d | Carry=%b", A, B, result, carry);

        // ADD with carry
        A = 4'd15; B = 4'd3; opcode = 4'b0000;
        #10; $display("ADD(carry) | A=%0d B=%0d | Result=%0d | Carry=%b", A, B, result, carry);

        // ---- SUB ----
        A = 4'd9; B = 4'd4; opcode = 4'b0001;
        #10; $display("SUB  | A=%0d B=%0d | Result=%0d | Carry(borrow)=%b", A, B, result, carry);

        // SUB with borrow
        A = 4'd3; B = 4'd7; opcode = 4'b0001;
        #10; $display("SUB(borrow) | A=%0d B=%0d | Result=%0d | Carry=%b", A, B, result, carry);

        // ---- AND ----
        A = 4'b1100; B = 4'b1010; opcode = 4'b0010;
        #10; $display("AND  | A=%b B=%b | Result=%b", A, B, result[3:0]);

        // ---- OR ----
        A = 4'b1100; B = 4'b1010; opcode = 4'b0011;
        #10; $display("OR   | A=%b B=%b | Result=%b", A, B, result[3:0]);

        // ---- NOT ----
        A = 4'b1010; B = 4'b0000; opcode = 4'b0100;
        #10; $display("NOT  | A=%b | Result=%b", A, result[3:0]);

        // ---- XOR ----
        A = 4'b1100; B = 4'b1010; opcode = 4'b0101;
        #10; $display("XOR  | A=%b B=%b | Result=%b", A, B, result[3:0]);

        // ---- INC ----
        A = 4'd6; B = 4'd0; opcode = 4'b0110;
        #10; $display("INC  | A=%0d | Result=%0d", A, result);

        // INC overflow
        A = 4'd15; B = 4'd0; opcode = 4'b0110;
        #10; $display("INC(overflow) | A=%0d | Result=%0d | Carry=%b", A, result, carry);

        // ---- DEC ----
        A = 4'd6; B = 4'd0; opcode = 4'b0111;
        #10; $display("DEC  | A=%0d | Result=%0d", A, result);

        // DEC underflow
        A = 4'd0; B = 4'd0; opcode = 4'b0111;
        #10; $display("DEC(underflow) | A=%0d | Result=%0d | Carry=%b", A, result, carry);

        // ---- EQUAL ----
        A = 4'd7; B = 4'd7; opcode = 4'b1000;
        #10; $display("EQ   | A=%0d B=%0d | Equal=%b", A, B, equal);

        A = 4'd5; B = 4'd8; opcode = 4'b1000;
        #10; $display("EQ   | A=%0d B=%0d | Equal=%b", A, B, equal);

        // ---- GREATER ----
        A = 4'd9; B = 4'd5; opcode = 4'b1001;
        #10; $display("GT   | A=%0d B=%0d | Greater=%b", A, B, greater);

        A = 4'd3; B = 4'd8; opcode = 4'b1001;
        #10; $display("GT   | A=%0d B=%0d | Greater=%b", A, B, greater);

        // ---- ZERO FLAG ----
        A = 4'd0; B = 4'd0; opcode = 4'b0000;
        #10; $display("ZERO FLAG | A=%0d B=%0d | Result=%0d | Zero=%b", A, B, result, zero);

        $display("==============================================");
        $display("         Simulation Complete");
        $display("==============================================");
        $finish;
    end

    // Generate VCD waveform for Vivado
    initial begin
        $dumpfile("alu_4bit.vcd");
        $dumpvars(0, alu_4bit_tb);
    end

endmodule
