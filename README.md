### VERSION
- Vivado 2023.2.2
- Vitis Classic 2023.2.2

### MODIFICATION HISTORY

| Ver  | Who     | Date     | Changes                                      |
|------|---------|----------|----------------------------------------------|
| 0.01 | MADUINOS| 2024/03/01| C_DUINO_A7 EXT. DEMO Initial release        |
| 0.02 | Codex   | 2026/02/13| Fix TB module names/widths and reset handling; improve LED-SW mapping      |
| 0.03 | Codex   | 2026/02/13| Add one-command remote setup/push script and push guide                     |
|      |         |          |                                              |

### PUSH GUIDE
- 원격이 없는 상태에서 한 번에 push하려면 아래 스크립트를 사용하세요.
- `./push_to_remote.sh <remote-url> [branch]`
- 예: `./push_to_remote.sh git@github.com:USER/REPO.git work`

