# C_DUINO_A7 Demo Overview

## Intent

The modules in this repository are compact examples for learning and board bring-up. They are useful for checking clocks, reset behavior, basic GPIO, a buzzer output, and a PWM servo output on the C_DUINO_A7 board.

## Modules

### `led_ctrl`

`led_ctrl` copies the low `LED_NUM` bits of `led_state` to the LED output register on each clock edge.

- Reset: active-low `resetn`
- Parameter: `LED_NUM`
- Main use: memory-mapped or register-driven LED output

### `led_sw_ctrl`

`led_sw_ctrl` maps switch inputs to LED outputs. When there are more LEDs than switches, the unused high bits are zero-filled.

- Reset: active-low `resetn`
- Parameters: `LED_NUM`, `SW_NUM`
- Main use: quick GPIO/switch sanity check

### `buzzer_ctrl`

`buzzer_ctrl` toggles the `buzzer` output after a counter reaches the selected note constant from `pitches_defs.vh`.

- Reset: active-low `resetn`
- Include file: `pitches_defs.vh`
- Main use: clock-divider style sound output demo

### `servo_ctrl`

`servo_ctrl` generates a 50 Hz PWM signal using the `pwm_duty_value` input.

- Reset: active-low `resetn`
- Input clock assumption: 27 MHz
- Duty reference:
  - `27000`: about 1 ms
  - `40500`: about 1.5 ms
  - `54000`: about 2 ms

## Integration Notes

- Confirm your board clock before using `servo_ctrl`; update `CLK_FREQ_HZ` and duty constants if the clock differs.
- Confirm pin constraints in your Vivado project before programming hardware.
- Keep demo-specific glue logic outside these small modules when adapting them to a larger project.
