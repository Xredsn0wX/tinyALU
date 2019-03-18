----------------------------------------------------------------------------------
-- Company:
-- Engineer: Tristan Tamanji-Stein
--
-- Create Date: 01/30/2019 02:43:29 AM
-- Design Name:
-- Module Name: TopLvl - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cmpen296TopLvl is
    Port ( clk : in STD_LOGIC;
            led: out STD_LOGIC_VECTOR (5 downto 0));
          --  sw: in STD_LOGIC_VECTOR (15 downto 0));
end cmpen296TopLvl;

architecture Behavioral of cmpen296TopLvl is
component ALU is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           OP : in STD_LOGIC_VECTOR (2 downto 0);
           Output : out STD_LOGIC_VECTOR (3 downto 0);
           overflow: out STD_LOGIC);
end component;

component ROM is
    Port ( Address : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           Data_out : out STD_LOGIC_VECTOR (9 downto 0));
end component;

component FourBitRegister is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           Load : in STD_LOGIC;
           clr : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;


component pulsegen is
    Port ( EN : in STD_LOGIC;
           clk : in STD_LOGIC;
           pulseout : out STD_LOGIC);
end component;
component counter is
    Port ( clk : in STD_LOGIC;
           en : in STD_LOGIC;
           clr : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR (7 downto 0));
end component;


signal ROM_data: STD_LOGIC_VECTOR(9 downto 0);
signal ALU_out, Accum_Out: STD_LOGIC_VECTOR (3 downto 0);
signal divClk: STD_LOGIC;
signal addressBus: STD_LOGIC_VECTOR (7 downto 0);
signal aluOverflow, branchLessZ : STD_LOGIC;


begin



program_counter: counter port map(
    clk =>divClk,
    en => '1',
    clr => '0',
    count => addressBus
);

clkDiv : pulsegen port map(
EN=> '1',
clk => clk,
pulseout => divClk
);

ROM0:ROM Port map(
Address=> addressBus,
Data_out=> ROM_data,
clk=> divClk);

Accumulator:FourBitRegister port map(
D=> ALU_out,
Load =>ROM_data(8),
clr => ROM_data(7),
clk => divClk,
Q => Accum_Out);

ALU0: ALU port map(
A=> ROM_data (6 downto 3),
B=> Accum_Out,
OP=> ROM_Data (2 downto 0),
Output => ALU_out,
overflow =>led (4));



led(3 downto 0) <= Accum_Out;
led(5) <=  Accum_Out(3);
end Behavioral;
