library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_gate_tb is
end and_gate_tb;

architecture test of and_gate_tb is
  signal a, b, y : STD_LOGIC;
begin
  -- Instantiate the Unit Under Test (UUT)
  uut: entity work.and_gate
    port map (
      a => a,
      b => b,
      y => y
    );

  -- Stimulus Process
  stim_proc: process
  begin
    -- Test case 1
    a <= '0'; b <= '0';
    wait for 1 ns;
    report "a=0, b=0 -> y=" & std_logic'image(y);

    -- Test case 2
    a <= '0'; b <= '1';
    wait for 1 ns;
    report "a=0, b=1 -> y=" & std_logic'image(y);

    -- Test case 3
    a <= '1'; b <= '0';
    wait for 1 ns;
    report "a=1, b=0 -> y=" & std_logic'image(y);

    -- Test case 4
    a <= '1'; b <= '1';
    wait for 1 ns;
    report "a=1, b=1 -> y=" & std_logic'image(y);

    -- End of test
    wait;
  end process;

end test;
