---
title: "Fix blog content visibility issue"
status: "pending"
priority: "high"
area: "blog"
created: "2026-04-17"
---

## Description
The user reported that blog post text is not visible, even though the posts exist and the system is rendering them.

## Potential Root Causes
- **Scroll Reveal**: The `scroll-reveal` class sets `opacity: 0` by default. If the Intersection Observer in `Layout.astro` or `index.astro` doesn't target the blog content correctly, the text remains hidden.
- **Intersection Observer**: The observer script might be in `index.astro` but not in `Layout.astro`, or it might need to be more global.
- **Glass Card Styles**: Dark text on a dark background within the `glass-card`.
- **Astro Page Load**: Transition issues if using `astro:page-load` incorrectly with the observer.

## Implementation Details
- Check `src/pages/blog/[...slug].astro` and `src/layouts/Layout.astro`.
- Ensure the `IntersectionObserver` is active on all pages or handled in the base Layout.
- Verify CSS colors for `.post-content`.

## Constraints
- Must maintain the "HUD" / "Digital Lithosphere" aesthetic.
