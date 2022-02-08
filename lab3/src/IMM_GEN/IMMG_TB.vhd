library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity IMMG_TB is
end entity;

architecture beh of IMMG_TB is

constant Tclk : time := 10 ns; --T clk
constant Tco : time := 1 ns; --T clk to output

signal go : std_logic :='1';

signal RST_n :std_logic := '0';
signal CLK : std_logic;

signal INSTR : unsigned(31 downto 0);	--signal for dut
signal IMM : unsigned(31 downto 0);	--immediate generated by dut
signal EXP_IMM : unsigned(31 downto 0); --immediate expected 

signal ERR : std_logic; --error bit

component IMM_GEN
port(
	INSTR : in unsigned(31 downto 0); --first operand
	IMM : out unsigned(31 downto 0) --second operand
);
end component;

begin

CR: process --reset and clock process
begin
if RST_n = '0' then
	CLK<='0';
	wait for 0.8*Tclk;
	RST_n<='1';
else
	if go='1' then
		CLK<=not(CLK);
		wait for Tclk/2;
	else
		CLK<='0';
		wait;
	end if;
end if;
end process;

process (CLK, RST_n)
   	file fp_in : text open READ_MODE is "./IMMG_stim_res.hex"; --INPUT FILE
	variable data_in_var32 : std_logic_vector(31 downto 0); --32 bits input variable
	variable expected_imm : unsigned(31 downto 0) := (others=> '0'); --expected immediate
	variable line_in : line;

  begin  -- process
    if RST_n = '0' then                 -- asynchronous reset (active low)
      	INSTR <= (others => '0') after Tco; 
	ERR<='0';
	
    elsif CLK'event and CLK = '1' then  -- rising clock edge
	if (IMM /= expected_imm) then --checking output correctness
		ERR<='1';
	end if;
   
   	if not endfile(fp_in) then
	      	readline(fp_in, line_in);

	      	hread(line_in, data_in_var32);	--setting instruction
		INSTR<=unsigned(data_in_var32) after Tco;

		hread(line_in, data_in_var32);	--setting expected imm
		expected_imm:=unsigned(data_in_var32);
		EXP_IMM<=expected_imm;
	else
		go<='0';
	end if;
    end if;
end process;

DUT: IMM_GEN port map(INSTR=>INSTR,IMM=>IMM);

end architecture;
