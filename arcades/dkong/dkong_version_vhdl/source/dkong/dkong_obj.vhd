--	(c) 2012 d18c7db(a)hotmail
--
-- Originally by Katsumi Degawa in Verilog
--
--	This program is free software; you can redistribute it and/or modify it under
--	the terms of the GNU General Public License version 3 or, at your option,
--	any later version as published by the Free Software Foundation.
--
--	This program is distributed in the hope that it will be useful,
--	but WITHOUT ANY WARRANTY; without even the implied warranty of
--	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--
-- For full details, see the GNU General Public License at www.gnu.org/licenses

-------------------------------------------------------------------------------------------
-- H_CNT[0],H_CNT[1],H_CNT[2],H_CNT[3],H_CNT[4],H_CNT[5],H_CNT[6],H_CNT[7],H_CNT[8],H_CNT[9]
--   1/2 H     1 H     2 H      4H       8H       16 H     32H      64 H     128 H   256 H
-------------------------------------------------------------------------------------------
-- V_CNT[0], V_CNT[1], V_CNT[2], V_CNT[3], V_CNT[4], V_CNT[5], V_CNT[6], V_CNT[7]
--    1 V      2 V       4 V       8 V       16 V      32 V      64 V     128 V
-------------------------------------------------------------------------------------------
-- VF_CNT[0],VF_CNT[1],VF_CNT[2],VF_CNT[3],VF_CNT[4],VF_CNT[5],VF_CNT[6],VF_CNT[7]
--    1 VF     2 VF      4 VF      8 VF      16 VF     32 VF     64 VF    128 VF
-------------------------------------------------------------------------------------------

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

library unisim;
	use unisim.vcomponents.all;

entity dkong_obj is
	port(
		CLK_24M		: in  std_logic;
		CLK_12M		: in  std_logic;
		I_OBJ_D		: in  std_logic_vector( 7 downto 0);
		I_2PSL		: in  std_logic;
		I_FLIPn		: in  std_logic;
		I_H_CNT		: in  std_logic_vector( 9 downto 0);
		I_VF_CNT		: in  std_logic_vector( 7 downto 0);
		I_CMPBLKn	: in  std_logic;
		I_OBJ_D1		: in  std_logic_vector( 7 downto 0);
		I_OBJ_D2		: in  std_logic_vector( 7 downto 0);
		I_OBJ_D3		: in  std_logic_vector( 7 downto 0);
		I_OBJ_D4		: in  std_logic_vector( 7 downto 0);
		O_OBJ_AB		: out std_logic_vector(11 downto 0);
		---- Debug ---------
		--------------------
		O_OBJ_DO		: out std_logic_vector( 5 downto 0);
		O_FLIP_VRAM	: out std_logic;
		O_FLIP_HV	: out std_logic;
		O_L_CMPBLKn	: out std_logic
	);
end dkong_obj;

