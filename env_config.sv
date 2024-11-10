class env_config extends uvm_object;

	`uvm_object_utils(env_config)

	virtual counter_if vif;
	uvm_active_passive_enum is_active = UVM_ACTIVE;

	extern function new(string name = "env_config");

endclass: env_config

function env_config::new(string name = "env_config");
  super.new(name);
endfunction

