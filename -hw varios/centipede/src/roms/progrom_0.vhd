-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity progrom_0 is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of progrom_0 is

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
    attribute INIT_00 of inst : label is "290C00AD20008DFC908A462D602058287620C95241544120303839311B3B4B4C";
    attribute INIT_01 of inst : label is "2AD2202701202955203327202119203B0720E710274520307920256620FEF020";
    attribute INIT_02 of inst : label is "A508D0AF2943A55520154C2CF32023DA202059202E1C202BDD202ED720220220";
    attribute INIT_03 of inst : label is "029005A002C9ABB56BB00CC99AB588A62090F8C9F04570A560019020C9EF4540";
    attribute INIT_04 of inst : label is "09032901691840A540E60FD0032900A55390D7D598A80669184A059012C909A0";
    attribute INIT_05 of inst : label is "249004C9F045708580E53820B84C80651806F0EFA470A58B8560A54085EF451C";
    attribute INIT_06 of inst : label is "2C2F2000A0706518F34504A90FD00329100AAD16D0032900A51C902C9A200CA2";
    attribute INIT_07 of inst : label is "38F59010C9F9F0F829100AAD7085F045F8A94085EF451CA96020E820602BAC20";
    attribute INIT_08 of inst : label is "2195206F1086A560B885508500A9808402A002B006C9ABB588A603A0608504E9";
    attribute INIT_09 of inst : label is "00AE00A538242084A905D000A5387420928505A9918540A9948520A9938503A9";
    attribute INIT_0A of inst : label is "53849853A402B0E4C9FFA008901CC901A063A530D0AF2943A545D08029FF8606";
    attribute INIT_0B of inst : label is "2B64202B28201883849883A4029009C901A008B030C9FFA08D8573A52AEF2018";
    attribute INIT_0C of inst : label is "A9B08521C0B9AE8521B320A87DEE5F305ABB0260FE85FA10CA21205DABA913A2";
    attribute INIT_0D of inst : label is "006021BFB9A84A4A4A3029FDA5389E4C00A9389E20AEA538AB20B0A538242006";
    attribute INIT_0E of inst : label is "100AAD818401A00290A9D510094029FDA50CD0ABB502A088A602000150012001";
    attribute INIT_0F of inst : label is "8500A9A18560A94185F8A96185FFA97185F04560A95184A8387C209805F00429";
    attribute INIT_10 of inst : label is "E610D0032900A522FA4CF290F8C007F02029A841A50DA26001F0AF2943A560B5";
    attribute INIT_11 of inst : label is "61A410F051A518F08029100AAD35D0A1C64185F24514A906901CC9F24541A541";
    attribute INIT_12 of inst : label is "2081A507F0100A2D20094029FDA55185BEA502F000A9BE850A9005C00EB0FBC0";
    attribute INIT_13 of inst : label is "81E53822804C81651806F0EFA471A58B85618551E53861A5A18530A98185387C";
    attribute INIT_14 of inst : label is "FFC961A50DA22B9520329100A9099038C93F2932B100A013F02C2F2000A07185";
    attribute INIT_15 of inst : label is "06C94A00A90210D806E938F8ABB588A632303D1081A506B009C9F04571A554B0";
    attribute INIT_16 of inst : label is "81A504B071C504B00A9071C506F0EFA68DE538F04560A98D850A0A0A05A90290";
    attribute INIT_17 of inst : label is "0AAD11D0A1C66021C720602C9A200DA28185387C2081A507902C6F200DA20930";
    attribute INIT_18 of inst : label is "A66064B501A0023044B5FFA08B8554B5604185F245B58514A9A1850F092F2910";
    attribute INIT_19 of inst : label is "B004C0ABB402A99A950CA904D09AD6149003C99CB5C2958009C2B520D094B588";
    attribute INIT_1A of inst : label is "85F045F8A94484A8387C209805D0022900A5A874859CB5348503A99C9501A902";
    attribute INIT_1B of inst : label is "9543B5749573B56495F045F8A9349401A242A035F001C98B859AB5548580A964";
    attribute INIT_1C of inst : label is "0CC99AB588A6D7908BE4E847A002D03FC0885495537518F8A902D008A9041044";
    attribute INIT_1D of inst : label is "95387C200310100A2C74959801F0F4A402A9349500A964958BA6F045F8A92DF0";
    attribute INIT_1E of inst : label is "01AD383086A5609785FEA5949588A60CA9D9900CE0E864B55495F829100AAD44";
    attribute INIT_1F of inst : label is "ADC61810AB85D801E938ABA5F8A9853CA927D0A9C61BF0AD05ABA531F01C2908";
    attribute INIT_20 of inst : label is "C6FBD0DBA56001D087A52CC82003D0AF2943A526BC20A58500A910D0AB8559A9";
    attribute INIT_21 of inst : label is "2025414C03D0AF2943A529364CD6859191A800A938242080A90FF0D6A5F7D087";
    attribute INIT_22 of inst : label is "2086C646D0A605A5A5253B4C2D602031FE2001857F290A1001A5111086A52936";
    attribute INIT_23 of inst : label is "C7202D60200310C1A531FE20293620254520EE8580A91410C2A518F0EFA53267";
    attribute INIT_24 of inst : label is "00A9F9853DA93A4F201C029DFFA989A638242004A9008501A920E820231F2021";
    attribute INIT_25 of inst : label is "854385F9A9878580A9A7E61ED0A7A524D0A4B588A625344C03D0CA89A660FA85";
    attribute INIT_26 of inst : label is "888656F0A4B5AA034988A5A7C660388520200988A538242000A938242004A942";
    attribute INIT_27 of inst : label is "A631FE2025452003D001E088A6A085A1B525652003D082C9EE858805EE2580A9";
    attribute INIT_28 of inst : label is "8785A0A9C2954009C2B528C32094950CA907D0ADA50BD0A4C5A4B511D002E088";
    attribute INIT_29 of inst : label is "E82021C72026BC20A4D688A6D68542854385F9A9388520200988A538242000A9";
    attribute INIT_2A of inst : label is "85F285F185EF85F085F685F785F58524008D1C078DBF85BD85FEA560231F2020";
    attribute INIT_2B of inst : label is "8502694A4A0C29FDA5C88502A904D08D850329D385E3290801AD60F885F485F3";
    attribute INIT_2C of inst : label is "C92910DCA610F0C905C8A58D850A0A202900A538242003F08DA560013086A5A4";
    attribute INIT_2D of inst : label is "1C048EFFA21C038EFFA23824208A49DC858029FDA51AD08AA9DC8500A91E9002";
    attribute INIT_2E of inst : label is "2020090AE938C8A538852021A90A900AC9C8A538242009A93824208D050AA960";
    attribute INIT_2F of inst : label is "BBB04AFFA60C01AD1C038D8DA5C830DCA5CCF0C8A63885201EA902F0C9A53885";
    attribute INIT_30 of inst : label is "A586CAA4A61C029D8986CA85CB859A85FC85FB8500A91C048D1C038DFFA9C8C6";
    attribute INIT_31 of inst : label is "4520EE8580A907F010290C00ADB185B08521C0B9AF85AE8521B32026A42086E6";
    attribute INIT_32 of inst : label is "7BBD48267ABD26BC4CA9853CA9AB8500A9AD854A4A0CF01C290801AD28762025";
    attribute INIT_33 of inst : label is "0104020E000D6014078C140D8C14058D140F8D14068E140E8E68AA267CBDA826";
    attribute INIT_34 of inst : label is "0C0E0A0E0D06000104010B010E0A0E0C090A0D0C040B090A0C010B01040C010E";
    attribute INIT_35 of inst : label is "8B8506A93A4F4CF310CA01819D1AB501789D02B508A2C285C185FFA9020D000B";
    attribute INIT_36 of inst : label is "06A9F2D08BC638852000A90210CA1FA9A5A69185F645DFA992850629F74504A9";
    attribute INIT_37 of inst : label is "F2D08BC63885201FA90210CA00A9AAA6E5388B8506A99185F6455FA99285F745";
    attribute INIT_38 of inst : label is "85EF45D7A506D0AF2943A50CD00DE010D034D60490FAC01890F9C034B40DA260";
    attribute INIT_39 of inst : label is "DA8500A908D027C943E60EB028C943A514D0032900A51AF0AF2943A5DF10CA41";
    attribute INIT_3A of inst : label is "20256520EE8582A910D0EFA51410EEA51830C2A5600110C225C1A560DB8504A9";
    attribute INIT_3B of inst : label is "85202009988884880110C2A602A038242000A914F04A89A529362033272031FE";
    attribute INIT_3C of inst : label is "6518988D84C0B488A69285F74505A99185F54589A938242005A938242008A938";
    attribute INIT_3D of inst : label is "9A264A4A4A4A01F0EFA60C01AD388220C8C88DA4388220C88DA43882208E85C0";
    attribute INIT_3E of inst : label is "4520EE8580A91DF0EFA5C095FFA988A6329003C9C0A5C0E646D018C91F299AA5";
    attribute INIT_3F of inst : label is "8600A21730C225C1A53230C1A520E82021C720231F2033272029362031FE2025";
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
