# Phase 15: Dark Theme & Mobile-First Fluid Optimization Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Transition the portfolio to a high-performance Dark Theme (Obsidian-Emerald) and implement fluid, accessible, and responsive layouts.

**Architecture:** Centralized CSS variables for theme and fluid scaling using `clamp()`, Astro `<Image />` for asset optimization, and ARIA-compliant components.

**Tech Stack:** Astro (v5.x), Vanilla CSS.

---

### Task 1: Setup & Design Tokens

**Files:**
- Modify: `src/styles/global.css`

**Step 1: Update CSS Variables for Dark Theme and Fluid Scaling**

```css
:root {
  /* Dark palette - Obsidian-Emerald */
  --color-bg: #0a0f0d;
  --color-surface: rgba(20, 26, 23, 0.6);
  --color-surface-alt: #121814;
  --color-border: rgba(255, 255, 255, 0.1);
  --color-border-light: rgba(255, 255, 255, 0.05);

  --color-text: #f0f5f2;
  --color-text-muted: #a0ada5;
  --color-text-light: #6b7280;

  --color-accent: #10b981;
  --color-accent-light: #34d399;
  --color-accent-subtle: rgba(16, 185, 129, 0.1);
  --color-accent-glow: rgba(16, 185, 129, 0.3);

  /* Fluid Typography */
  --font-size-h1: clamp(2rem, 8vw, 3.5rem);
  --font-size-h2: clamp(1.5rem, 5vw, 2.25rem);
  --font-size-body: clamp(1rem, 1.2vw, 1.125rem);

  /* Fluid Spacing */
  --space-container-padding: clamp(1rem, 5vw, 2rem);
  --space-section-padding: clamp(2.5rem, 10vh, 6rem);
}
```

**Step 2: Apply Fluid Tokens to Global Base Styles**

Update `h1`, `h2`, and `section` padding to use the new fluid variables.

**Step 3: Commit**

```bash
git add src/styles/global.css
git commit -m "style(tokens): implement dark theme and fluid scaling tokens"
```

---

### Task 2: Layout & Header Refactor

**Files:**
- Modify: `src/layouts/Layout.astro`
- Modify: `src/components/Header.astro`

**Step 1: Update Layout.astro for Dark Theme Background**

Ensure the body background and default text colors are correct. Add basic CSP meta tag.

**Step 2: Refactor Header for Dark Theme and Accessible Mobile Menu**

- Update background to `rgba(10, 15, 13, 0.9)` with blur.
- Implement ARIA roles for the mobile menu (dialog, modal, expanded).
- Ensure 44x44px touch targets.

**Step 3: Commit**

```bash
git add src/layouts/Layout.astro src/components/Header.astro
git commit -m "feat(ui): update layout and header for dark theme and accessibility"
```

---

### Task 3: Hero Component Refactor

**Files:**
- Modify: `src/components/Hero.astro`

**Step 1: Implement Astro <Image /> for Profile Picture**

Replace raw `<img>` with Astro's `<Image />` component for automated optimization and metadata stripping.

**Step 2: Apply Fluid Styles and Centering**

- Center profile picture and text on screens < 768px.
- Use `width: clamp(110px, 15vw, 140px)` for the profile picture.
- Stack buttons vertically on screens < 480px.

**Step 3: Commit**

```bash
git add src/components/Hero.astro
git commit -m "feat(ui): refactor hero with fluid scaling and optimized image"
```

---

### Task 4: Blog & Project Grids Refactor

**Files:**
- Modify: `src/components/BlogPreview.astro`
- Modify: `src/components/ProjectGallery.astro`

**Step 1: Update Grids for Fluid Behavior**

Use `grid-template-columns: repeat(auto-fill, minmax(min(100%, 320px), 1fr))` for both grids.

**Step 2: Refactor Blog Card Styles**

- Apply Dark Theme colors and glassmorphism.
- Use fluid padding for cards.

**Step 3: Commit**

```bash
git add src/components/BlogPreview.astro src/components/ProjectGallery.astro
git commit -m "feat(ui): implement fluid grids for blog and projects"
```

---

### Task 5: Experience Timeline Refactor

**Files:**
- Modify: `src/components/CareerTimeline.astro`

**Step 1: Implement Left-rail Mode for Mobile (< 640px)**

- Remove center line.
- Place line on the far left.
- Ensure all content flows to the right.

**Step 2: Add ARIA Roles**

Add `role="list"` and `role="listitem"` to the timeline container and items.

**Step 3: Commit**

```bash
git add src/components/CareerTimeline.astro
git commit -m "feat(ui): refactor timeline for mobile accessibility"
```

---

### Task 6: Contact Form Security & Design

**Files:**
- Modify: `src/components/ContactForm.astro`

**Step 1: Implement Honeypot Field**

Add a CSS-hidden input field to catch bots.

**Step 2: Add Validation and Dark Theme Styles**

- Implement client-side validation (required, email).
- Apply Dark Theme styles to inputs and labels.

**Step 3: Commit**

```bash
git add src/components/ContactForm.astro
git commit -m "feat(security): add honeypot and dark theme styles to contact form"
```

---

### Task 7: Final Polish & Verification

**Step 1: Run Build**

```bash
npm run build
```

**Step 2: Manual Responsive Check**

- Verify breakpoints: 375px, 480px, 768px, 1024px.
- Check touch targets and mobile menu focus.

**Step 3: Verify Dark Theme Contrast**

Ensure Emerald accent vs Background meets 4.5:1 ratio.

**Step 4: Commit**

```bash
git commit --allow-empty -m "chore(release): complete phase 15 dark theme & mobile optimization"
```
