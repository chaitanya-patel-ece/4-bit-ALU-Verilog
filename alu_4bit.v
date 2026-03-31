

module alu_4bit (
    input  [3:0] A,        // 4-bit operand A
    input  [3:0] B,        // 4-bit operand B
    input  [3:0] opcode,   // Operation selector
    output reg [4:0] result, // 5-bit result (4-bit + carry/borrow)
    output reg zero,         // Zero flag: 1 if result == 0
    output reg carry,        // Carry flag
    output reg equal,        // Equal flag: A == B
    output reg greater       // Greater flag: A > B
);

// -----------------------------------------------
// Opcode Definitions
// -----------------------------------------------
localparam ADD = 4'b0000;  // A + B
localparam SUB = 4'b0001;  // A - B
localparam AND = 4'b0010;  // A & B
localparam OR  = 4'b0011;  // A | B
localparam NOT = 4'b0100;  // ~A
localparam XOR = 4'b0101;  // A ^ B
localparam INC = 4'b0110;  // A + 1
localparam DEC = 4'b0111;  // A - 1
localparam EQ  = 4'b1000;  // A == B (result = 1 if true)
localparam GT  = 4'b1001;  // A > B  (result = 1 if true)

// -----------------------------------------------
// ALU Logic
// -----------------------------------------------
always @(*) begin
    // Default flag values
    zero    = 0;
    carry   = 0;
    equal   = 0;
    greater = 0;
    result  = 5'b00000;

    case (opcode)
        ADD: begin
            result = A + B;
            carry  = result[4];
        end

        SUB: begin
            result = A - B;
            carry  = (A < B) ? 1 : 0;  // borrow flag
        end

        AND: begin
            result = {1'b0, A & B};
        end

        OR: begin
            result = {1'b0, A | B};
        end

        NOT: begin
            result = {1'b0, ~A};
        end

        XOR: begin
            result = {1'b0, A ^ B};
        end

        INC: begin
            result = A + 1;
            carry  = result[4];
        end

        DEC: begin
            result = A - 1;
            carry  = (A == 0) ? 1 : 0;  // underflow
        end

        EQ: begin
            equal  = (A == B);
            result = {4'b0000, equal};
        end

        GT: begin
            greater = (A > B);
            result  = {4'b0000, greater};
        end

        default: begin
            result = 5'b00000;
        end
    endcase

    // Zero flag
    zero = (result[3:0] == 4'b0000) ? 1 : 0;
end

endmodule
