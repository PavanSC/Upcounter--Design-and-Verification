class base_seq extends uvm_sequence#(seq_item);
	`uvm_object_utils(base_seq) 

 function new(string name ="base_seq");
	super.new(name); 
 endfunction


 task body();
	req = seq_item::type_id::create("req");
	repeat(20)
		begin
			start_item(req);
			assert(req.randomize());
		/*	$display("\t ********************************************");
			$display("\t RANDOMIZED DATA IN BASE_SEQ rst_h=%0d",req.rst_h);
			$display("\t ********************************************");
			*/
			finish_item(req);
		end
 endtask

endclass

//assert(req.randomize() with {rst_h==0;});