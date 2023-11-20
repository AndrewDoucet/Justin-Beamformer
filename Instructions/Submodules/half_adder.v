//Andrew Doucet
//Spencer Dugas

// Half Adder
module half_adder (A,B,carry,sum);
    input A, B;
    output carry, sum;

    assign sum = A ^ B;
    assign carry = A & B;
endmodule
