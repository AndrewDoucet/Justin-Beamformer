//andrew Doucet

module BR (opCode, ZNC, BR);
    input [15:0] opCode;
    input [2:0] ZNC;
    output reg BR;

  always@(opCode,ZNC)
  begin
    BR = 0;

    if (~opCode[11])
    begin
      if (opCode[10] && ZNC[2])
        BR = 1;
      if (opCode[9] && ZNC[1])
        BR = 1;
      if (opCode[8] && ZNC[0])
        BR = 1;
      if (~opCode[10] && ~opCode[9] && ~opCode[8])
        BR = 1;
    end

    if (opCode[11])
    begin
      if (opCode[10] && ~ZNC[2])
        BR = 1;
      if (opCode[9] && ~ZNC[1])
        BR = 1;
      if (opCode[8] && ~ZNC[0])
        BR = 1;
      if (opCode[10] && opCode[9] && opCode[8])
        BR = 1;
    end
    
  end

endmodule
