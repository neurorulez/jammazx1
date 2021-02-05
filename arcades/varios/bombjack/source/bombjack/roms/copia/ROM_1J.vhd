-- generated with romgen v3.03 by MikeJ
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;

library UNISIM;
	use UNISIM.Vcomponents.all;

entity ROM_1J is
port (
	CLK  : in  std_logic;
	ENA  : in  std_logic;
	ADDR : in  std_logic_vector(12 downto 0);
	DATA : out std_logic_vector(7 downto 0)
	);
end;

architecture RTL of ROM_1J is

	signal rom_addr : std_logic_vector(12 downto 0);

begin

	p_addr : process(ADDR)
	begin
		rom_addr <= (others => '0');
		rom_addr(12 downto 0) <= ADDR;
	end process;

	ROM_1J_0 : RAMB16_S2
	generic map (
		INIT_00 => x"8CC000004D089000000000000000000000000000000000000000013042688822",
		INIT_01 => x"CF0CB1FBCF38F36E3AD79F7DC30DBCD700000000000FFF0037FFC001FFC00148",
		INIT_02 => x"5086382D9B26041841441041041F4127D041E41041041C7D000000000000000F",
		INIT_03 => x"4E2CD53399065D6DE4935D44006D55559F104E208A7C4138812B82228509A146",
		INIT_04 => x"90509EE4942254260895557B9050A22824A08AB0398AA8A249826088AEBB3B10",
		INIT_05 => x"C2023B0894A64A58962A28664A48562629C5BFF41D0508E2A7B49082242608BB",
		INIT_06 => x"3ABC8EB0EB8915092CE2060B3181204C209383B1084ED8EF98E64628A1818382",
		INIT_07 => x"344106904104104104105D09A1389563773B50CDCE9B4D1CF0C282B2C2CE0555",
		INIT_08 => x"4141649CE44A5FB962CD92716141CE649440E61A7058B3100338BFD92794A364",
		INIT_09 => x"95CF3579A62663759250CF1A74773CE2649CE44A5FB962CD9250CF1A74773CE2",
		INIT_0A => x"94A79A76495775E2096C6189A2CC98504105709E58CCFD58B32199D04104EE64",
		INIT_0B => x"58DD334D252F249727A954955635DD6B8554905656FF10415559104145525564",
		INIT_0C => x"4105450253ACBD492669399B39E668D8B89055555107904514417BD8D26A2495",
		INIT_0D => x"09A495057D9F2709079C62496955C1D93ACA95555555AD49C6B52615071542E2",
		INIT_0E => x"380130FCFD243777565256527662564255412209820105056AC2555505776CDB",
		INIT_0F => x"000000000000000000000000000000000000000000000010E0CFCC27B3F309E7",
		INIT_10 => x"294A6FC4A544254A1F2421F20000000000000000000000000000000000000000",
		INIT_11 => x"100010300010F6665F4647F4645F4647F6665F5657F7675F4647F5655F464754",
		INIT_12 => x"2619C653FB4238910505549041E095CDA91104957234552A4441641CC8811000",
		INIT_13 => x"55404B4B54AC04A4224104104228A3084104110410555C1105554557C4415556",
		INIT_14 => x"98D71C9417F7A3FCAE395555497A119255E69CBD65A555555555A9955EE5E555",
		INIT_15 => x"0000111111112222222233333333155524164950CAD5DDCCCD55549244C41657",
		INIT_16 => x"3F9F7D649DDF6F3F7DDAE649DDA555555555E9D55EE5E55555ECA8BB081CC000",
		INIT_17 => x"149492557E4E45555D9562488154B0415557B9CB49571905DF9FBBB6E4955557",
		INIT_18 => x"B8B188A2882288A28827B8251B4A53B5557D66D22564D9C7249E6D9CAE5E5555",
		INIT_19 => x"00000000000000000000000000000000000000000000000000000012CA228064",
		INIT_1A => x"CCCCCCC080808020202033333333F3333333B3B3B3FCECECECECECECF3B3B3B3",
		INIT_1B => x"B3B3FECECECECFA0A0A0A0FFFFFFFFFFB3B3B3B3FECECECECFB3B3B3FCECECEC",
		INIT_1C => x"FF030FF0FFFFFFFFFFF0303030C0FF03030F0303030F030303F05AF05AFFB3B3",
		INIT_1D => x"B3B3FF3B3B3B3FFCECECECFF000000C01313131F0000003F0F0FFFFFFFFFFFFF",
		INIT_1E => x"C0BF9303F920912909D61099690956101DA007F7B025020B5F0F3210321FF3B3",
		INIT_1F => x"108E00EC2EC6EBCE0FFFFCCC3FC0000000FFFFC0CF90A8893778890FDEEF0D5F",
		INIT_20 => x"BCEE628E43F166342362340BA19CCC298D8DE75042B28A623668D053C2F0B08A",
		INIT_21 => x"5B826A353C41A10A9BA9F41541388E041D592F38371252A36B093939AB82C23A",
		INIT_22 => x"D4F1AB8DC9D0939D6BD7B827EB0939D683827E34E7DC8D4F1AB8DC9D0939D6BD",
		INIT_23 => x"D3EF042290821D28918529064928234D80860710A8F19F8D28184032A34E7DC8",
		INIT_24 => x"723598D7FDCC2F7382D7D8E097F730BDCE0B5F6382BA36B8D28188D029110DBF",
		INIT_25 => x"205838E4525DF18E18F3939263CA4ACC7D181B0A38A86A4236340978396A3550",
		INIT_26 => x"3A3B89153CE6409B08218808AC209204014ED8890762243D2E6D2A4642764241",
		INIT_27 => x"0E25492253906E71090D2924A0939291935E398552B273890C1EC90794604316",
		INIT_28 => x"43895C920519CE64FC9C2E41E0586424E72466CE2578658E48AB597490410925",
		INIT_29 => x"788A871929788A840E0A23A386444F183874E5F3210F000051041C5665224241",
		INIT_2A => x"08ACE6B867A0284E08ACE6B86575E486CD79218A280E08123A180E38102F1929",
		INIT_2B => x"19AAA2E636B18A0624E4A46408AC20A18E4939291949A2A26AEE415557A0284E",
		INIT_2C => x"B899F488B989E61B9298B0A389E7DB929198FD8F18266318A042998929BAE229",
		INIT_2D => x"58A486555F72990939D6AAE0B1F7E464267F5994998B99ED56526A2A67751949",
		INIT_2E => x"8654A05C7D1820F80820F39C7D1860F80860F39C7D18A0F81860828F3978268E",
		INIT_2F => x"49573DCF73D37CDF45DF5C84B89956E4BC9B55281C2CA5D738155634AF70D2A2",
		INIT_30 => x"1BB82381551524185086054D9C64105E4A242190BD955B69759349F79B69B597",
		INIT_31 => x"9C964A0508A05556707567063CBF5506549A46C557964E088E54EA86EE2873AA",
		INIT_32 => x"8256186B5559257075895555556C24B422924A48D29C34A0D412A9E4225968DA",
		INIT_33 => x"E9D259E4128DBAE9F08169E69042BAE9D25964128DBAE9F39A7924106EE26D42",
		INIT_34 => x"710283969E490710A08A0502281C9D0204B60A04270D282060A07A2740D282BA",
		INIT_35 => x"26BE0BD89C9EC9A0555557E56AE65F507025259E4180969E690710A039496590",
		INIT_36 => x"ED9AF82C62727BA6BE0B189C9EE9AF82F627E7B26BE0BD89F9EC9AF82F62727B",
		INIT_37 => x"E52860A020AE828202824A182808082BA0A080A095EF82C62727B66BE0B189C9",
		INIT_38 => x"76547213210FE6E6A6AAAEA6A2AE6E62666E66622226262E26225046301B08E8",
		INIT_39 => x"79797979797CE5E5E5E5E5E5E5E5F9797979797E5E5E5E5F9797979797F87654",
		INIT_3A => x"E5E5E5E5E5E5E5F97979797E5E5E5E5E5F97979797E5E5E5E5E5E5F979797979",
		INIT_3B => x"E5E5E5E5E5E5F9797979797979797E5E5E5E5E5E5F979797979797E5E5E5E5E5",
		INIT_3C => x"0F003C04F02C2AFFC07CBC07C400003E521E1213979797979797979797979797",
		INIT_3D => x"000000000000000000000000000000000CCD10323010804E2F10000F4CC00FFC",
		INIT_3E => x"000000000001308E0001308E0001F08E0000308E0000308E0000F08E0001F3AD",
		INIT_3F => x"7E9381CF00007389000000000000304E0003308E0003F08E0003B08E0004C24E"
	)
	port map (
		DO   => DATA(1 downto 0),
		ADDR => rom_addr,
		CLK  => CLK,
		DI   => "00",
		EN   => ENA,
		SSR  => '0',
		WE   => '0'
	);

	ROM_1J_1 : RAMB16_S2
	generic map (
		INIT_00 => x"CCC000000000D0000000000000000000000000000000000000000000203C0C03",
		INIT_01 => x"0CF30C2092062CB2882C820B2090060C00000000000FFF0037FFC001FFC001CC",
		INIT_02 => x"B10600640D038C88230308C0823310ACC0235208E00004C7000000000000000F",
		INIT_03 => x"003A1D11A39CFEDF0C32EBAC000F775510B000300C42C400C003C0300030DBAC",
		INIT_04 => x"E020A9388821700300C033A4E1208A1C08000C40C10730730D40300C0F1108B1",
		INIT_05 => x"63C01B8CF80363C40C81084363C44C010ACE02080A120AF084E8C080380300E4",
		INIT_06 => x"018680CAFC4C32071003C309908F30C42071019A0E4444602C61C43E313183C6",
		INIT_07 => x"3CC0C103D040F4003C082B30DB30E00000B4298063D64D0C0882A2884246215A",
		INIT_08 => x"80801CF43FC3F1FD81C073C4FACC6FDFF7F33C33CC6070C14D3E77C73C4E43D6",
		INIT_09 => x"FBC303577DAA92A977D3C233C48880F91CF43FC3F1FD81C073D3C233C48880F9",
		INIT_0A => x"F58D77D5DF986D810944610D41C03633C87220FF6C8C3C6070510DB3C8710F1C",
		INIT_0B => x"383330601D4D3E54540E1DCDDB0E3350E00C3737DA74311C75554100D0E0CD9E",
		INIT_0C => x"C00323FBDBF0C1AF13C717709F3D4CB6BCF837756303880C0430B50C73D63CF8",
		INIT_0D => x"8E7E03EEC4F13F8E93C237C0DF7BC05F8320DDD5803362C85D8B213BC1BB63D3",
		INIT_0E => x"8E51EC6C3C12CCCCD1D1D1D1F1F1F1F1EEC0360EA38043038C428033EEC1F07F",
		INIT_0F => x"0000000000000000000000000000000000000000000000223906C32749B0C9DA",
		INIT_10 => x"4B00889C269C65A8281A02810000000000000000000000000000000000000000",
		INIT_11 => x"100010000000F7772F5751F5751F7770F7770F4743F6763F6762F5752F575180",
		INIT_12 => x"0AA7E8D3AC238F5083A380712851968064831009C218E77900C4024804401000",
		INIT_13 => x"56208ECCD8C99CE8C363030C0C323938C0C303030C20B4832075782DE0C81D5A",
		INIT_14 => x"888A05F9059F4BFC642A00334AFC3973061CFC7B7D8DDD560033A38CD131ADDD",
		INIT_15 => x"3333333333333333333333333333200E1901CFB8864EAAAAA9D588F1C9C101DA",
		INIT_16 => x"C93BF31CF33A2ACBF39AF1CF338DDD560033A38CD131ADDD565BAC7E8D247333",
		INIT_17 => x"1E0C383824FAE580381AE1C440B87010DD5A4EC58F8A02412208C4E538C800CE",
		INIT_18 => x"F78F142C842C142C842A4F0ED9B4EE980CD77D717D5D7EE31391C7EC53AE1DD6",
		INIT_19 => x"0000000000000000000000000000000000000000000000000000002E3050A30F",
		INIT_1A => x"CCCCCCCC88440001122333333333F3333333377BBFFFEEDDCCCDDEEFFFBB7733",
		INIT_1B => x"7733FFFEEDDCCFFFAA5500FFFFFFFFFFFFBB7733FFFEEDDCCF377BBFFFEEDDCC",
		INIT_1C => x"FF030FF2FFFFFFFFFFF0303030C0FF03030F0303030F030303FAAAAFFFFFFFBB",
		INIT_1D => x"7733FFFBB7733FFFEEDDCCFF000023C00011223F0000003F0F3FFFFFFFFFFFFF",
		INIT_1E => x"9015330553B0047B00033000370003F004370153A0104200431F3333222FFFBB",
		INIT_1F => x"208200002002F1820FFFFCCC3FCC84048CFFFFC88FFCAA50029A500FFECF0003",
		INIT_20 => x"02FBEA41D387BD2D92D92C0C52F87E074BCBDFB4712181CB2CC4B2300862A8CE",
		INIT_21 => x"30C2012C8070A1C213CF5E39E740521C0BCDA9882F1EF032C037271730C26338",
		INIT_22 => x"B2E0804B6EB3727BCD310C21003727BCC0C2112E5D384B2E0804B6EB3727BCD3",
		INIT_23 => x"5AA9E833A0CE0B0AB02B2A80882B12E3E200021C22E0844B000874E092C5D3A4",
		INIT_24 => x"C32DFCB1130424C3C27D34308C4C10930F09F4D0C2312C04B000A4B2019E3A22",
		INIT_25 => x"73CFBCE43333036F18033390B008CA67D7131B0EBCA5F1DB2F2D1F4B0F4B2E35",
		INIT_26 => x"9EBF4F130043620D0C210E0CEC329003870D00CF1C033E8793C793C1D1F1C1CF",
		INIT_27 => x"8F3EEF16317277D7222B2220A271717175D2071C76B1DBCF70F7C7EEBC001C7D",
		INIT_28 => x"E3CFB6F14327A3BDC476F7CF73CC9C9C5C1CC3E33E40A4064061CF1CF9E72763",
		INIT_29 => x"69CA1E9F0769CA1D39AE80DACA072E0A082CE5F2222F2222A79E75D03D03C9D0",
		INIT_2A => x"6632F63CAAC9BFAB66F2B62CA82F3408ABCD022C9D3A9D1C9D9D3B8D1DA99F07",
		INIT_2B => x"3769A3BF2DC00000DCDCDCDF8CA432A0CA373737B778DA3FDEFBC8DD5BC98FAF",
		INIT_2C => x"78FF9F60EF376E037777109C376FC37773771371B63BDC00003A6F37774923B7",
		INIT_2D => x"40A40A8034CA6F3727BCDC309F5F9CDCDD8DF373778FF637CDCDD63FD8DF3737",
		INIT_2E => x"42580027D710EE6A10EAE2A7D710EEEA10EA62A7D710EE6A10E10EEE2A40E40A",
		INIT_2F => x"CF8EE7B9EE666599D642B7885C7F353877FC200000B7BD7F0805812C0F0BA08A",
		INIT_30 => x"A0C4A300805E7C06E6630327363C001F2002E8FBBAF565DF5DF5DF1CF1CF1CF1",
		INIT_31 => x"34F1C2E330801760D0260D01A0A6605D7977C21D7877CE90CE58CDA8312A8332",
		INIT_32 => x"EBCD2CAC33473EF010B8D5DE0C80C8ACE2220AB3AE34EC292C420F1CC3C783A2",
		INIT_33 => x"E36BE73C0027B2E373809F5CF000BAE367D73C0327B2E372A3C73C0026F3F4D2",
		INIT_34 => x"09C2E238F1CF009CE1000280300A3604002E80028D1B080018C0228DD0B384BA",
		INIT_35 => x"D4A88EFCFC52552016330930E6F3E4B118CEBE73C0A339F5CF009C26239F5CF0",
		INIT_36 => x"2752223AF3FD4914888EBCFD52452A23BF3FD49D4A88EFCFF52552A23BF3F149",
		INIT_37 => x"363234FA7A3D0363A3E38C8DBDBFAF9F50E8E8C8E08223AF3FD49D4888EBCFD5",
		INIT_38 => x"CCFFCEEDCCFF2207280D220B20052E0B200926032C092603200183C89A29A236",
		INIT_39 => x"6444E464C46CF13393913B3B3133B44444EE64EFB33B113344E64CEC4EFCDDFD",
		INIT_3A => x"3B93193B931939B4CCEC446F9B9931113BEEE44E44FB3B3B1313133444E464C4",
		INIT_3B => x"FB913B913B9134C44E4C4CE4CEEE4FBBB33B11111BE4EEEEE4E4EED3113B9319",
		INIT_3C => x"8F523D88F42CBB7FC03CBC03C80000BFB77B5577444E4CC4CEEC444EE4EEE4EE",
		INIT_3D => x"000000000000000000000000000000000CCD11011220C00F0F00002F0EC20FFC",
		INIT_3E => x"00000000000100820001C0820001C082000140820001C082000140820000808F",
		INIT_3F => x"61308A2400018083000000000001C202000180820001808200010082000601C0"
	)
	port map (
		DO   => DATA(3 downto 2),
		ADDR => rom_addr,
		CLK  => CLK,
		DI   => "00",
		EN   => ENA,
		SSR  => '0',
		WE   => '0'
	);

	ROM_1J_2 : RAMB16_S2
	generic map (
		INIT_00 => x"00004C8403CCF0000000000000000000000000000000000000000084F334CF33",
		INIT_01 => x"2000000C20C10820400C20010420410800000000000FFF0033FFE000FFCAA000",
		INIT_02 => x"C1F31F30CC3310048401210868431210C484302100093200000000000000000F",
		INIT_03 => x"833120B3C820C5080249081004C4B9930081833CCC02020CD30FF332820CC400",
		INIT_04 => x"5360B994D8232F33CCC69BE65060882C3C3CCC4D230B23B080333CCC3F030C80",
		INIT_05 => x"63C71E8CD03312082482CC7312086442CC50EEAC290608F0C0C410B33B33CCE6",
		INIT_06 => x"5761D5E2FE01180D0033231CB0CC730CF0D0C0C68F0780735C70433330F0DBC3",
		INIT_07 => x"038044A0004800120086880CC40CCCA6EC7EC73B23F47402083313C4CF0B1A33",
		INIT_08 => x"41412CBA3FA3FBBCC660B2C6F5C12F2CF21B3EB3E931940924CC148B2C6C2013",
		INIT_09 => x"F74189030CB74B7430EBF2B3ED5453302CBA3FA3FBBCC670B2EBE2B3ED545330",
		INIT_0A => x"301830F2CB000086CC8C71CC465040900828F8FFC9EC3E319001CC0008284F2C",
		INIT_0B => x"9999103334D73C08020F2CA64065BB00F1A442900CDCE1099900A172C241240C",
		INIT_0C => x"450B8D004BF82A4512490D148D344C123CD09B990E3060780481210CD3C43CD0",
		INIT_0D => x"8F04EB91ECFB3C8F3BD2334101B7410D3F8FEE64069B314134C504C7077723E3",
		INIT_0E => x"CF3BE2853E012EE64BCBC3C3DB5B53535D49009FE7C04B4900CF069B91E3F8FC",
		INIT_0F => x"00000000000000000000000000000000000000000000000B3CE873B77A18EDD2",
		INIT_10 => x"A68A5214A954A904F2304F230000000000000000000000000000000000000000",
		INIT_11 => x"001000001000F2225F0205F1215F0205F0205F0204F0204F0204F0204F121418",
		INIT_12 => x"3E44900A2E63C0026B7904C00A21D0D8C0AE009037BE80000788342D8D320010",
		INIT_13 => x"4CFBC888B0A8BCA0331E21108336330F8864AE1110817C1E01B40057F7806501",
		INIT_14 => x"00179CD4170084038804C69BD100BC10992494633602E64CC69B0322488802E6",
		INIT_15 => x"B3B3B3B3B3B3B3B3B3B3B3B3B3B38C6C0521C776042F333332D33010D4E52071",
		INIT_16 => x"03311414599C0C011423F1459902E64CC69B2302488802E64C017F004CB2F3B3",
		INIT_17 => x"10A44193083333069105434E09545492664A654424038C00CEEAE2299C231A6C",
		INIT_18 => x"F0830B312B320B312B32644C1300C031A6CF34F4343CFD2912C34DD899606E64",
		INIT_19 => x"00000000000000000000000000000000000000000000000000000002042CF40D",
		INIT_1A => x"2020203333333333333330202020F02020200000000000000020202033333333",
		INIT_1B => x"3333F33333333F33333333F20202020F20202020F20202020F00000000000000",
		INIT_1C => x"FF0000F0FFFFFFFFFFF0001030003F01000303010003030100F01230123F3333",
		INIT_1D => x"2020F33333333F30202020F3000000C00000000F0000003F0F0FFFFFFFFFFFFF",
		INIT_1E => x"C0000000000000040000C000000000400000000000000000004F3210321F3020",
		INIT_1F => x"0CF30023323323070FFFF1033FC00000003FFFCCCFFCFFFFFFFFFFC1111F0000",
		INIT_20 => x"C2F3488B492D7704704B058C9FF6F50DC1C1A2C6F3A3834B054412900B42C8C3",
		INIT_21 => x"50CB5005C2F38BC263DD71C75D1CC720471C91BC19BD45005C1D0D1D40CB633D",
		INIT_22 => x"1600DC012111D0D71DC70CB61C1D0D71D8CB600475C201640DC012511D0D71DC",
		INIT_23 => x"C5231231C8C736094394184E41188058538E08BC2640D8010822F2C080475C20",
		INIT_24 => x"09050417142CB70BCB41C232D450B2DC2F2D0708CB4005C01082201508BCB148",
		INIT_25 => x"730EBC70B1961C2F1C03F3C3700FCF171C3F3C8DBCF7034B04048D0C8D0C0547",
		INIT_26 => x"8C8C8D1900F313CC8CF1CD8C3630C20A4FE244CD3513344F13CF13E3E3F3434C",
		INIT_27 => x"2F3DC516B0DF334D1916190460D0D0D0D3430D34D68368CD60CBCD2450E09860",
		INIT_28 => x"CBCF7C516B0DB33540D3F34CB30C343434343363340C70C70C734F34F34D0D6B",
		INIT_29 => x"44C3B4502D44C3B5B15D4ECDCB6F240CBCD8A6F0000F22220D34D3433C33C35A",
		INIT_2A => x"32B577DCB1CC9F17327575DCB25C70CB171C32EC6CB06CBD6D6CB16CBDB3582D",
		INIT_2B => x"1D75C73505838208747474758C7231ECC31D1D1D9D70DC3758F34A6641CCAF17",
		INIT_2C => x"40DD3775CD1D7101D1D632D81D73C1D1D1D61C614237583820889D1D1D554B9D",
		INIT_2D => x"0CB0CB0697089D1D0D71D832DC733434350770D0D70DD41DC343583750770D0D",
		INIT_2E => x"832020871C3CF2013CF283C71C3CF2013CF2C3C71C3CF2413CF3CF2C3C0CB0CB",
		INIT_2F => x"4F144D1344D44D135450753C4401B59450D68908233F66520C2620042F8B0098",
		INIT_30 => x"40C872822435141DD3230B506D24205F51058CD601D1874F74F74F74F74F34F3",
		INIT_31 => x"6C51425918609985B0A45B0862CE4634D4514E34D4514A40CF90A694321D429A",
		INIT_32 => x"C52C9CB4B989255042DA5AE4A560645861904643106C58271411892462496318",
		INIT_33 => x"C6C0C324229075C6D2C1030C908A75C6C0C324219075C6D2C0C3241090F356C9",
		INIT_34 => x"9BCA52F471C909BC628A084A18236E8A08984A08DB2628A0846080DB02618A75",
		INIT_35 => x"00C08D8C40030030509B941E54F3505054BD1C724292F471C909BCA12F471C90",
		INIT_36 => x"3003023531000C00C08D4C4003003423631000C00D08D8C4003003023631000C",
		INIT_37 => x"703133333332737B337B0C4CCCCCCCCC9CDECCEEC1A023531000C00C08D4C400",
		INIT_38 => x"65765664764F230C18350421311E290A1A3706273310230010310303CB0C1272",
		INIT_39 => x"1ECEB363231CC645246590519A5939BA9E14436F95794CD744E196473FF46465",
		INIT_3A => x"8FB8B3900C87A4B927E733FF9B8648F0EFE1E63136F88F0EFB3ACCB4C4B96929",
		INIT_3B => x"FB26CF3AD30EF4E5E3534E9E65393FBB9FFBCCF4CFECEB31364B4CD09FB864AF",
		INIT_3C => x"4F013C84F21C59BFC03C7C03C400007F733711334C4B92292442C4C9B4B99C9B",
		INIT_3D => x"000000000000000000000000000000001CCD33311110C00F0F03210F0FF01FFC",
		INIT_3E => x"0000000000008CF300000CF300004CF300008CF300004CF300008CF300000CC4",
		INIT_3F => x"200CC5100000CCC4000000000000C07300004CF300000CF30000CCF300033373"
	)
	port map (
		DO   => DATA(5 downto 4),
		ADDR => rom_addr,
		CLK  => CLK,
		DI   => "00",
		EN   => ENA,
		SSR  => '0',
		WE   => '0'
	);

	ROM_1J_3 : RAMB16_S2
	generic map (
		INIT_00 => x"A8A440003F803000000000000000000000000000000000000000003820080200",
		INIT_01 => x"D31C70CF3CB0CB3CB2CF0C70C71CB0CB00000000000FFF1573FFC000FFD000A8",
		INIT_02 => x"B820820802001CC8070201C48073201CC8073201C08200CF000000000000000F",
		INIT_03 => x"20001C290F1CB7C32D34CB1C080BFFFF0C7220080031C8802083200800A0030C",
		INIT_04 => x"41083D1042087E00803FFFF4480807B60608003C00FD0CD8002008020C1E8072",
		INIT_05 => x"0368810C7E8003C28CF3820003C20CF3837F47000C8083F803B208200E008034",
		INIT_06 => x"0200C040F46023033E0003A02A0F03FA403A2A030D200E00EE01E8043A0A03E8",
		INIT_07 => x"3EC4B343C080F0203C480BA003A03FF04430C00303730003C1E0090BA46083FF",
		INIT_08 => x"C0C01C7C2DC2D1B0330C71F8E0C00F2C71F21F21CC0CC300000415871F4CE3CE",
		INIT_09 => x"733CFFC71C2DC2DC71F20F21CCCC00101C7C2DC2D1B0330C71F20F21CCCC0010",
		INIT_0A => x"72DC71E1C7C72C73807A0800731CFD33C093F0CCFCC1FC0CC70800B3C0907F2C",
		INIT_0B => x"FC330B3C0CF21C0F03CDFE4FFF0C333CDFFCF933CB8FB024FFC3C020E8F3FF1C",
		INIT_0C => x"C003C701C3D0030701C7032C0B1CB4F2FC783FFFFB10082C0C20E0C071C32C7F",
		INIT_0D => x"0D1E4FC0C4711C0D93C031C007F3408791247FFFFFFF0CC00C3300B383030371",
		INIT_0E => x"0D324072FC0C0CCCC0C0C0C0D0D0D0D0CCC0000D03408383CBA4FFFFC0C1D074",
		INIT_0F => x"00000000000000000000000000000000000000000000003C34C72F1331CBC4CF",
		INIT_10 => x"07E00CD60C160FC7900C79000000000000000000000000000000000000000000",
		INIT_11 => x"000000000000F0000F1010F1010F1010F1010F1010F1010F1010F1010F1010FE",
		INIT_12 => x"070BC2C1C40340208393FCF00C383FC0020B02C1F326C70082C4808C00200000",
		INIT_13 => x"FFF265E5FE40264E800B220828003EA2C4A28B02493F380B03FF0FCEF2C0FFCE",
		INIT_14 => x"2DF3C4700D0CC003C773FFFFC1C00470FC1C740C1F2FFFFFFFFF0C0FF11F2FFF",
		INIT_15 => x"7BBFF3377BBFF3377BBFF3377BBFFFFC0201C734C0CCCCCCCFFFF070C0F201FC",
		INIT_16 => x"71C2DF1C7334B872DF1EC1C7332FFFFFFFFF0C1FF11F2FFFFF30CCC00020B337",
		INIT_17 => x"3F0CFC3FCF02DFFFF3C0C0C000301820FFFF4442D3F3C403747C447D100FFFFC",
		INIT_18 => x"3071CE02CE01CE02CE0F44701EC701EFFFC71C731C0C74210A00C74411023FFF",
		INIT_19 => x"00000000000000000000000000000000000000000000000000000031CB3830B0",
		INIT_1A => x"0112233333333333333333221100F32211000000000000000001122333333333",
		INIT_1B => x"3333F33333333F33333333F33221100F33221100F33221100F00000000000000",
		INIT_1C => x"FF0000F0FFFFFFFFFFF0002030003F02000303020003030200F22223333F3333",
		INIT_1D => x"1100F33333333F33221100F3000023C00000000F0000003F0F0FFFFFFFFFFFFF",
		INIT_1E => x"80000000004000080000400004000000000C00002000020000EF3333222F3322",
		INIT_1F => x"3820002E02E03DE00FFFF1223FC00000003FFFCCCD54555555555542222F0000",
		INIT_20 => x"70F1C0C0C1C31F3C23C13C0CC0D090038F8F3CF0980800D13CF4F833E0B800E8",
		INIT_21 => x"0CE01D3C309802640FC72C71C793E43C03C01C265C24F3D3C70303033CE00380",
		INIT_22 => x"F079078F04F03033C071CE02C703033C00E02F3C0C704F07907CF04F03033C07",
		INIT_23 => x"80CE003800E08790B80F9020009013CF0820002640790B8F9000907923C0C704",
		INIT_24 => x"C13CB8F1C70A00C3E00C7038031C28030F8031C0E01D3C78F90004F090241C33",
		INIT_25 => x"03C03E483931C70FA0F8082003E02003CB80800C3E03C0C13F3C0B800B823C72",
		INIT_26 => x"0C0CC7A33E4009000E4A000E803A200003031DC70C771D0731C731C0E0F0C0CF",
		INIT_27 => x"0F1CC702303031C3A0A7A0028030303031E0031C7200C0C70CF8C3073E00030C",
		INIT_28 => x"C3C738702303031CB03031CF03C00C0C0C0E80031F8288288281C71C70C30323",
		INIT_29 => x"1CE40D07031CE40C1D0100C0E0094791261E0FF1111F408CC30C30E01E01C0C8",
		INIT_2A => x"003001CE0C000C00003001CE0FCF082003E20800001C002400001C00241C0703",
		INIT_2B => x"030C331F3CF824000C0C0C0C0E003800E4030303032CC731CFF1E0FFFC000C00",
		INIT_2C => x"2CC71C1DC7031C003031E807031DC0303031C71CB031C7824000C703031C7303",
		INIT_2D => x"820820FFF1C0C703033C0F380F2F0C0C0CF1C03032CC73C700C0CB31CF1C0303",
		INIT_2E => x"E4FE4033CB82007082007833CB82007082007833CB8200708208200783820820",
		INIT_2F => x"C7F338CE338338CE5F3C33E40007FD1018713F9000391D3D900FFF3E4701C900",
		INIT_30 => x"2CCE0800FF1C1C0C000301CF791C003F07007871DC7FF1C71C71C71C71C71C71",
		INIT_31 => x"7871E40392403FFDE03FDE00307BFF1C7071E01C7071E03CE0FE020B3380B808",
		INIT_32 => x"C04C0E013FC71CD02A04FFFFFF0E425E4900241DC77A5E43CC09071E41C70DC3",
		INIT_33 => x"B781C71C090F2CB79800071C70242CB781C71C090F2CB79801C71C000FF1C4C0",
		INIT_34 => x"0264481071C700264924002490007964025C24001E9792400240141E5979242C",
		INIT_35 => x"383C0CB4F4E04E003FFFF2C0CFF1CB3002041C71C0081071C700264481071C70",
		INIT_36 => x"04E0F033D3D381383C0CF4F4E04E0F032D3D381383C0CB4F4E04E0F032D3D381",
		INIT_37 => x"3F00003030330F0B0B07C0000C0C0C0CC3C2C2C1FF5F033D3D381383C0CF4F4E",
		INIT_38 => x"11000333222F0A05362527170603333122111303323023221302F3E842A100B0",
		INIT_39 => x"45A544E4944CFAB96BA9179512917A89A5E5449EA66A5127FEA4A95449F03322",
		INIT_3A => x"665655565251427A98A8448EBA92A52913AEA44E44EA66A51695127FAF4AEA9A",
		INIT_3B => x"E82BA4179413BF9E59E8F90544908EA6922A112923AAA49E945E50FE796A2A65",
		INIT_3C => x"0F003C00F00C047FC03C3C03C000003FF33F0033FAF4A99A9559AFA04F400A04",
		INIT_3D => x"000000000000000000000000000000002CFF00033330E02F0F00000F2FF00FFC",
		INIT_3E => x"000000000000782000007820000038200000B82000007820000038200000F80B",
		INIT_3F => x"2C3803CF0000F80F000000000000F0200000B8200000B820000078200003C0E0"
	)
	port map (
		DO   => DATA(7 downto 6),
		ADDR => rom_addr,
		CLK  => CLK,
		DI   => "00",
		EN   => ENA,
		SSR  => '0',
		WE   => '0'
	);

end RTL;
