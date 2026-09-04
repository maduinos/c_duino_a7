> 만든 사람: maduinos<br>
> 문서 만든 날짜: 2026-05-30<br>
> https://maduinos.blogspot.com/

# Public Release Checklist

Use this checklist before publishing a new C_DUINO_A7 example or release archive.

- README explains the board, tool version, and intended audience.
- HDL source is separated from generated Vivado/Vitis output.
- Testbench exists for each new module or the limitation is documented.
- Reset polarity, clock assumptions, and key parameters are documented.
- Vivado project archives do not include private paths, credentials, customer files, or unrelated experiments.
- Large binary archives are kept only when they help users reproduce the demo.
- Version history is updated in `README.md`.
- A GitHub release is created for user-facing zip archives when the release is intended to be stable.
