module top;
   
 //logic [3:0] out;
 //bit clk,rst_h;
   
    import ram_test_pkg::*;
	import uvm_pkg::*;
	`include "uvm_macros.svh"
	bit clock;  
	always 
		#10 clock=!clock;     

  
   		counter_if   in(clock);
		
    	up_counter  DUV(.out(in.out),.clk(clock),.rst_h(in.rst_h));
		
		
	//	bind DUV assert_mod p1(out, clk, rst_h);
  
   	initial 
		begin
			
			`ifdef VCS
         		$fsdbDumpvars(0, top);
        		`endif

			uvm_config_db #(virtual counter_if)::set(null,"*","vif",in);

			run_test();
		end  

property pp1;
	@(posedge clock) (in.rst_h) |=> (in.out==0);
endproperty

property pp2;
	@(posedge clock) $fell(in.rst_h)|=> in.out+1'b1;
endproperty



  PP1 :
  assert property (pp1) begin
    $display("Reset assertion pass");
  end else begin
    $display("Reset assertion fail");
  end

  PP2 :
  assert property (pp2) begin
    $display("Upcounting assertion pass");
  end else begin
    $display("Upcounting assertion fail");
  end

A1: cover property(pp1);
A2: cover property(pp2);
		
endmodule

