# Coding agent instructions (reusable)

General rules for coding tasks in any project. Copy or reference this file from other repos as needed.

## Scope

- Change only what the user asked for; do not refactor unrelated areas.
- Prefer the smallest correct diff over a larger rewrite.

## Respect existing contracts

- Honor existing APIs, names, schemas, and conventions in the codebase.
- Read surrounding code before adding new patterns; match naming, structure, and style.

## Fragile areas

- Treat generated assets, build configs, lockfiles, and migration scripts as fragile.
- Read handover or howto docs before regenerating fonts, icons, CMake source lists, or similar.

## Secrets and local config

- Never commit credentials, API keys, Wi-Fi passwords, broker URLs with auth, or other secrets.
- Do not suggest committing `.env` files or local-only configuration.

## Explanations

- Give short explanations when a decision is non-obvious.
- Skip narration for straightforward edits.

## Tests

- Add tests only when requested or when they cover real behavior worth protecting.
- Do not add tests that only assert the obvious.
