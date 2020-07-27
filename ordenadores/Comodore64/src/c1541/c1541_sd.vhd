---------------------------------------------------------------------------------
-- Commodore 1541 to SD card (read/write) by Dar (darfpga@aol.fr) 24-May-2017
-- http://darfpga.blogspot.fr
--
-- c1541_sd reads D64 data from raw SD card, produces GCR data, feeds c1541_logic
-- Raw SD data : each D64 image must start on 256KB boundaries
-- disk_num allow to select D64 image
--
-- c1541_logic    from : Mark McDougall
-- spi_controller from : Michel Stempin, Stephen A. Edwards
-- via6522        from : Arnim Laeuger, Mark McDougall, MikeJ
-- T65            from : Daniel Wallner, MikeJ, ehenciak
--
-- c1541_logic    modified for : slow down CPU (EOI ack missed by real c64)
--                             : remove iec internal OR wired
--                             : synched atn_in (sometime no IRQ with real c64)
-- spi_controller modified for : sector start and size adapted + busy signal
-- via6522        modified for : no modification
--
--
-- Input clk 32MHz and 18MHz (18MHz could be replaced with 32/2 if needed)
--     
---------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity c1541_sd is
port(
	clk32 : in std_logic;
   clk32n: in std_logic;
   clk_c1541 : in std_logic;
	
	disk_num : in std_logic_vector(9 downto 0);

	iec_atn_i  : in std_logic;
	iec_data_i : in std_logic;
	iec_clk_i  : in std_logic;
	iec_data_o : out std_logic;
	iec_clk_o  : out std_logic;
	iec_reset_i : in std_logic;
	
--	sd_miso  : in std_logic;     --A quitar por el nuevo control de OSD
--	sd_cs_n  : buffer std_logic; --A quitar por el nuevo control de OSD
--	sd_mosi  : buffer std_logic; --A quitar por el nuevo control de OSD
--	sd_sclk  : buffer std_logic; --A quitar por el nuevo control de OSD
	
	dsk_addr : out std_logic_vector(18 downto 0);
	dsk_data_in  : in  std_logic_vector(7 downto 0);
	dsk_data_out : out std_logic_vector(7 downto 0);
	dsk_wr   : out std_logic;
	
	rom_c1541 : in boolean;
	host_loadrom : in std_logic
);
end c1541_sd;

architecture struct of c1541_sd is

signal spi_ram_addr    : std_logic_vector(12 downto 0);
signal spi_ram_di      : std_logic_vector( 7 downto 0);
signal spi_ram_we      : std_logic;

signal ram_addr        : std_logic_vector(12 downto 0);
signal ram_di          : std_logic_vector( 7 downto 0);
signal ram_do          : std_logic_vector( 7 downto 0);
signal ram_we          : std_logic;

signal floppy_byte_addr : std_logic_vector(7 downto 0);
signal floppy_ram_addr  : std_logic_vector(12 downto 0);
signal floppy_ram_di    : std_logic_vector( 7 downto 0);
signal floppy_ram_we    : std_logic;

signal gcr_do   : std_logic_vector(7 downto 0); -- data read
signal gcr_di  : std_logic_vector(7 downto 0); -- data to write
signal mode   : std_logic;                    -- read/write
signal mode_r : std_logic;                    -- read/write
signal stp    : std_logic_vector(1 downto 0); -- stepper motor control
signal stp_r  : std_logic_vector(1 downto 0); -- stepper motor control
signal mtr    : std_logic ;                   -- stepper motor on/off
--signal mtr_r  : std_logic ;                   -- stepper motor on/off
--signal freq   : std_logic_vector(1 downto 0); -- motor (gcr_bit) frequency
signal sync_n : std_logic;                    -- reading SYNC bytes
signal byte_n : std_logic;                    -- byte ready
signal act    : std_logic;                    -- activity LED
signal act_r  : std_logic;                    -- activity LED

signal reset   : std_logic;
signal reset_r : std_logic;

signal track_num         : std_logic_vector(6 downto 0);
signal track             : std_logic_vector(5 downto 0);
signal sd_busy           : std_logic;

--type byte_array is array(0 to 8191) of std_logic_vector(7 downto 0);
--signal track_buffer : byte_array;

signal tr00_sense_n     : std_logic;
signal save_track      : std_logic;
signal track_modified   : std_logic;
signal sector_offset    : std_logic;
signal save_track_stage : std_logic_vector(3 downto 0);
signal sector           : std_logic_vector(4 downto 0);

signal disk_readonly : std_logic;
signal disk_change : std_logic;
signal ch_timeout : integer := 0;
signal prev_change : std_logic := '0';
signal ch_state : std_logic := '0';

signal disk_ant : std_logic_vector(9 downto 0);
signal host_loadrom_r : std_logic := '0';

  -- C64 - 1541 start_sector in D64 format per track number [0..40]
	type start_sector_array_type is array(0 to 40) of integer range 0 to 1023;
	signal start_sector_array : start_sector_array_type := 
		(  0,  0, 21, 42, 63, 84,105,126,147,168,189,210,231,252,273,294,315,336,357,376,395,
		414,433,452,471,490,508,526,544,562,580,598,615,632,649,666,683,700,717,734,751);
	
	signal start_sector_addr : std_logic_vector(9 downto 0); -- addresse of sector within full disk

