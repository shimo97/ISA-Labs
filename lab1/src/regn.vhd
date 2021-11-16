LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY regn IS
	GENERIC ( N : integer:=8);
	PORT (R : IN std_logic_vector(N-1 DOWNTO 0);
			Clock, Resetn, load : IN STD_LOGIC;
			Q : OUT std_logic_vector(N-1 DOWNTO 0));
END regn;

ARCHITECTURE Behavior OF regn IS

BEGIN

	PROCESS (Clock, Resetn)
	BEGIN
		IF (Resetn = '0') THEN
			Q <= (OTHERS => '0');
			IF (load = '1') THEN
				Q <= R;
			END IF;
		END IF;
	END PROCESS;
	
END Behavior;