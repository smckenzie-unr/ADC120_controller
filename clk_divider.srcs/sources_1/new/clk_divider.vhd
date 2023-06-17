----------------------------------------------------------------------------------
-- Company: McKenzie Inc.
-- Engineer: Scott McKenzie
-- 
-- Create Date: 06/14/2023 03:08:07 PM
-- Design Name: Clock Divider
-- Module Name: clk_divider - clk_logic
-- Project Name: N/A
-- Target Devices: ZCU104 Dev Board
-- Tool Versions: N/A
-- Description: This module takes a generic clock divider value and uses it to divide down input clock and output the new divided down clock.
-- 
-- Dependencies: N/A
-- 
-- Revision: A
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clk_divider is
    generic(clk_divider : integer := 2);
    port(clk_in : in std_logic;
         arstn_in : in std_logic;
         enablen_in : in std_logic;
         clk_out : out std_logic);
end clk_divider;

architecture clk_logic of clk_divider is
    signal counter_reg : integer range 0 to (clk_divider*2) := 0;
begin
    process(clk_in, arstn_in)
    begin
        if(arstn_in = '0') then
            counter_reg <= 0;
            clk_out <= '1';
        elsif(rising_edge(clk_in)) then
            if(enablen_in = '0') then
                if(counter_reg = (clk_divider*2-1)) then
                    clk_out <= '1';
                    counter_reg <= 0;
                elsif(counter_reg >= (clk_divider-1)) then
                    clk_out <= '0';
                    counter_reg <= counter_reg + 1;
                else
                    counter_reg <= counter_reg + 1;
                end if;
            else
                clk_out <= '1';
            end if;
        end if;
    end process;
end clk_logic;
