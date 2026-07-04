# Agent instructions (ORW500.NET / zensoria)

**Repository:** [github.com/simkne/zensoria](https://github.com/simkne/zensoria)

This repo is the **home-stack knowledge base**: **OpenHABian on Raspberry Pi 4** (SiK hub), **MQTT**, **ESP32 nodes** (ZENSORIA), and curated **web documentation**. Active firmware builds live in PlatformIO; this repo holds reference config, howtos, and agent instructions.

## Defaults the user cares about

- Prefer **clear structure**, **maintainable** solutions, and short explanations when non-obvious.
- Slightly **educational** or richer setups are OK on the Pi (8 GB); avoid unmaintainable one-offs.
- **Secrets** do not belong in tracked source; never suggest committing API keys, Wi-Fi passwords, or broker credentials.

For general coding behavior (scope, fragile areas, secrets), follow [`agentix/coding-agent.md`](coding-agent.md).

## Where to look first

| Topic | Path |
| --- | --- |
| Environment + tone | `agentix/README.md` |
| Reusable coding rules (all projects) | `agentix/coding-agent.md` |
| openHAB Items, Rules, Scripts, Widgets, Things | `openHAB_SiK/openHAB_dev/{items,rules,scripts,widgets,things}/` |
| openHAB-specific howtos | `openHAB_SiK/openHAB_dev/docs/howto/` |
| Local resources (firmware, zips, PDFs — **not in git**) | `resources/` |
| MQTT contracts + shared headers | `ZENSORIA/common/` |
| Microcontroller notes (markdown, tracked) | `ZENSORIA/mcs/<device>/` |
| ESP howtos / handovers | `ZENSORIA/docs/howto/` |
| ESP sensors | `ZENSORIA/sensors/` |
| PlatformIO active builds | `/Users/simon/Documents/PlatformIO` (per-project `AGENTS.md` inside each project) |
| Website-oriented reference material | `web_documentation/` |
| Bash / git command snippets | `scripts/bash-commands.sh` |

## Local resources (not in git)

Vendor firmware, downloaded examples, zips, and large binaries live under **`resources/`** at repo root. This folder is **gitignored** — keep notes and howtos in `ZENSORIA/mcs/` instead. See [`resources/README.md`](../resources/README.md).

## When editing firmware

Active firmware builds live under:

`/Users/simon/Documents/PlatformIO`

Each project may have its own `AGENTS.md`. After substantive knowledge changes in ZENSORIA, update the relevant howto or handover here so the two stay aligned.
