// Andrew Doucet
// Spencer Dugas

// Branch instruction
module BR (opCode, ZNC, BR);

  // I/O
  input [15:0] opCode;
  input [2:0] ZNC;
  output reg BR;

  // Updates branch based off of ZNC
  always@(opCode,ZNC)
  begin
    BR = 0;

    if (~opCode[11])
    begin

      // Branch if zero
      if (opCode[10] && ZNC[2])
        BR = 1;

      // Branch if negative
      if (opCode[9] && ZNC[1])
        BR = 1;
      
      // Branch if carry
      if (opCode[8] && ZNC[0])
        BR = 1;

      // Branch always
      if (~opCode[10] && ~opCode[9] && ~opCode[8])
        BR = 1;
    end

    if (opCode[11])
    begin

      // Branch if not zero
      if (opCode[10] && ~ZNC[2])
        BR = 1;

      // Branch if not negative
      if (opCode[9] && ~ZNC[1])
        BR = 1;

      // Branch if not carry
      if (opCode[8] && ~ZNC[0])
        BR = 1;

      // Branch always
      if (opCode[10] && opCode[9] && opCode[8])
        BR = 1;
    end
    
  end

endmodule
