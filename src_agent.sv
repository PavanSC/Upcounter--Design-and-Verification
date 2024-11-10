class src_agent extends uvm_agent;
	
	`uvm_component_utils(src_agent) 
 
	env_config m_cfg;
 
	sequencer seqr; 
	driver drv; 
	monitor monh; 
	
 
function new(string name="src_agent", uvm_component parent=null);
	super.new(name, parent); 
endfunction


function void build_phase(uvm_phase phase);
	super.build_phase(phase); 
 
	if(!uvm_config_db #(env_config)::get(this,"","env_config",m_cfg))
		`uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?") 
	monh=monitor::type_id::create("monh",this);
	
	if(m_cfg.is_active == UVM_ACTIVE) 
	begin
		seqr = sequencer::type_id::create("seqr", this);
		drv = driver::type_id::create("drv", this);
	end

endfunction


function void connect_phase(uvm_phase phase);
	super.connect_phase(phase); 
 
	if(m_cfg.is_active == UVM_ACTIVE) 
		begin
			drv.seq_item_port.connect(seqr.seq_item_export);
		end
endfunction
endclass