# zensoria

Personal home-automation knowledge base: **OpenHAB** on a Raspberry Pi hub, **MQTT**, and custom **ESP32** sensor nodes. This repo holds configuration references, documentation, and AI agent instructions — not the live firmware build tree.

A passion-project setup focused on learning, maintainable structure, and practical automation at home.

## Stack

| Layer | Technology |
| --- | --- |
| Hub | Raspberry Pi 4 (8 GB), OpenHABian, OpenHAB 5.x |
| Messaging | MQTT |
| Custom devices | ESP32-S3, ESP32-C6 (ESP-IDF / Arduino / PlatformIO) |
| Ecosystem | Shelly, Tasmota, and other integrated devices |

Active firmware is developed in [PlatformIO](https://platformio.org/) projects under `~/Documents/PlatformIO`. This repository is the companion knowledge base.

## Repository layout

```
zensoria/
├── agentix/              AI instructions and reusable coding rules
├── openHAB_SiK/          OpenHAB config reference (Items, Rules, Scripts, Widgets, Things)
├── ZENSORIA/             ESP development: MQTT contracts, device notes, howtos
├── web_documentation/    Curated reference material for the project website
├── resources/            Local-only assets (firmware zips, PDFs — not in git)
└── scripts/              Bash / git command snippets
```

### `agentix/`

Entry point for AI-assisted work on this project.

- [`agentix/agent.md`](agentix/agent.md) — project router and path index
- [`agentix/README.md`](agentix/README.md) — environment context (hardware, tone)
- [`agentix/coding-agent.md`](agentix/coding-agent.md) — reusable coding rules for any project

### `openHAB_SiK/`

Reference snapshots of OpenHAB configuration for the SiK installation: Items, Rules, Scripts, Widgets, and Things under `openHAB_dev/`, plus howtos under `openHAB_dev/docs/howto/`.

### `ZENSORIA/`

ESP microcontroller development and integration.

- `common/` — MQTT topic conventions and shared headers
- `mcs/<device>/` — per-board notes (markdown, tracked in git)
- `docs/howto/` — firmware handovers and procedures
- `sensors/` — sensor-specific documentation

Supported boards include **ESP32-C6-GEEK** and **ESP32-S3-RLCD** (Waveshare).

### `web_documentation/`

Reference content curated for publication on the project website (microcontrollers, openHAB, sensors).

### `resources/` (local only)

Vendor firmware, downloaded examples, zips, and large binaries. **Not tracked by git** — see [`resources/README.md`](resources/README.md) for the expected layout after clone.

## Getting started

1. Clone this repository.
2. Create the local `resources/` folder and add vendor assets as described in [`resources/README.md`](resources/README.md).
3. Open firmware projects in PlatformIO under `~/Documents/PlatformIO`.
4. For AI-assisted editing, start from [`agentix/agent.md`](agentix/agent.md).

## License

Private passion project. No license specified yet.
