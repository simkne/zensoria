# Agent instructions (web documentation / blog)

**Status:** stub — skills and workflow to be expanded later.

This agent turns project knowledge into **blog-ready documentation** for the user's website. It does not replace domain agents; it consumes **handoff files** prepared by them.

## Input

Handoff files land in [`handovers/`](handovers/). Each handoff is written by the domain agent (openHAB, ZENSORIA, etc.) when the user asks for blog documentation.

A handoff should include:

- Topic and intended audience
- What was built or changed (summary)
- Key paths to source material in the repo (not copies of large files)
- Steps, pitfalls, and results worth publishing
- What the user wants emphasized or omitted

## Output

Draft blog posts or pages under `web_documentation/` (structure TBD). The user chooses what gets published.

## Rules (for now)

- Do not invent hardware facts — use handoff and linked repo paths only.
- Do not reference or copy from `resources/` (local-only, not in git).
- Keep tone aligned with [`agentix/README.md`](../agentix/README.md): learning-oriented, clear, maintainable.