architecture RTL of dkong_obj is
	signal RST_4L			: std_logic := '0';
	signal CLK_5L			: std_logic := '0';
	signal CLK_3E			: std_logic := '0';
	signal CLK_4L			: std_logic := '0';
	signal W_5B				: std_logic := '0';
	signal W_FLIP_1		: std_logic := '0';
	signal W_FLIP_2		: std_logic := '0';
	signal W_FLIP_3		: std_logic := '0';
	signal W_FLIP_4		: std_logic := '0';
	signal W_FLIP_5		: std_logic := '0';
	signal W_7H				: std_logic := '0';
	signal W_6L				: std_logic := '0';
	signal W_3P				: std_logic := '0';
	signal W_4L_Q			: std_logic := '0';
	signal W_5L_RST		: std_logic := '0';
	signal W_8N_Q			: std_logic := '0';
	signal W_6F				: std_logic := '0';
	signal W_5J				: std_logic := '0';
	signal W_6L1			: std_logic := '0';
	signal W_6H_G			: std_logic := '0';
	signal W_3E_RST		: std_logic := '0';
	signal W_3E_LD			: std_logic := '0';

	signal W_5F2_Q			: std_logic_vector( 3 downto 0) := (others => '0');
	signal WO_DB			: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_VFC_CNT		: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_6N_Q			: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_78R_A			: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_78R_B			: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_78R_Q			: std_logic_vector( 8 downto 0) := (others => '0');
	signal W_78P_A			: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_78P_B			: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_78P_Q			: std_logic_vector( 8 downto 0) := (others => '0');
	signal W_5L_Q			: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_6M_Q			: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_RAM_7M_AB	: std_logic_vector( 5 downto 0) := (others => '0');
	signal W_RAM_7M_DIB	: std_logic_vector( 8 downto 0) := (others => '0');
	signal W_RAM_7M_DOB	: std_logic_vector( 8 downto 0) := (others => '0');
	signal W_HD				: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_78K_Q			: std_logic_vector( 8 downto 0) := (others => '0');
	signal W_78J_Q			: std_logic_vector( 8 downto 0) := (others => '0');
	signal W_8H_Q			: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_6J_Q			: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_6K_D			: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_6K_Q			: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_6H_Q			: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_ROM_OBJ_AB	: std_logic_vector(10 downto 0) := (others => '0');
	signal W_OBJ_DO_7C	: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_OBJ_DO_7D	: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_OBJ_DO_7E	: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_OBJ_DO_7F	: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_8B_Y			: std_logic_vector( 3 downto 0) := (others => '0');
	signal C_8CD			: std_logic_vector( 1 downto 0) := (others => '0');
	signal I_8CD			: std_logic_vector(15 downto 0) := (others => '0');
	signal C_8EF			: std_logic_vector( 1 downto 0) := (others => '0');
	signal I_8EF			: std_logic_vector(15 downto 0) := (others => '0');
	signal reg_8EF			: std_logic_vector(15 downto 0) := (others => '0');
	signal reg_8CD			: std_logic_vector(15 downto 0) := (others => '0');
	signal W_3E_LD_DI		: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_3E_Q			: std_logic_vector( 7 downto 0) := (others => '0');
	signal W_RAM_2EH_DO	: std_logic_vector( 5 downto 0) := (others => '0');
	signal W_3J_B			: std_logic_vector( 5 downto 0) := (others => '0');
	signal W_RAM_2EH_DI	: std_logic_vector( 5 downto 0) := (others => '0');
	signal W_RAM_2EH_AB	: std_logic_vector( 7 downto 0) := (others => '0');

