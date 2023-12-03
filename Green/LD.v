// Spencer Dugas

// Load 

module LD (ins, outa, outb);
    input [15:0] ins;
    wire [7:0] addr;
    output [15:0] out;
    wire [15:0] temp, data;

    assign addr = ins [7:0];

    //assign output 8 bits
    assign temp = (ins [10])?(addr):(/*load data here*/ data);

    //High or Low

    assign out = (!ins [10])?(temp):
                    (ins [9])?(temp):(temp<<8);

endmodule