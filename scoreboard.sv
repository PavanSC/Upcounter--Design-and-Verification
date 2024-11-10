class scoreboard extends uvm_scoreboard;
	
	`uvm_component_utils(scoreboard)

  	uvm_tlm_analysis_fifo #(seq_item) fifo_h;
	
	seq_item data_sent,ref_data;
	
	seq_item cov_data;
	
	
	
	covergroup cov1;
		option.per_instance=1;
		
		RESET : coverpoint cov_data.rst_h { bins one={[0:1]};}
		
		OUT : coverpoint  cov_data.out {bins count1={[0:15]};}
	endgroup

function new(string name="scoreboard",uvm_component parent=null);
	super.new(name,parent);
    fifo_h = new("fifo_h", this);
	 `uvm_info(get_type_name, "I am in build phase", UVM_LOW)
	cov1=new;
endfunction

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction

task run_phase(uvm_phase phase); 
  forever   
	begin
	//	$display("I am in run_phase");     
		fifo_h.get(data_sent);
		cov_data=data_sent;
		data_sent.print;
		
		assert($cast(ref_data, data_sent.clone()));  
		data_out_ref(ref_data);
			//`uvm_info(" SB","write data" , UVM_LOW)
		check_data(data_sent,ref_data);  
		cov1.sample();
	end 
 endtask 
 
 
 //task data_out_ref(ref seq_item data_sent);  
 task data_out_ref(seq_item ref_data);
//	$display("I am in ref model"); 
	  /*
	if(!data_sent.rst_h== 1)   
		data_sent.out =data_sent.out+1'b1; 
		else   
		
		data_sent.out=0;
		*/
	repeat(ref_data.rst_h)
		begin
			if(ref_data.rst_h == 1)
				ref_data.out=0;
		  
			else
				ref_data.out=ref_data.out+1'b1;
		end	
 endtask 
 
 
 task check_data(seq_item data_sent,seq_item ref_data); 
		$display("I am here in check data");   
	if(data_sent.compare(ref_data))
	`uvm_info(get_full_name(), "Successfully compared", UVM_LOW);   
endtask
 
 endclass


