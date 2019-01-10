-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity progrom_2 is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of progrom_2 is

  function romgen_str2bv (str : string) return bit_vector is
    variable result : bit_vector (str'length*4-1 downto 0);
  begin
    for i in 0 to str'length-1 loop
      case str(str'high-i) is
        when '0'       => result(i*4+3 downto i*4) := x"0";
        when '1'       => result(i*4+3 downto i*4) := x"1";
        when '2'       => result(i*4+3 downto i*4) := x"2";
        when '3'       => result(i*4+3 downto i*4) := x"3";
        when '4'       => result(i*4+3 downto i*4) := x"4";
        when '5'       => result(i*4+3 downto i*4) := x"5";
        when '6'       => result(i*4+3 downto i*4) := x"6";
        when '7'       => result(i*4+3 downto i*4) := x"7";
        when '8'       => result(i*4+3 downto i*4) := x"8";
        when '9'       => result(i*4+3 downto i*4) := x"9";
        when 'A'       => result(i*4+3 downto i*4) := x"A";
        when 'B'       => result(i*4+3 downto i*4) := x"B";
        when 'C'       => result(i*4+3 downto i*4) := x"C";
        when 'D'       => result(i*4+3 downto i*4) := x"D";
        when 'E'       => result(i*4+3 downto i*4) := x"E";
        when 'F'       => result(i*4+3 downto i*4) := x"F";
        when others    => null;
      end case;
    end loop;
    return result;
  end romgen_str2bv;

  attribute INITP_00 : string;
  attribute INITP_01 : string;
  attribute INITP_02 : string;
  attribute INITP_03 : string;
  attribute INITP_04 : string;
  attribute INITP_05 : string;
  attribute INITP_06 : string;
  attribute INITP_07 : string;

  attribute INIT_00 : string;
  attribute INIT_01 : string;
  attribute INIT_02 : string;
  attribute INIT_03 : string;
  attribute INIT_04 : string;
  attribute INIT_05 : string;
  attribute INIT_06 : string;
  attribute INIT_07 : string;
  attribute INIT_08 : string;
  attribute INIT_09 : string;
  attribute INIT_0A : string;
  attribute INIT_0B : string;
  attribute INIT_0C : string;
  attribute INIT_0D : string;
  attribute INIT_0E : string;
  attribute INIT_0F : string;
  attribute INIT_10 : string;
  attribute INIT_11 : string;
  attribute INIT_12 : string;
  attribute INIT_13 : string;
  attribute INIT_14 : string;
  attribute INIT_15 : string;
  attribute INIT_16 : string;
  attribute INIT_17 : string;
  attribute INIT_18 : string;
  attribute INIT_19 : string;
  attribute INIT_1A : string;
  attribute INIT_1B : string;
  attribute INIT_1C : string;
  attribute INIT_1D : string;
  attribute INIT_1E : string;
  attribute INIT_1F : string;
  attribute INIT_20 : string;
  attribute INIT_21 : string;
  attribute INIT_22 : string;
  attribute INIT_23 : string;
  attribute INIT_24 : string;
  attribute INIT_25 : string;
  attribute INIT_26 : string;
  attribute INIT_27 : string;
  attribute INIT_28 : string;
  attribute INIT_29 : string;
  attribute INIT_2A : string;
  attribute INIT_2B : string;
  attribute INIT_2C : string;
  attribute INIT_2D : string;
  attribute INIT_2E : string;
  attribute INIT_2F : string;
  attribute INIT_30 : string;
  attribute INIT_31 : string;
  attribute INIT_32 : string;
  attribute INIT_33 : string;
  attribute INIT_34 : string;
  attribute INIT_35 : string;
  attribute INIT_36 : string;
  attribute INIT_37 : string;
  attribute INIT_38 : string;
  attribute INIT_39 : string;
  attribute INIT_3A : string;
  attribute INIT_3B : string;
  attribute INIT_3C : string;
  attribute INIT_3D : string;
  attribute INIT_3E : string;
  attribute INIT_3F : string;

  component RAMB16_S9
    --pragma translate_off
    generic (
      INITP_00 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_01 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_02 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_03 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_04 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_05 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_06 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INITP_07 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";

      INIT_00 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_01 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_02 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_03 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_04 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_05 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_06 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_07 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_08 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_09 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0A : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0B : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0C : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0D : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0E : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_0F : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_10 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_11 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_12 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_13 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_14 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_15 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_16 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_17 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_18 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_19 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_1A : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_1B : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_1C : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_1D : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_1E : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_1F : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_20 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_21 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_22 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_23 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_24 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_25 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_26 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_27 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_28 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_29 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_2A : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_2B : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_2C : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_2D : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_2E : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_2F : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_30 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_31 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_32 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_33 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_34 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_35 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_36 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_37 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_38 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_39 : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_3A : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_3B : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_3C : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_3D : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_3E : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
      INIT_3F : bit_vector (255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000"
      );
    --pragma translate_on
    port (
      DO    : out std_logic_vector (7 downto 0);
      DOP   : out std_logic_vector (0 downto 0);
      ADDR  : in  std_logic_vector (10 downto 0);
      CLK   : in  std_logic;
      DI    : in  std_logic_vector (7 downto 0);
      DIP   : in  std_logic_vector (0 downto 0);
      EN    : in  std_logic;
      SSR   : in  std_logic;
      WE    : in  std_logic 
      );
  end component;

  signal rom_addr : std_logic_vector(10 downto 0);

begin

  p_addr : process(ADDR)
  begin
     rom_addr <= (others => '0');
     rom_addr(10 downto 0) <= ADDR;
  end process;

  rom0 : if true generate
    attribute INIT_00 of inst : label is "00A004D0402934B510A08B8500A930B006C03AD061853E9061C510A9069061C5";
    attribute INIT_01 of inst : label is "4C8DA62BAC208D862C2F202310203595BF29043035B508F00BE02DB220988BE6";
    attribute INIT_02 of inst : label is "870594B588A62B7D203495FFA9B28513A92DBA2000A98B842F604C1530CA304F";
    attribute INIT_03 of inst : label is "8E00A20F1086A660878540A99CF66021C72003D09FC607909CC9EF4541A510F0";
    attribute INIT_04 of inst : label is "B0B9B58514A904D0B5C611F098B5A419904A00A56010078E10058E10038E1001";
    attribute INIT_05 of inst : label is "14D0ADA510058D64A910048D31A5B9B4C60AF098B4A410078D31C4B910068D31";
    attribute INIT_06 of inst : label is "B6C673D0072900A528F0B6A412D010A916F0042900A50A9014C90EB016C9ABA5";
    attribute INIT_07 of inst : label is "4ED0A4A910028D31E9B9B88414A002D088B8A461D0A4A910028D31D8B91DF088";
    attribute INIT_08 of inst : label is "494AF44570A5D3B020C928B034C9EF4540A530D0AF2943A536B0F8C9F04570A5";
    attribute INIT_09 of inst : label is "B3A46010018D3184B910008D3171B9B2C60BF098B2A424D0A4A910028D8009FF";
    attribute INIT_0A of inst : label is "11F088B7C616D0032900A5D5F0B7A410038D319EB910028D3197B9B3C60BF098";
    attribute INIT_0B of inst : label is "60708090A0B0C0D0E0F0000000006010018D02691803F03184B910008D3171B9";
    attribute INIT_0C of inst : label is "A1E0C000A0000070848484848383838382828282818181000000001020304050";
    attribute INIT_0D of inst : label is "2005052020303035353030202005055060708090A0B0C0D0E0F0A4A200A20000";
    attribute INIT_0E of inst : label is "3C30282830282800A200A300A200A100A200A300A400A300A200A13535303020";
    attribute INIT_0F of inst : label is "00A0808080505050808050507070706060607070606000A27460505060505051";
    attribute INIT_10 of inst : label is "00BD8DA6F4D0CAC88B2638C93F2932B108A28E848B8500A98D84338504A93284";
    attribute INIT_11 of inst : label is "98F0D0CAC83291EF453FA904908B2600A908A28EA48B8401009D8BA5A88DE601";
    attribute INIT_12 of inst : label is "C9F8A9029008A980C908B0F8C90C9008C960BAD007C933A5C0D0C0C033E602D0";
    attribute INIT_13 of inst : label is "8F8D018F6DFCA5018E8D018E6D18FBA5F8C285C18500A2FFA9606A00A9A86A80";
    attribute INIT_14 of inst : label is "69018CAD018B8D896518018BAD01918D1CB000690191AD01908D00690190AD01";
    attribute INIT_15 of inst : label is "2E90ACF50004B9AAF50003B9A8D50002B900A0D8018D8D0069018DAD018C8D00";
    attribute INIT_16 of inst : label is "C08500A9C285FFA9029018C902690A90C1C50E30C2A5E310CAE89018C0C8C8C8";
    attribute INIT_17 of inst : label is "CA0295FFFFBD1A9517B517A2C1948E848D86602D6020018500A90710C125C2A5";
    attribute INIT_18 of inst : label is "0299A8B5000399AAB5000499ACB58DA6B9851C951B9500A91A9501A9F2D08EE4";
    attribute INIT_19 of inst : label is "A8A5389E20AAA5389E2038ACA59285F74504A99185F5451FA9A0D00185F0A900";
    attribute INIT_1A of inst : label is "202EA9389E2038ADA59185F5451FA99285F74507A91DF01C290801AD389E2018";
    attribute INIT_1B of inst : label is "A5389E2003A5389E203804A59285F74505A99185F5459FA9389E2018ABA53885";
    attribute INIT_1C of inst : label is "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF389E4C1802";
    attribute INIT_1D of inst : label is "B01F29CFB50A0A0A02B003F001E00C01AD02A2F5FFFFFFFFFFFFFFFFFFFFFFFF";
    attribute INIT_1E of inst : label is "D285F0A904D010290C01ADCF9501E902909807C90729D4A5A80AB01BC910F037";
    attribute INIT_1F of inst : label is "2069CFB509B01BC91CB0381FD0CCD623F0CCB518CC95CF9500A9D2C608F0D2A5";
    attribute INIT_20 of inst : label is "D3A50CF0169001E000A92A90CC9578A93801F0CCB5CF95CAB01FA91801F0D190";
    attribute INIT_21 of inst : label is "C5F6C985C9653868CA85CA65483801A902F01029D3A508D002690CF04A4A0C29";
    attribute INIT_22 of inst : label is "CBE60CD003C0CBE6CA8514303462F938CAA5A84A4A4A4A4AD3A533AF4C0330CA";
    attribute INIT_23 of inst : label is "850E30CB6508B0C96538FF4900694A1AF0A80329D3A57F7F03050404027F08D0";
    attribute INIT_24 of inst : label is "059010C909F0C5B502A200A027B04AD4A5D4E6C985C8E6C8E602B002C000A9CB";
    attribute INIT_25 of inst : label is "351F351460F210CA0330C595EF691807F0C5B502A210D098F010CAC595C8EF69";
    attribute INIT_26 of inst : label is "363B362E361A360535F035DE35CB35B735A33592357E3569355435423536352B";
    attribute INIT_27 of inst : label is "376237533748373537203711370236F136E236D236BB36A33683366C36593648";
    attribute INIT_28 of inst : label is "6EA0524559414C500651056E381137FF37E337CF37C237B637AA379E378E377B";
    attribute INIT_29 of inst : label is "4F444147554A0651056EA0525545554F4A0651056EA052454C45495053065105";
    attribute INIT_2A of inst : label is "455A4E45554D203106CC04F3D359414C502032204E494F43203106AC0513A052";
    attribute INIT_2B of inst : label is "04F3D3525545554F4A2032204543454950203106CC04F3C54C45495053203220";
    attribute INIT_2C of inst : label is "502031204E494F43203106AC0513D34F4745554A2032204148434946203106CC";
    attribute INIT_2D of inst : label is "454950203106CC04F3CC45495053203120455A4E45554D203106CC04F3D9414C";
    attribute INIT_2E of inst : label is "0513CF4745554A2031204148434946203106CC04F3D25545554F4A2031204543";
    attribute INIT_2F of inst : label is "2031204E455A4E45554D203206CC04F3D9414C50203120534E494F43203206AC";
    attribute INIT_30 of inst : label is "203206CC04F3D25545554F4A203120534543454950203206CC04F3CC45495053";
    attribute INIT_31 of inst : label is "530650056FD245564F20454D41470650056FCF4745554A203120534148434946";
    attribute INIT_32 of inst : label is "45554A06D004EFC54954524150204544204E494606B0050FC5444E454C454950";
    attribute INIT_33 of inst : label is "4954494E492052554F59205245544E45071404ABCF44414E494D524554204F47";
    attribute INIT_34 of inst : label is "204E454C414954494E49204552484920454953204E454245470794042BD34C41";
    attribute INIT_35 of inst : label is "450734048BD3454C414954494E4920534F56205A4552544E450734048BCE4945";
    attribute INIT_36 of inst : label is "524556452053554E4F4206CE04F1D3454C414943494E4920535553204552544E";
    attribute INIT_37 of inst : label is "55514148432053554E4F4206EE04D1A04544454A2053554E4F4206CE04F1A059";
    attribute INIT_38 of inst : label is "D345524F435320484749480662055DA04144414320415254584506CE04F1A045";
    attribute INIT_39 of inst : label is "55454C4C49454D06A2051DC55353494E424547524554534843454F4806E204DD";
    attribute INIT_3A of inst : label is "4F43532054414552470693052CD344524F4345520622059DC5524F4353205352";
    attribute INIT_3B of inst : label is "5306D304ECD3494E4245475245205345474954524153534F52470733048CC552";
    attribute INIT_3C of inst : label is "0552C54A41544E5550204E41524706B3050CC5524F435320454449444E454C50";
    attribute INIT_3D of inst : label is "544944455243066D0552A04554494445524B066D0552A053544944455243066D";
    attribute INIT_3E of inst : label is "494E494D20544944455243203206CF04F0A0534F544944455243066D0552A053";
    attribute INIT_3F of inst : label is "F0C54C4549505320322052554620465255574E4945444C4547078F0430CD554D";
  begin
  inst : RAMB16_S9
      --pragma translate_off
      generic map (
        INITP_00 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_01 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_02 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_03 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_04 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_05 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_06 => x"0000000000000000000000000000000000000000000000000000000000000000",
        INITP_07 => x"0000000000000000000000000000000000000000000000000000000000000000",

        INIT_00 => romgen_str2bv(inst'INIT_00),
        INIT_01 => romgen_str2bv(inst'INIT_01),
        INIT_02 => romgen_str2bv(inst'INIT_02),
        INIT_03 => romgen_str2bv(inst'INIT_03),
        INIT_04 => romgen_str2bv(inst'INIT_04),
        INIT_05 => romgen_str2bv(inst'INIT_05),
        INIT_06 => romgen_str2bv(inst'INIT_06),
        INIT_07 => romgen_str2bv(inst'INIT_07),
        INIT_08 => romgen_str2bv(inst'INIT_08),
        INIT_09 => romgen_str2bv(inst'INIT_09),
        INIT_0A => romgen_str2bv(inst'INIT_0A),
        INIT_0B => romgen_str2bv(inst'INIT_0B),
        INIT_0C => romgen_str2bv(inst'INIT_0C),
        INIT_0D => romgen_str2bv(inst'INIT_0D),
        INIT_0E => romgen_str2bv(inst'INIT_0E),
        INIT_0F => romgen_str2bv(inst'INIT_0F),
        INIT_10 => romgen_str2bv(inst'INIT_10),
        INIT_11 => romgen_str2bv(inst'INIT_11),
        INIT_12 => romgen_str2bv(inst'INIT_12),
        INIT_13 => romgen_str2bv(inst'INIT_13),
        INIT_14 => romgen_str2bv(inst'INIT_14),
        INIT_15 => romgen_str2bv(inst'INIT_15),
        INIT_16 => romgen_str2bv(inst'INIT_16),
        INIT_17 => romgen_str2bv(inst'INIT_17),
        INIT_18 => romgen_str2bv(inst'INIT_18),
        INIT_19 => romgen_str2bv(inst'INIT_19),
        INIT_1A => romgen_str2bv(inst'INIT_1A),
        INIT_1B => romgen_str2bv(inst'INIT_1B),
        INIT_1C => romgen_str2bv(inst'INIT_1C),
        INIT_1D => romgen_str2bv(inst'INIT_1D),
        INIT_1E => romgen_str2bv(inst'INIT_1E),
        INIT_1F => romgen_str2bv(inst'INIT_1F),
        INIT_20 => romgen_str2bv(inst'INIT_20),
        INIT_21 => romgen_str2bv(inst'INIT_21),
        INIT_22 => romgen_str2bv(inst'INIT_22),
        INIT_23 => romgen_str2bv(inst'INIT_23),
        INIT_24 => romgen_str2bv(inst'INIT_24),
        INIT_25 => romgen_str2bv(inst'INIT_25),
        INIT_26 => romgen_str2bv(inst'INIT_26),
        INIT_27 => romgen_str2bv(inst'INIT_27),
        INIT_28 => romgen_str2bv(inst'INIT_28),
        INIT_29 => romgen_str2bv(inst'INIT_29),
        INIT_2A => romgen_str2bv(inst'INIT_2A),
        INIT_2B => romgen_str2bv(inst'INIT_2B),
        INIT_2C => romgen_str2bv(inst'INIT_2C),
        INIT_2D => romgen_str2bv(inst'INIT_2D),
        INIT_2E => romgen_str2bv(inst'INIT_2E),
        INIT_2F => romgen_str2bv(inst'INIT_2F),
        INIT_30 => romgen_str2bv(inst'INIT_30),
        INIT_31 => romgen_str2bv(inst'INIT_31),
        INIT_32 => romgen_str2bv(inst'INIT_32),
        INIT_33 => romgen_str2bv(inst'INIT_33),
        INIT_34 => romgen_str2bv(inst'INIT_34),
        INIT_35 => romgen_str2bv(inst'INIT_35),
        INIT_36 => romgen_str2bv(inst'INIT_36),
        INIT_37 => romgen_str2bv(inst'INIT_37),
        INIT_38 => romgen_str2bv(inst'INIT_38),
        INIT_39 => romgen_str2bv(inst'INIT_39),
        INIT_3A => romgen_str2bv(inst'INIT_3A),
        INIT_3B => romgen_str2bv(inst'INIT_3B),
        INIT_3C => romgen_str2bv(inst'INIT_3C),
        INIT_3D => romgen_str2bv(inst'INIT_3D),
        INIT_3E => romgen_str2bv(inst'INIT_3E),
        INIT_3F => romgen_str2bv(inst'INIT_3F)
        )
      --pragma translate_on
      port map (
        DO   => DATA(7 downto 0),
        DOP  => open,
        ADDR => rom_addr,
        CLK  => CLK,
        DI   => "00000000",
        DIP  => "0",
        EN   => '1',
        SSR  => '0',
        WE   => '0'
        );
  end generate;
end RTL;
