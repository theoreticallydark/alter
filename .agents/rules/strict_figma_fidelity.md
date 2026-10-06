# Strict Figma & Design System Development Rules

## 1. Zero Assumptions & No Hallucinated Inspections
* NEVER claim to have inspected, validated, or verified a live Figma link or node unless you actually have an active Figma tool/MCP capability that successfully fetched and parsed that live node payload.
* If a Figma URL or Node ID is shared and no Figma tool/MCP is available to inspect it, **immediately state that you cannot access Figma directly** and request the exact node properties, variant schema, or JSON export from the user.
* NEVER assume, hallucinate, guess, or use personal opinion on component variants, paddings, colors, borders, sizes, or hierarchy.

## 2. 100% Strict Figma Fidelity
* This is a production UI design system that must stay in 100% exact parity with Figma.
* Do not invent variants or omit variants based on partial repository snapshots.
* If any detail is missing, ambiguous, or unverifiable, STOP and request the exact specifications from the user before writing or modifying any code.

## 3. Node Inspection & Diff Reporting Protocol
Whenever inspecting a Figma component node, always adhere to this systematic process before reporting or coding:
1. **Full Variant Property Extraction First**: Extract and list every component property axis (`propertyDefinitions`, sizes, types, states, boolean flags, slots) from the Figma payload and diff directly against the Flutter widget parameters.
2. **Comprehensive State Inspection**: Individually inspect and report all interactive states (`Default`, `Hover`, `Pressed`/`Active`, `Selected`, `Disabled`). Never lump `Hover` and `Selected` together into a generic active state.
3. **State-by-State Token Transitions**: For every variant type and size, explicitly verify and document fill, stroke, and foreground token changes across each state (e.g., default surface fills vs. active/hover surface fills).
4. **Structured Delta Reporting**: Report all findings in a clear, structured summary covering:
   - Newly added or modified properties/variants.
   - Exact padding and geometry updates.
   - Precise token/color transitions across all states.

## 4. Nested Component & Child Node Discovery
* Before developing or refactoring any compound component, inspect whether any child node is an independent Figma component (`COMPONENT` or `INSTANCE`).
* If the child exists in the codebase, reuse it directly.
* If the child is a component in Figma but does NOT exist in the codebase, STOP and inform the user to build the child component first. Do not build or inline it without explicit user approval.

## 5. Strict Anti-Drift Token Binding
* Raw hardcoded colors (e.g., `Color(0xFF...)`) or ad-hoc dimension hacks are strictly forbidden in component files.
* All component styles, fills, borders, and typography must bind directly to `AlterSemanticTokens` (or registered swatches in `AlterColors`).
* If Figma references a token, color variable, or font style that does not yet exist in the project, request user permission to add the token variables to `tokens.dart`/`swatches.dart` before developing the component.

