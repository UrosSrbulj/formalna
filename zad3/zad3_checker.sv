checker zad3_checker (
	clk,
	rst,

	//zad1:
	RT1,
   	RDY1,
	START1,
	ENDD1,
	
	//zad2:	
	ER2,
	
	//zad3:	
	ER3,	
	RDY3,
	
	//zad4:
	RDY4,
	START4,
	
	//zad5:
	ENDD5,
	STOP5,
	ER5,
	RDY5,
	START5,
	
	//zad6:
	ENDD6,
	STOP6,
	ER6,
	RDY6,
	
	//zad7:
	ENDD7,
	START7,
	STATUS_VALID7,
	INSTARTSV7,
	
	//zad8:
	RT8,
	ENABLE8,
	
	//zad9:
	RDY9,
	START9,
	INTERUPT9,
	
	//zad10:
	ACK10,
	REQ10
	);

	default
	clocking @(posedge clk);
	endclocking

	default disable iff rst;
		
	logic rt1_s

	always @(posedge clk) begin
		if(RT1 == 1'b0) begin
			rt1_s <= 1'b1;
		end
	end

	

	//zad1
	assert property ((ENDD1 or RDY1 or START1) |-> rt1_s);
	//zad2
	assert property (ER2 |->  $fell(ER2) within [1:3]);
	//zad3 
	assert property ((ER3 and RDY3) |=>  ((!ER3) or (!RDY3)));
	//zad4
	assert property (RDY4 |-> $past(START4); 
	//zad5
	assert property ((ENDD5 or STOP5 or ER5) |=> !RDY5);  
	//zad6
	assert property ((ENDD6 or STOP6 or ER6) |-> RDY6);  
	//zad7 
	assert property (ENDD7 |-> !(START7 and STATUS_VALID7)); 
	//zad8
	assert property (RT8 |-> !ENABLE8);  
	//zad8
	assert property (!$past(RT8,2) |-> ENABLE); 	
	//zad9
	assert property (($fell(RDY9) or $fell(START9)) |-> INTERUPT9 ); 
	//zad10
	assert property (REQ10 |-> ##5 ACK10);  

