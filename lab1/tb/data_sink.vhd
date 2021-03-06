library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;
use ieee.std_logic_misc.all;

library std;
use std.textio.all;

entity data_sink is
  generic(Nb : integer :=12; --number of data bits
  	  clkdelay : integer :=2);  --latency of filter (from input data sampling to output data sampling, must be >= 2)
  port (
    CLK   : in std_logic;
    RST_n : in std_logic;
    VIN   : in std_logic;
    DUT_VIN : in std_logic;
    DIN   : in std_logic_vector(Nb-1 downto 0);
    ERR: buffer std_logic_vector(3 downto 0));
end data_sink;

architecture beh of data_sink is
  signal VIN_shift : std_logic_vector(0 to clkdelay-1);  --shift register to propagate VIN
  constant tco : time := 1 ns; --T clk to output
begin  -- beh

  process (CLK, RST_n)
    file res_fp : text open WRITE_MODE is "../results.txt"; --output file
    variable line_out : line;

    file fp_in : text open READ_MODE is "../output.txt"; --input file (of output samples)
    variable line_in : line;
    variable x : integer;
    variable correct_out : std_logic_vector(Nb-1 downto 0); --correct output read from file

  begin  -- process
    if RST_n = '0' then                 -- asynchronous reset (active low)
      ERR(3 downto 1) <= (others => '0');	--resetting error vector (except for global error to avoid multiple driving)
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      if (VIN_shift(clkdelay-1) = '1') then --expected VIN=1
        if (VIN = '1') then
          write(line_out, conv_integer(signed(DIN))); --writing found value into file
          writeline(res_fp, line_out);

          if not endfile(fp_in) then --check result correctness
            readline(fp_in, line_in);
            read(line_in, x);
            correct_out := conv_std_logic_vector(x, Nb);
            if (correct_out /= DIN) then --if sample is different
              ERR(1)<='1';
            end if;
          else --expected sample not found on file
            ERR(3)<='1';
      end if;
        else --VIN=1 expected but not found
          ERR(2)<='1';
        end if;
      end if;
    end if;
  end process;

  process (CLK, RST_n) --VIN shift register process
  begin  -- process
    if RST_n = '0' then                 -- asynchronous reset (active low)
      VIN_shift <= (others => '0') after tco;
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      VIN_shift(1 to clkdelay-1) <= VIN_shift(0 to clkdelay-2) after tco; --shifting
      VIN_shift(0) <= DUT_VIN after tco; --inserting dut VIN
    end if;
  end process;

  ERR(0)<= or_reduce(ERR(3 downto 1)); --global error high if one error occurred

end beh;
