# Figma Node & Component Registry Rules

## Privacy & Package Distribution
1. **Never place internal Figma URLs or Node IDs inside public markdown documentation files** (e.g. `lib/components/*.md` or `lib/README.md`).
2. All Figma workspace links, file keys, and component Node IDs must reside exclusively in [`docs/figma_registry.json`](file:///c:/Vayu/Alter/docs/figma_registry.json).
3. The `docs/` directory is internal and must remain ignored by `.pubignore` and `.gitignore` to prevent leaking internal Figma URLs to package consumers on `pub.dev`.
4. Component `.md` files under `lib/components/` must only host public documentation: description, usage examples, property tables, Widgetbook preview links, design specifications (padding, tokens), and reverse-chronological changelogs.
