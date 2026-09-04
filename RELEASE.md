> 만든 사람: maduinos<br>
> 문서 만든 날짜: 2026-05-30<br>
> https://maduinos.blogspot.com/

# Release Process

Use this process when publishing a stable C_DUINO_A7 public demo update.

## Before Release

1. Check `docs/release-checklist.md`.
2. Update `CHANGELOG.md`.
3. Confirm README links, tool versions, clock assumptions, and reset assumptions are accurate.
4. Confirm generated Vivado/Vitis files are not committed.

## Suggested Tag Format

Use semantic-ish tags for public demo releases:

```bash
git tag v0.4.0
git push origin v0.4.0
```

## GitHub Release Notes

Include:

- What changed.
- Which modules are affected.
- Tool versions used.
- Known limitations.
- Whether `c_duino_a7_demo.zip` changed.