begin

 disk_readonly <= '0';
 tr00_sense_n <= '1' when (track > "000000") else '0';
 
 	process(clk32) begin
		if rising_edge(clk32) then
		reset_r <= iec_reset_i;
		reset <= reset_r;
		end if;
	end process;
	
	process(clk32) begin
		if rising_edge(clk32) then
		    --disk_ant <= disk_num; 		 
			 prev_change <= disk_change;
			 host_loadrom_r <= host_loadrom;
			if (host_loadrom_r = '1' and host_loadrom = '0') then 
			 disk_change <= '1';
			else 
			 disk_change <= '0';
			end if; 
			if ch_timeout > 0 then
				ch_timeout <= ch_timeout - 1;
				ch_state <= '1';
			else
				ch_state <= '0';
			end if;
			if (prev_change = '0' and disk_change = '1') then --(host_loadrom_r = '1' and host_loadrom = '0') then --disk_ant /= disk_num then 
                ch_timeout <= 15000000;
         end if;
		end if;
	end process;
 	
  c1541 : entity work.c1541_logic
	port map
   (
    clk32 => clk32,--clk32,
    reset => reset,

    -- serial bus
	 sb_clk_in  => not iec_clk_i,
	 sb_data_in => not iec_data_i,
    sb_atn_in  => not iec_atn_i,	 
    sb_clk_out  => iec_clk_o,	 
    sb_data_out => iec_data_o,
    --sb_atn_oe  => iec_atn_o,

    -- drive-side interface
    ds              => "00",     -- device select
    din             => gcr_do,  -- data read 
    dout            => gcr_di, -- data to write
    mode            => mode,     -- read/write
    stp             => stp,      -- stepper motor control
    mtr             => mtr,      -- motor on/off
    freq            => open,     -- motor frequency
    sync_n          => sync_n,   -- reading SYNC bytes
    byte_n          => byte_n,   -- byte ready
    wps_n           => (not disk_readonly) xor ch_state,      -- write-protect sense (0 = protected)
    tr00_sense_n    => tr00_sense_n,      -- track 0 sense (unused?)
    act             => act--,      -- activity LED
    --rom_c1541      => rom_c1541
  );

floppy : entity work.c1541_gcr
port map
(
	clk32  => clk32,--clk32,
	dout  => gcr_do,  -- data read
	din   => gcr_di, -- data to write	 
	mode   => mode,   -- read/write
	mtr    => mtr,    -- stepper motor on/off
	sync_n => sync_n, -- reading SYNC bytes
	byte_n => byte_n, -- byte ready

	track   => track,
    sector  => sector,
    
	byte_addr   => floppy_byte_addr, 

	ram_do     => ram_do, 	
	ram_di     => floppy_ram_di,
	ram_we     => floppy_ram_we,
	ram_ready  => not sd_busy		
	
);
	
	process (clk32)
	begin
		if rising_edge(clk32) then
			stp_r <= stp;
			act_r <= act;
			save_track <= '0';
			track <= track_num(6 downto 1);

			if floppy_ram_we = '1' then track_modified <= '1'; end if;
			if disk_change = '1' then track_modified <= '0'; end if;

			if reset = '1' then
				track_num  <= "0100100";
				track_modified <= '0';
			else
				if mtr = '1' then
					if(  (stp_r = "00" and stp = "10")
						or (stp_r = "10" and stp = "01")
						or (stp_r = "01" and stp = "11")
						or (stp_r = "11" and stp = "00")) then
							if track_num < "1010000" then
								track_num <= track_num + '1';
							end if;
							save_track <= track_modified;
							track_modified <= '0';
					end if;

					if(  (stp_r = "00" and stp = "11")
						or (stp_r = "10" and stp = "00")
						or (stp_r = "01" and stp = "10")
						or (stp_r = "11" and stp = "01")) then 
							if track_num > "0000001" then
								track_num <= track_num - '1';
							end if;
							save_track <= track_modified;
							track_modified <= '0';
					end if;
				end if;

				if act_r = '1' and act = '0' then -- stopping activity
					save_track <= track_modified;
					track_modified <= '0';
				end if;
			end if;
		end if;  -- rising edge clock
	end process;

start_sector_addr <= std_logic_vector(to_unsigned(start_sector_array(to_integer(unsigned(track))),10));
sector_offset <= start_sector_addr(0);
dsk_addr <= ('0' & (start_sector_addr + sector) & floppy_byte_addr);


process(clk32n)
begin
   if rising_edge(clk32n) then 
	 ram_do       <= dsk_data_in;
	 dsk_data_out <= floppy_ram_di;
	 dsk_wr       <= floppy_ram_we;
    sd_busy <= '0';
	end if;
end process;

end struct;
