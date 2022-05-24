#!/bin/bash
set -ex
../../yosys -q -p 'read_verilog -icells -formal floor_divmod.v; prep; write_smt2 -wires floor_divmod.smt2'
../../yosys-smtbmc --unroll --dump-vcd floor_divmod.vcd floor_divmod.smt2
