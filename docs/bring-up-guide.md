# C_DUINO_A7 Bring-Up Guide

This guide keeps the public demo flow focused on quick, repeatable board checks.

## 1. Confirm Tooling

- Vivado 2023.2.2 is the documented baseline.
- Vitis Classic 2023.2.2 is the documented software baseline for flows that need it.
- Confirm Vivado project settings before programming hardware.

## 2. Start With Reset and Clock

- Confirm that the selected top-level design uses active-low `resetn`.
- Confirm the board clock frequency before using `servo_ctrl`.
- Check that timing constraints match the actual clock source.

## 3. Validate Simple GPIO First

Start with `led_ctrl` or `led_sw_ctrl`.

- Confirm pin assignments for LEDs and switches.
- Program the FPGA with the simplest design first.
- Verify that reset clears LEDs.
- Verify that switch-to-LED mapping matches the expected board pins.

## 4. Validate Output Timing

Use `buzzer_ctrl` and `servo_ctrl` only after basic GPIO is known to work.

- For `buzzer_ctrl`, confirm the output pin is connected to the expected buzzer circuit.
- For `servo_ctrl`, use an appropriate external power setup for the servo.
- Do not power a servo directly from an FPGA I/O pin.

## 5. Keep Demo Changes Small

When adapting examples:

- Change one module at a time.
- Review clock, reset, and pin assumptions before hardware checks.
- Document clock, reset, and pin assumptions in the README or a local project note.
