# C_DUINO_A7 FPGA 데모

[![Verilog Simulation](https://github.com/maduinos/c_duino_a7/actions/workflows/verilog-sim.yml/badge.svg)](https://github.com/maduinos/c_duino_a7/actions/workflows/verilog-sim.yml)

C_DUINO_A7 보드를 위한 FPGA 데모 소스입니다. Maduinos의 FPGA 교육, 보드 bring-up, 소규모 하드웨어 프로토타이핑 참고 자료로 공개합니다.

## 프로젝트 상태

- 상태: 공개 데모/참고 저장소
- 주요 대상: FPGA 학습자, Maduinos FPGA 작업을 검토하는 고객, C_DUINO_A7 사용자
- HDL 범위: LED, 스위치, 부저, hobby servo를 위한 간단한 peripheral 예제
- 도구 기준: Vivado 2023.2.2, Vitis Classic 2023.2.2

이 저장소는 문서와 학습용 예제 중심으로 관리합니다. HDL 예제는 의도적으로 작게 유지합니다. 원본 프로젝트 압축 파일과 보드 참고 이미지는 `c_duino_a7_demo.zip`, `c_duino_a7_scm.jpg`를 확인하세요.

## 저장소 구성

| 경로 | 용도 |
| --- | --- |
| `led_ctrl/` | register 기반 LED 출력 예제 |
| `led_sw_ctrl/` | 스위치 입력을 LED로 표시하는 예제 |
| `buzzer/` | clock divider 방식의 부저 출력 예제 |
| `servo_ctrl/` | 50 Hz PWM hobby servo 신호 예제 |
| `docs/overview.md` | 모듈별 설명과 사용 목적 |
| `docs/simulation.md` | 간단한 시뮬레이션 안내 |
| `docs/bring-up-guide.md` | 보드 bring-up 순서와 안전 점검 |
| `docs/adaptation-guide.md` | 예제를 더 큰 프로젝트로 확장할 때의 참고 사항 |
| `docs/release-checklist.md` | 공개 릴리스 점검표 |
| `.github/workflows/verilog-sim.yml` | GitHub Actions 시뮬레이션 검사 |
| `c_duino_a7_demo.zip` | 원본 데모 archive |
| `c_duino_a7_scm.jpg` | 보드 회로/참고 이미지 |

## 빠른 시작

1. Vivado 2023.2.2 또는 호환 가능한 Vivado 버전을 설치합니다.
2. `led_ctrl/`, `led_sw_ctrl/`, `buzzer/`, `servo_ctrl/` 중 사용할 모듈을 확인합니다.
3. 선택한 HDL 소스와 testbench를 Vivado 프로젝트에 추가합니다.
4. 핀 할당이나 hardware programming 전에 behavioral simulation을 실행합니다.
5. clock frequency, reset polarity 같은 전제 조건은 `docs/overview.md`에서 확인합니다.

## 설계 메모

- reset은 active-low이며 이름은 `resetn`입니다.
- 예제는 production IP packaging이 아니라 가독성과 보드 bring-up을 우선합니다.
- `servo_ctrl`의 현재 duty constant는 27 MHz 입력 clock을 가정합니다.
- testbench는 기본 sanity check이며, 제품 적용 전에는 확장 검증이 필요합니다.

## 비즈니스 맥락

Maduinos는 이 저장소를 FPGA 교육과 컨설팅 대화에서 참고할 수 있는 공개 예제 모음으로 사용합니다. 상용 프로젝트별 세부 자료는 공개 저장소에 포함하지 않고, 보드 예제는 읽고 시뮬레이션하고 응용하기 쉽게 유지합니다.

## 관련 링크

- 블로그: <https://maduinos.blogspot.com/>
- 비즈니스 페이지: <https://biz.maduinos.com/>

## 프로젝트 관리

- 변경 이력: `CHANGELOG.md`
- 릴리스 절차: `RELEASE.md`
- 지원 범위: `SUPPORT.md`
- 기여 가이드: `CONTRIBUTING.md`
- 보안 신고: `SECURITY.md`

## 버전 이력

| 버전 | 작성자 | 날짜 | 변경 사항 |
| --- | --- | --- | --- |
| 0.03 | Codex | 2026-05-30 | 공개 문서, 저장소 정리, 릴리스 안내 개선 |
| 0.02 | Codex | 2026-02-13 | TB module 이름/폭/reset 처리 수정, LED-SW mapping 개선 |
| 0.01 | Maduinos | 2024-03-01 | C_DUINO_A7 EXT. 데모 최초 공개 |

## 라이선스

Apache License, Version 2.0으로 배포합니다. 자세한 내용은 `LICENSE`를 확인하세요.
