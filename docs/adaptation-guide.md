> 만든 사람: maduinos<br>
> 문서 만든 날짜: 2026-05-30<br>
> https://maduinos.blogspot.com/

# Adaptation Guide

These examples are intentionally small. When adapting them into a larger FPGA project, keep the module boundary clear.

## Recommended Pattern

1. Keep the demo module source unchanged at first.
2. Add a thin wrapper or top-level integration file in your project.
3. Connect board pins and registers in the wrapper.
4. Simulate the wrapper and the original module together.
5. Only then modify the original module if the behavior itself needs to change.

## Parameter and Clock Assumptions

- `led_ctrl` and `led_sw_ctrl` expose simple width parameters.
- `servo_ctrl` has a documented 27 MHz clock assumption.
- `buzzer_ctrl` uses `pitches_defs.vh` for note constants.

If your board clock differs, update the timing constants and record the change in your project notes.

## What To Avoid

- Do not commit generated Vivado output as source.
- Do not mix customer-specific files into this public demo repository.
- Do not make a small demo module responsible for board-wide configuration.

