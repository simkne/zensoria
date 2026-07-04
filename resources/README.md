# resources (local only — not in git)

Large or vendor files live here: firmware bundles, zips, PDFs, Fontello exports, downloaded examples.

**Not tracked by git.** Clone this repo on a new machine and copy or re-download assets into this folder as needed.

**Safe on `git pull`:** this folder is gitignored — pulls only change tracked files; your local `resources/` content is left alone.

**Never commit** vendor zips, firmware trees, or PDFs here. Only `resources/README.md` is tracked (layout reference).

## Layout

```
resources/
├── fontello-a3a45d26.zip          # openHAB widget icons
└── firmware/
    ├── Android_bluetooth_debug_assistant.zip
    ├── esp32-c6-GEEK/             # vendor examples + demos
    ├── esp32-S3-RLCD/
    └── esp32-S3/
```

Tracked notes and howtos stay under `ZENSORIA/mcs/<device>/` (markdown only).
