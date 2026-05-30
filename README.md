# C_DUINO_A7 FPGA Demo

[![Verilog Simulation](https://github.com/maduinos/c_duino_a7/actions/workflows/verilog-sim.yml/badge.svg)](https://github.com/maduinos/c_duino_a7/actions/workflows/verilog-sim.yml)

FPGA demo sources for the C_DUINO_A7 board, maintained by Maduinos as a public reference for FPGA education, board bring-up, and small hardware prototyping work.

## Project Status

- Status: public demo/reference repository
- Primary audience: FPGA learners, customers reviewing Maduinos FPGA work, and C_DUINO_A7 users
- HDL scope: simple peripheral examples for LEDs, switches, a buzzer, and a hobby servo
- Tool baseline: Vivado 2023.2.2 and Vitis Classic 2023.2.2

This repository is documentation-focused and keeps the HDL examples intentionally small. For project archives and board-level files, see `c_duino_a7_demo.zip` and `c_duino_a7_scm.jpg`.

## Repository Layout

| Path | Purpose |
| --- | --- |
| `led_ctrl/` | Register-driven LED output example |
| `led_sw_ctrl/` | Switch-to-LED mapping example |
| `buzzer/` | Clock divider style buzzer output example |
| `servo_ctrl/` | 50 Hz PWM hobby servo signal example |
| `docs/overview.md` | Module-level notes and intended use |
| `docs/simulation.md` | Lightweight simulation guidance |
| `docs/bring-up-guide.md` | Board bring-up sequence and safety checks |
| `docs/adaptation-guide.md` | Guidance for adapting examples into larger projects |
| `docs/release-checklist.md` | Public release hygiene checklist |
| `.github/workflows/verilog-sim.yml` | GitHub Actions simulation check |
| `c_duino_a7_demo.zip` | Original packaged demo archive |
| `c_duino_a7_scm.jpg` | Board schematic/reference image |

## Quick Start

1. Install Vivado 2023.2.2 or a compatible Vivado version.
2. Review the module you want to use under `led_ctrl/`, `led_sw_ctrl/`, `buzzer/`, or `servo_ctrl/`.
3. Add the selected HDL source and matching testbench to your Vivado project.
4. Run behavioral simulation before assigning pins or programming hardware.
5. Use `docs/overview.md` to check assumptions such as clock frequency and reset polarity.

## Design Notes

- Reset is active-low and named `resetn`.
- Examples are written for readability and board bring-up, not for reusable production IP packaging.
- `servo_ctrl` assumes a 27 MHz input clock for the current duty constants.
- Testbenches are basic sanity checks and should be extended before product use.

## Business Context

Maduinos uses this repository as a public FPGA example set for education and consulting conversations. The goal is to make board examples easy to inspect, simulate, and adapt while keeping commercial project-specific work out of the public repository.

## Related Links

- Blog: <https://maduinos.blogspot.com/>
- Business page: <https://biz.maduinos.com/>

## Project Management

- Changes: `CHANGELOG.md`
- Release process: `RELEASE.md`
- Support scope: `SUPPORT.md`
- Contribution guide: `CONTRIBUTING.md`
- Security reporting: `SECURITY.md`

## Version History

| Version | Author | Date | Changes |
| --- | --- | --- | --- |
| 0.03 | Codex | 2026-05-30 | Improve public documentation, repository hygiene, and release guidance |
| 0.02 | Codex | 2026-02-13 | Fix TB module names/widths and reset handling; improve LED-SW mapping |
| 0.01 | Maduinos | 2024-03-01 | Initial C_DUINO_A7 EXT. demo release |

## License

Licensed under the Apache License, Version 2.0. See `LICENSE`.
