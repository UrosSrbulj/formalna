library ieee;use
iee.std_logic_1164.all;


entity zad1 is 
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
		h : in std_logic;
		o1 : in std_logic;
		o2 : in std_logic;
		);
end zad1;

architecture Behavioral of zad1 is 

	signal sel  : std_logic_vector(3 downto 0 );
	signal o1_reg,o1_next  : std_logic;
	signal o2_reg,o2_next : std_logic;
	signal dec1_s ,dec2_s : std_logic_vector(3 downto 0 );
	
	
begin 
 	
 	sel <= d & c & b & a ;
 
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
	
	dec1_proc : process(e,f,dec1_s) is 
		variable dec1 : std_logical_vector(1 downto 0)
	begin 
		dec1 := f & e;
		
		if dec1 = "00" then 
			dec1_s <= "0001";
		elsif dec1 = "01" then
			dec1_s <= "0010";
		if dec1 = "10" then 
			dec1_s <= "0100";
		elsif dec1 = "01" then
			dec1_s <= "0010";
		if dec1 = "11" then 
			dec1_s <= "1000";
		else
			dec1_s <="0000";
		end if;
	end process dec1_proc;
	
	
	dec2_proc : process(g,h,dec2_s) is 
		variable dec2 : std_logical_vector(1 downto 0)
	begin 
		dec2 := g & h;
		
		if dec2 = "00" then 
			dec2_s <= "0001";
		elsif dec2 = "01" then
			dec2_s <= "0010";
		if dec2 = "10" then 
			dec2_s <= "0100";
		elsif dec2 = "01" then
			dec2_s <= "0010";
		if dec2 = "11" then 
			dec2_s <= "1000";
		else
			dec2_s <="0000";
		end if;
	end process dec2_proc;
	
	
	o2_next <= ((((not a) and (not b) and (not c) and (not e) and (not f)) or
		     	 ((a)     and (not b) and (not c) and (e)     and (not f)) or
		     	 ((not a) and (b)     and (not c) and (not e) and (f))     or
		     	 ((a)     and (b)     and (not c) and (e)     and (f))     or
				 ((not a) and (not b) and (c)     and (not g) and (not h)) or
		     	 ((a)     and (not b) and (c)     and (g)     and (not h)) or
		     	 ((not a) and (b)     and (c)     and (not g) and (h))     or
		     	 ((a)     and (b)     and (c)     and (g)     and (h))) and (not d)) or d;
		     	 
		     	 
	o1_next_proc: process(sel ,dec1_s,dec2_s) is
	begin
		if sel = "0000" then
  		  	o1_next <= dec1_s(0);
		elsif sel = "0001" then
   		 	o1_next <= dec1_s(1);
		elsif sel = "0010" then
  		 	 o1_next <= dec1_s(2);
		elsif sel = "0011" then
  		  	o1_next <= dec1_s(3);
		elsif sel = "0100" then
    			o1_next <= dec2_s(0);
		elsif sel = "0101" then
   			o1_next <= dec2_s(1);
		elsif sel = "0110" then
   		 	o1_next <= dec2_s(2);
		elsif sel = "0111" then
   		 	o1_next <= dec2_s(3);
		else
   		 	o1_next <= '1';
		end if;
	end process o1_next_proc;
	
	
end architecture Behavioral;
		
	
			
			
		
		
	
		     	 
		     	 
		     	 
	
		

