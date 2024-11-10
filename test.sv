
class test extends uvm_test;
`uvm_component_utils(test)
tb env_h;
env_config m_cfg;
base_seq seq;

function new (string name ="test",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
m_cfg=env_config::type_id::create("m_cfg");
assert(uvm_config_db #(virtual counter_if)::get(this,"","vif",m_cfg.vif));
uvm_config_db #(env_config)::set(this,"*","env_config",m_cfg);
env_h=tb::type_id::create("env_h",this);
endfunction

task run_phase(uvm_phase phase);
seq=base_seq::type_id::create("seq");
phase.raise_objection(this);
seq.start(env_h.agnth.seqr);
phase.drop_objection(this);
endtask
endclass