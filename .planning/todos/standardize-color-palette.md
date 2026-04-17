---
title: "Standardize consistent design color palette"
status: "pending"
priority: "medium"
area: "design"
created: "2026-04-17"
---

## Description
The user wants to ensure the website uses a consistent design color palette instead of a mix of different colors.

## Implementation Details
- **Define Primary Palette**: Formally define the core colors for the "Digital Lithosphere" / "HUD" theme:
  - Background (dark/deep navy/earthy black)
  - Surface (layered transparency, glass effect)
  - Accent (teal, amber, or seismic-inspired colors)
  - Text (high-contrast for readability, muted for secondary info)
- **CSS Variables**: Consolidate all colors into CSS variables in `src/styles/global.css`.
- **Component Audit**: Update all components (Hero, Cards, Buttons, Nav) to use these global variables instead of hardcoded hex/rgb values.
- **D3.js Alignment**: Ensure D3.js visualizations (Seismogram) use colors from the same palette.

## Constraints
- Must align with the geophysics/scientific research context.
- Ensure high contrast ratios for accessibility.
