class seq_item extends uvm_sequence_item;
	rand logic rst_h;
	logic [3:0] out; 
     
	`uvm_object_utils_begin(seq_item)
		`uvm_field_int(rst_h,UVM_ALL_ON)
		`uvm_field_int(out,UVM_ALL_ON)
	`uvm_object_utils_end
	 
 constraint c1 {rst_h dist{
                    1:= 1,
                    0:= 19
                    };}
 function new(string name = "seq_item");
	super.new(name); 
 endfunction

endclass