begin
	---- Debug ---------
	--------------------
	process(CLK_24M)
	begin
		if falling_edge(CLK_24M) then
			W_5B <= not (I_H_CNT(0) and I_H_CNT(1) and I_H_CNT(2) and I_H_CNT(3));
		end if;
	end process;

	process(CLK_24M)
	begin
		if falling_edge(CLK_24M) then
			case I_H_CNT(3 downto 2) is
				when "00" => W_5F2_Q <= "1110";
				when "01" => W_5F2_Q <= "1101";
				when "10" => W_5F2_Q <= "1011";
				when "11" => W_5F2_Q <= "0111";
				when others => null;
			end case;
		end if;
	end process;

	----------  FLIP ----------------------------------------------------
	W_FLIP_1		<= not I_FLIPn;					-- INV
	W_FLIP_2		<= not W_FLIP_1;					-- INV => XOR
	W_FLIP_3		<= not W_FLIP_2;					-- INV => XOR => INV
	W_FLIP_4		<=     W_FLIP_3 or W_5F2_Q(0);
	W_FLIP_5		<= not W_FLIP_4;

	O_FLIP_VRAM	<= W_FLIP_1;
	O_FLIP_HV	<= W_FLIP_3;

	-------  VFC_CNT[7:0] ------------------------------------------------
	process(I_H_CNT(9))
	begin
		if falling_edge(I_H_CNT(9)) then
			W_VFC_CNT <= I_VF_CNT;
		end if;
	end process;

	------  PARTS 6N
	process(CLK_12M)
	begin
		if falling_edge(CLK_12M) then
			W_6N_Q <= I_OBJ_D;
		end if;
	end process;

	W_78R_A <= W_6N_Q;
	W_78R_B <= "1111" & I_FLIPn & W_FLIP_1 & W_FLIP_1 & '1';
	W_78R_Q <= W_78R_A + (W_78R_B + "000000001");
	W_78P_A <= W_78R_Q(7 downto 0);
	W_78P_B <= I_VF_CNT;
	W_78P_Q <= W_78P_A + ('0' & W_78P_B);

	process(CLK_12M)
	begin
		if rising_edge(CLK_12M) then
			W_7H <= not (W_78P_Q(7) and W_78P_Q(6) and W_78P_Q(5) and W_78P_Q(4));
		end if;
	end process;

	process(CLK_24M)
	begin
		if falling_edge(CLK_24M) then
			CLK_4L <= not (I_H_CNT(0) and (not I_H_CNT(1)));
		end if;
	end process;

	W_6L <= not (W_5L_Q(6) or W_5L_Q(7));
	W_3P <= not (I_H_CNT(2) and I_H_CNT(3) and I_H_CNT(4) and I_H_CNT(5) and I_H_CNT(6) and I_H_CNT(7) and I_H_CNT(8) and W_6L);

	-- U_4L ---------------
	RST_4L <= not I_H_CNT(9);
	process(CLK_4L, RST_4L)
	begin
		if (RST_4L = '0') then
			W_4L_Q <= '0';
		elsif rising_edge(CLK_4L) then
			W_4L_Q <= not (W_7H and W_3P);
		end if;
	end process;

	CLK_5L	<= not (CLK_12M and (not I_H_CNT(9)) and W_4L_Q and W_6L);
	W_5L_RST	<= not I_H_CNT(9);

	process(CLK_5L, W_5L_RST)
	begin
		if (W_5L_RST = '0') then
			W_5L_Q <= (others => '0');
		elsif rising_edge(CLK_5L) then
			W_5L_Q <= W_5L_Q + 1;
		end if;
	end process;

	------  PARTS 6M  ----------------------------------------------
	process(CLK_12M)
	begin
		if falling_edge(CLK_12M) then
			W_6M_Q <= W_6N_Q;
		end if;
	end process;

	W_RAM_7M_AB		<= W_5L_Q(5 downto 0) when I_H_CNT(9) = '0' else I_H_CNT(7 downto 2);
	W_RAM_7M_DIB	<= W_6M_Q(7 downto 0) & W_3P;

	process(CLK_24M)
	begin
		if falling_edge(CLK_24M) then
			W_HD <= W_RAM_7M_DOB(8 downto 1);
		end if;
	end process;

	W_78K_Q	<= (W_RAM_7M_DOB(8 downto 1) + ("01111" & W_FLIP_5 & W_FLIP_4 & W_FLIP_4 & '1') ) + 1;
	W_78J_Q	<= W_78K_Q(7 downto 0) + ('0' & W_VFC_CNT);

	process(W_5F2_Q(0))
	begin
		if rising_edge(W_5F2_Q(0)) then
			W_8H_Q <= W_78J_Q(7 downto 0);
		end if;
	end process;

	process(W_5F2_Q(2))
	begin
		if rising_edge(W_5F2_Q(2)) then
			W_6J_Q <= W_HD(7 downto 0);
		end if;
	end process;

	W_6K_D <= W_6J_Q(7) & I_CMPBLKn & (not I_H_CNT(9)) & (not (I_H_CNT(9) or W_FLIP_2)) & W_6J_Q(3 downto 0);

	process(CLK_12M)
	begin
		if rising_edge(CLK_12M) then
			if (W_5B = '0') then
				W_6K_Q <= W_6K_D;
			end if;
		end if;
	end process;

	O_L_CMPBLKn <= W_6K_Q(6);

	U_8N : process(W_5F2_Q(0), I_H_CNT(9))
		subtype SLV2 is std_logic_vector(1 downto 0);
	begin
		if I_H_CNT(9) = '0' then
			W_8N_Q <= '0';
		elsif rising_edge(W_5F2_Q(0)) then
			W_8N_Q <= W_8N_Q or (not W_RAM_7M_DOB(0));
		end if;
	end process;

	W_6F	<= not (W_8H_Q(4) and W_8H_Q(5) and W_8H_Q(6) and W_8H_Q(7));
	W_5J	<= W_8N_Q or W_6F;
	W_6L1	<= not (W_5J or W_5B);

	------  PARTS 6H  ----------------------------------------------
	W_6H_G <= not W_5F2_Q(1);

	process(W_6H_G, W_HD(7 downto 0))
	begin
		if(W_6H_G = '1') then
			W_6H_Q <= W_HD(7 downto 0);
		end if;
	end process;

	W_ROM_OBJ_AB( 3 downto 0)	<= W_8H_Q(3 downto 0) xor (W_6H_Q(7) & W_6H_Q(7) & W_6H_Q(7) & W_6H_Q(7));
	W_ROM_OBJ_AB(10 downto 4)	<= W_6H_Q(6 downto 0);

	------  OBJ ROM  -----------------------------------------------
	O_OBJ_AB		<= '0' & W_ROM_OBJ_AB(10 downto 0);
	W_OBJ_DO_7C	<= I_OBJ_D1 when I_H_CNT(9) = '1' else x"00" ;
	W_OBJ_DO_7D	<= I_OBJ_D2 when I_H_CNT(9) = '1' else x"00" ;
	W_OBJ_DO_7E	<= I_OBJ_D3 when I_H_CNT(9) = '1' else x"00" ;
	W_OBJ_DO_7F	<= I_OBJ_D4 when I_H_CNT(9) = '1' else x"00" ;

	------  PARTS 8CD ----------------------------------------------
	C_8CD		<= W_8B_Y(1 downto 0);
	I_8CD		<= W_OBJ_DO_7C & W_OBJ_DO_7D;

	process(CLK_12M)
	begin
		if rising_edge(CLK_12M) then
			case C_8CD is
				when "00" => reg_8CD <= reg_8CD;
				when "10" => reg_8CD <= reg_8CD(14 downto 0) & '0';
				when "01" => reg_8CD <= '0' & reg_8CD(15 downto 1);
				when "11" => reg_8CD <= I_8CD;
				when others => null;
			end case;
		end if;
	end process;

	------  PARTS 8EF ----------------------------------------------
	C_8EF	<= W_8B_Y(1 downto 0);
	I_8EF	<= W_OBJ_DO_7E & W_OBJ_DO_7F;

	process(CLK_12M)
	begin
		if rising_edge(CLK_12M) then
			case C_8EF is
				when "00" => reg_8EF <= reg_8EF;
				when "10" => reg_8EF <= reg_8EF(14 downto 0) & '0';
				when "01" => reg_8EF <= '0' & reg_8EF(15 downto 1);
				when "11" => reg_8EF <= I_8EF;
				when others => null;
			end case;
		end if;
	end process;

	------  PARTS 8B  ----------------------------------------------
	W_8B_Y	<= reg_8CD(0) & reg_8EF(0) & W_6L1 & '1' when W_6K_Q(7) = '1' else reg_8CD(15) & reg_8EF(15) & '1' & W_6L1;

	------  PARTS 3E & 4E  -----------------------------------------
	process(CLK_24M)
	begin
		if falling_edge(CLK_24M) then
			CLK_3E <= ( (I_H_CNT(0) and W_6K_Q(5)) or (not CLK_12M) );
		end if;
	end process;

	W_3E_LD_DI	<= W_78K_Q(7 downto 0);
	W_3E_RST		<= W_6K_Q(5) or (not ((not  I_H_CNT(9)) and I_H_CNT(3) and I_H_CNT(2) and I_H_CNT(1) and I_H_CNT(0) ));
	W_3E_LD		<=                     not (I_H_CNT(9)  and I_H_CNT(3) and I_H_CNT(2) and I_H_CNT(1) and I_H_CNT(0) );

	process(CLK_3E, W_3E_LD, W_3E_RST)
	begin
		if rising_edge(CLK_3E) then
			if(W_3E_LD = '0') then
				W_3E_Q <= W_3E_LD_DI;
			elsif (W_3E_RST = '0') then
				W_3E_Q <= (others => '0');
			else
				W_3E_Q <= W_3E_Q + 1;
			end if;
		end if;
	end process;

	W_3J_B			<= W_6K_Q(3 downto 0) & W_8B_Y(2) & W_8B_Y(3);
	W_RAM_2EH_DI	<= "000000" when W_6K_Q(5) = '1' else W_3J_B when (W_8B_Y(2) or W_8B_Y(3)) = '1' else W_RAM_2EH_DO;
	W_RAM_2EH_AB	<= W_3E_Q when W_6K_Q(4) = '0' else not W_3E_Q;

	U_2EH_7M : entity work.ram_2EH7M
	port map (
		-- 256_6
		I_CLKA	=> CLK_24M,
		I_ADDRA	=> W_RAM_2EH_AB,
		I_DA		=> W_RAM_2EH_DI,
		I_CEA		=> '1',
		I_WEA		=> not CLK_3E,
		O_DA		=> W_RAM_2EH_DO,
		-- 64_9
		I_CLKB	=> not CLK_24M,
		I_ADDRB	=> W_RAM_7M_AB,
		I_DB		=> W_RAM_7M_DIB,
		I_CEB		=> '1',
		I_WEB		=> not CLK_5L,
		O_DB		=> W_RAM_7M_DOB
	);

	process(CLK_24M)
	begin
		if rising_edge(CLK_24M) then
			if (CLK_12M = '0') then
				O_OBJ_DO <= W_RAM_2EH_DO;
			end if;
		end if;
	end process;
end RTL;
