// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

class entropy_src_base_test extends cip_base_test #(
    .CFG_T(entropy_src_env_cfg),
    .ENV_T(entropy_src_env)
  );

  `uvm_component_utils(entropy_src_base_test)
  `uvm_component_new

   virtual function void build_phase(uvm_phase phase);
     super.build_phase(phase);

     configure_env();
   endfunction // build_phase

  // the base class dv_base_test creates the following instances:
  // entropy_src_env_cfg: cfg
  // entropy_src_env:     env

  // the base class also looks up UVM_TEST_SEQ plusarg to create and run that seq in
  // the run_phase; as such, nothing more needs to be done

  // The following knob settings will serve as the defaults.
  // Overrides should happen in the specific testcase.

  virtual function void configure_env();
    // TODO: randomize seed_cnt
    cfg.seed_cnt                  = 1;
    cfg.otp_en_es_fw_read_pct     = 100;
    cfg.otp_en_es_fw_over_pct     = 100;
    cfg.dut_cfg.me_regwen_pct     = 100;
    cfg.dut_cfg.module_enable_pct = 100;
    cfg.dut_cfg.type_bypass_pct   = 100;

    // Setting the following parameters to less than zero means that random reconfig or random
    // fatal alerts will not be driven by the RNG virtual sequence unless they are overridden
    // in one of the derived test classes.
    cfg.mean_rand_reconfig_time   = -1.0;
    cfg.mean_rand_csr_alert_time  = -1.0;

  endfunction

endclass : entropy_src_base_test
