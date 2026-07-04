# Agent instructions (ORW500.NET / zensoria)

**Repository:** [github.com/simkne/zensoria](https://github.com/simkne/zensoria)

This repo is the **home-stack knowledge base**: **OpenHABian on Raspberry Pi 4** (SiK hub), **MQTT**, **ESP32 nodes** (ZENSORIA), and curated **web documentation**. Active firmware builds live in PlatformIO; this repo holds reference config, howtos, and agent instructions.

## Defaults the user cares about

- Prefer **clear structure**, **maintainable** solutions, and short explanations when non-obvious.
- Slightly **educational** or richer setups are OK on the Pi (8 GB); avoid unmaintainable one-offs.
- **Secrets** do not belong in tracked source; never suggest committing API keys, Wi-Fi passwords, or broker credentials.

For general coding behavior (scope, fragile areas, secrets), follow [`agentix/coding-agent.md`](coding-agent.md).

## Agent instructions (where they live)

- **All agent instructions for this repo** live under `agentix/` — router, environment context, reusable coding rules.
- **Exception:** [`web_documentation/agent.md`](../web_documentation/agent.md) — blog documentation agent only.
- Do **not** create `AGENTS.md` or `agent.md` in subproject folders (openHAB_SiK, ZENSORIA, PlatformIO projects, etc.). Put new agent guidance in `agentix/` instead.
- Domain folders hold **knowledge** (howtos, config, notes), not agent instruction files.

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
| PlatformIO active builds | `/Users/simon/Documents/PlatformIO` (code only; agent rules stay in `agentix/`) |
| Website / blog documentation agent | `web_documentation/agent.md` |
| Blog handoff files (input for web agent) | `web_documentation/handovers/` |
| Website-oriented reference material | `web_documentation/` |
| Bash / git command snippets | `scripts/bash-commands.sh` |

## Knowledge and blog documentation workflow

**While working on a subproject** (openHAB_SiK, ZENSORIA, etc.):

- Keep knowledge in the folder it belongs to — howtos, config snapshots, device notes, MQTT contracts.
- Do not move domain knowledge into `web_documentation/` unless the user asks for blog output.

**When the user asks for blog documentation:**

1. Create a handoff file in `web_documentation/handovers/` (e.g. `YYYY-MM-DD-topic.md`).
2. Summarize what was done, link to repo paths for detail, note pitfalls and results.
3. The [`web_documentation/agent.md`](../web_documentation/agent.md) agent (expanded later) will use that handoff to write the blog draft.

## Local resources (not in git)

Vendor firmware, downloaded examples, zips, and large binaries live under **`resources/`** at repo root. This folder is **gitignored** — keep notes and howtos in `ZENSORIA/mcs/` instead. See [`resources/README.md`](../resources/README.md).

- **`git pull` does not touch `resources/`** — git only updates tracked files; ignored local folders stay as they are.
- **Never `git add resources/`** except `resources/README.md`. Do not suggest uploading vendor blobs to GitHub.
- Avoid `git clean -fd` in the repo root — it can delete untracked local files (including under `resources/`).

## When editing firmware

Active firmware builds live under:

`/Users/simon/Documents/PlatformIO`

PlatformIO projects hold **code only**. After substantive knowledge changes, update the relevant howto or notes under `ZENSORIA/` (and `agentix/` if agent behavior or scope changes).
