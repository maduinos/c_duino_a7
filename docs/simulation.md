# Simulation Guide

The testbenches are lightweight behavioral checks. They are intended to confirm reset, clocking, and basic signal movement before running the examples on hardware.

## Vivado

1. Create or open a Vivado project.
2. Add the target source files and matching testbench.
3. For `buzzer_ctrl`, add `buzzer/pitches_defs.vh` as an include file.
4. Run behavioral simulation.
5. Inspect the waveform for reset release and output changes.

## Icarus Verilog

If `iverilog` is available locally, the examples can be checked without opening Vivado.

```bash
cd c_duino_a7
iverilog -g2012 -I buzzer -o /tmp/tb_buzzer_ctrl.vvp buzzer/buzzer_ctrl.v buzzer/tb_buzzer_ctrl.v
vvp /tmp/tb_buzzer_ctrl.vvp

iverilog -g2012 -o /tmp/tb_led_ctrl.vvp led_ctrl/led_ctrl.v led_ctrl/tb_led_ctrl.v
vvp /tmp/tb_led_ctrl.vvp

iverilog -g2012 -o /tmp/tb_led_sw_ctrl.vvp led_sw_ctrl/led_sw_ctrl.v led_sw_ctrl/tb_led_sw_ctrl.v
vvp /tmp/tb_led_sw_ctrl.vvp

iverilog -g2012 -o /tmp/tb_servo_ctrl.vvp servo_ctrl/servo_ctrl.v servo_ctrl/tb_servo_ctrl.v
vvp /tmp/tb_servo_ctrl.vvp
```

## Expected Scope

These tests do not prove timing closure, hardware pin mapping, or board-level electrical behavior. Use Vivado implementation reports and hardware validation for those checks.
