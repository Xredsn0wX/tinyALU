----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/30/2019 12:16:59 AM
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           OP : in STD_LOGIC_VECTOR (2 downto 0);
           Output : out STD_LOGIC_VECTOR (3 downto 0);
           overflow: out STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

constant NOP: STD_LOGIC_VECTOR(2 downto 0):="000";
constant ADD: STD_LOGIC_VECTOR(2 downto 0):="001";
constant SUB: STD_LOGIC_VECTOR(2 downto 0):="010";
constant DAND: STD_LOGIC_VECTOR(2 downto 0):="011";
constant DOR: STD_LOGIC_VECTOR(2 downto 0):="100";
constant INV: STD_LOGIC_VECTOR(2 downto 0):="101";
constant DXOR: STD_LOGIC_VECTOR(2 downto 0):="110";



component RippleCarry is 
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           SUB : in STD_LOGIC;
           TSUM : out STD_LOGIC_VECTOR (3 downto 0);
           OVERFLOW : out STD_LOGIC);
end component;
signal SumWire,DiffWire, wireA: STD_LOGIC_VECTOR (3 downto 0);
signal overfloww, subCheck, suboverflow: STD_LOGIC;
begin
    Adder: RippleCarry port map (
        A => A,
        B=> B,
        Sub=> '0',
        TSUM =>SumWire,
        OVERFLOW=> overfloww);
    Subtractor: RippleCarry port map (
        A => A,
        B=> B,
        Sub=> '1',
        TSUM =>DiffWire,
        OVERFLOW=> suboverflow);
        
      
      
with OP select

        overflow <= (suboverflow or overfloww) when "001",
                    (suboverflow or overfloww) when "010",
                    '0' when others;

--with OP select
--    wireA<= "0001" when "010",
--            "0001" when "011",
--            A when others; 
    
with OP select
   Output <= "0000" when NOP,
              SumWire when "001", --Add
             DiffWire when "010",--Subtract
             (A and B) when "011",--And
             (A or B) when "100",--Or
             (A xor B) when "101",--Xor
             "0001" when others;
              


end Behavioral;
