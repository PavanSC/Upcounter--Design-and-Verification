class tb extends uvm_env;

  	`uvm_component_utils(tb)

	env_config m_cfg;

	src_agent  agnth;
	scoreboard sb;
	
	extern function new(string name = "tb", uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);

endclass: tb
	
function tb::new(string name = "tb", uvm_component parent);
	super.new(name,parent);
endfunction

function void tb::build_phase(uvm_phase phase);

	
    super.build_phase(phase);
    agnth=src_agent::type_id::create("agnth",this);
	sb =scoreboard::type_id::create("sb",this);
  	
endfunction


function void tb::connect_phase(uvm_phase phase);
	agnth.monh.monitor_port.connect(sb.fifo_h.analysis_export);
endfunction
	