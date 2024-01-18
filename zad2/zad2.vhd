library ieee;use
iee.std_logic_1164.all;


entity zad2 is 
	port (
		clk : in std_logic;
		rst : in std_logic;
		a : in std_logic;
		b : in std_logic;
		c : in std_logic;
		d : in std_logic;
		e : in std_logic;
		f : in std_logic;
		g : in std_logic;
		o1 : in std_logic;
		o2 : in std_logic;
		);
end zad2;

architecture Behavioral of zad2 is 
	signal sel  : std_logic_vector(2 downto 0 );
	signal o1_reg,o1_next : std_logic;
	signal o2_reg,o2_next : std_logic;
	signal lut1_s,lut2_s,lu3_s : std_logic;
	

begin 

	 sel <= d & e & f;
	 
	 reg_proc : process(clk,rst)
	 begin 
	 	if(rst = '1') then 
			o1_reg <= '0' ;
			o2_reg <= '0';
		elsif rising_edge(clk) then 
			
			o1_reg <= o1_next ;
			o2_reg <= o2_next;
		end if ;
	end process reg_proc;
	
	o1 <= o1_reg;
	o2 <= o2_reg;
	
	mux_proc : process(sel,o1_next,b,c,a)
	begin 
	 	if sel = "000" then
  		  	o1_next <= b;
		elsif sel = "0001" then
   		 	o1_next <= b;
		elsif sel = "0010" then
  		 	 o1_next <= c;
		elsif sel = "0011" then
  		  	o1_next <= a;
		elsif sel = "0100" then
    			o1_next <= '1';
		elsif sel = "0110" then
   			o1_next <= '1';
   		else
   		 	o1_next <= '0';
		end if;
	end process mux_proc;
	
	look_up_table_1 : entity work.lut
	generic map(INIT => "0101001101010000")
	port map(
		I3 => b,
		I2 => d,
		I1 => e,
		I0 => f,
		O => lut1_s
		);

	look_up_table_2 : entity work.lut
	generic map(INIT => "0000100000000000")
	port map(
		I3 => a,
		I2 => d,
		I1 => e,
		I0 => f,
		O => lut2_s
		);
   			
	look_up_table_3 : entity work.lut
	generic map(INIT => "0000010000000000")
	port map(
		I3 => c,
		I2 => d,
		I1 => e,
		I0 => f,
		O => lut3_s
		);

	look_up_table_4 : entity work.lut
	generic map(INIT => "1111111111111110")
	port map(
		I3 => '0',
		I2 => lut2_s,
		I1 => lut1_s,
		I0 => lut3_s,
		O => o2_next
		);

	
	
	
end architecture Behavioral;	
   			
   			
   			
   			
   
   			
   			
   			
   			
   			
   			
   			
   			
   			
   			
   			
   			
   			
   			
   			
   			
   			
   			
   			
	
