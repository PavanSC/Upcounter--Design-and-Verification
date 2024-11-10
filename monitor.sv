class monitor extends uvm_monitor;
	`uvm_component_utils(monitor) 
	
	virtual counter_if.MON_MP vif;
	
 	env_config m_cfg;

	seq_item data_sent;
	
	uvm_analysis_port#(seq_item) monitor_port;
 
function new(string name="monitor", uvm_component parent=null);
	super.new(name, parent);
	monitor_port=new("monitor_port",this);
endfunction


function void build_phase(uvm_phase phase);
 super.build_phase(phase); 
	
   if (!uvm_config_db #(env_config)::get(this,"","env_config",m_cfg))
		`uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?")
 endfunction

function void connect_phase(uvm_phase phase);
    vif = m_cfg.vif;
endfunction

task run_phase(uvm_phase phase);
    forever
       collect_data();     
endtask

task collect_data();
   // seq_item data_sent;
	
	data_sent= seq_item::type_id::create("data_sent");
	@( vif.mon_cb);
    data_sent.rst_h = vif.mon_cb.rst_h;
	data_sent.out=vif.mon_cb.out;
    `uvm_info("MONITOR",$sformatf("printing from monitor \n %s", data_sent.sprint()),UVM_LOW) 
	monitor_port.write(data_sent);
endtask 
      	  

// UVM report_phase
function void report_phase(uvm_phase phase);
  //  `uvm_info(get_type_name(), $sformatf("Report:Monitor Collected %0d Transactions", m_cfg.mon_rcvd_xtn_cnt), UVM_LOW)
endfunction : report_phase


endclass
