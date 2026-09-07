# Strict Figma & Design System Development Rules

## 1. Zero Assumptions & No Hallucinated Inspections
* NEVER claim to have inspected, validated, or verified a live Figma link or node unless you actually have an active Figma tool/MCP capability that successfully fetched and parsed that live node payload.
* If a Figma URL or Node ID is shared and no Figma tool/MCP is available to inspect it, **immediately state that you cannot access Figma directly** and request the exact node properties, variant schema, or JSON export from the user.
* NEVER assume, hallucinate, guess, or use personal opinion on component variants, paddings, colors, borders, sizes, or hierarchy.

## 2. 100% Strict Figma Fidelity
* This is a production UI design system that must stay in 100% exact parity with Figma.
* Do not invent variants or omit variants based on partial repository snapshots.
* If any detail is missing, ambiguous, or unverifiable, STOP and request the exact specifications from the user before writing or modifying any code.
