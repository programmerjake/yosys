#!/bin/bash
set -ex
../../yosys -q -p 'read_verilog -icells -formal smtlib2_expr.v; prep; write_smt2 -wires smtlib2_expr.smt2'
../../yosys-smtbmc -s cvc4 --dump-vcd smtlib2_expr.vcd smtlib2_expr.smt2
