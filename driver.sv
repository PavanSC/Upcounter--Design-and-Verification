class driver extends uvm_driver#(seq_item);
	`uvm_component_utils(driver) 
 
	virtual counter_if.DRV_MP vif;
    env_config m_cfg;

function new(string name="driver", uvm_component parent);
 super.new(name, parent); 
 endfunction
 
 
function void build_phase(uvm_phase phase);
	super.build_phase(phase); 
 
	if (!uvm_config_db#(env_config)::get(this, "","env_config", m_cfg)) 
	`uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?")
endfunction

function void connect_phase(uvm_phase phase);
	vif=m_cfg.vif;
	uvm_top.print_topology;
endfunction


task run_phase(uvm_phase phase);
 forever
	begin
		seq_item_port.get_next_item(req);
		send_to_dut(req);
		seq_item_port.item_done();
		end
 endtask

task send_to_dut(seq_item xtn);
	@(vif.drv_cb);
		vif.drv_cb.rst_h<='1;
	vif.drv_cb.rst_h<=xtn.rst_h;
	 `uvm_info("DRIVER",$sformatf("printing from driver \n %s", xtn.sprint()),UVM_LOW)
//	m_cfg.drv_data_sent_cnt++;
	
endtask

function void report_phase(uvm_phase phase);
    //`uvm_info(get_type_name(), $sformatf("Report:Driver sent %0d transactions", m_cfg.drv_data_sent_cnt), UVM_LOW)
endfunction

endclass
