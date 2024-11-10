//Interface 

interface counter_if(input bit clock);
	logic [3:0]out;
	bit rst_h;
	
	
	clocking drv_cb@(posedge clock);
		default input#1 output#1;
		
		output rst_h;
	endclocking

	clocking mon_cb@(posedge clock);
		default input#0;
		
		input rst_h;
		input out;

	endclocking

/*	clocking rmon_cb@(posedge clock);
		default input#1 output#1;
		
		input out;
	endclocking
*/	
	modport DRV_MP   (clocking drv_cb);
	modport MON_MP   (clocking mon_cb);
//	modport RMON_MP  (clocking rmon_cb);

endinterface
