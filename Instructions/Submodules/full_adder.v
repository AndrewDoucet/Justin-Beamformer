//Andrew Doucet
//Spencer Dugas

// Full Adder
module full_adder (A,B,cin,cout,sum);
    input A, B, cin;
    output cout, sum;
    wire c1,c2, sum1,sum2;

    half_adder HA1(A,B,c1,sum1);
    half_adder HA2(cin,sum1,c2,sum2);
    assign sum = sum2;
    assign cout = c1 | c2;
endmodule