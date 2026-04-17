---
title: "Improve mobile responsiveness across all devices"
status: "pending"
priority: "high"
area: "design"
created: "2026-04-17"
---

## Description
The user reported that the website is not yet responsive and does not adjust its display correctly based on the device's screen size.

## Implementation Details
- **Audit Components**: Review all major components for responsive issues:
  - `Header.astro` (mobile menu behavior)
  - `Hero.astro` (text sizing and background scaling)
  - `ProjectGallery.astro` (grid layout on small screens)
  - `InteractiveSeismogram.astro` (D3.js SVG sizing)
  - `ContactForm.astro` (form field widths)
  - `Layout.astro` (HUD elements positioning)
- **CSS Media Queries**: Ensure robust `@media` queries are used in `global.css` and individual components.
- **Viewport Meta**: Verify the `<meta name="viewport" ...>` tag in `Layout.astro`.
- **Flexible Units**: Use relative units like `rem`, `em`, `%`, `vw`, and `vh` instead of fixed pixel values where appropriate.
- **Testing**: Test on various simulated device sizes (Mobile, Tablet, Desktop) using browser dev tools.

## Constraints
- Maintain the "Digital Lithosphere" / "HUD" aesthetic on all screen sizes.
- Ensure interactive elements (like the seismogram) remain usable on touch screens.
