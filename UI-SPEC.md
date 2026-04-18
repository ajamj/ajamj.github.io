# UI Design Contract — ajamj.github.io

**Version:** 1.0  
**Date:** 2026-04-18  
**Status:** ACTIVE  
**Phase:** UI Accessibility Fixes  

---

## Design System

### Pattern
- **Theme:** Digital Lithosphere (Dark Academic)
- **Style:** Glassmorphism / Technical HUD / Minimalist
- **Primary Color:** `#10b981` (Emerald accent)
- **Background:** `#0b1326` (Deep navy)
- **Typography:** Space Grotesk (headings), Inter (body)

### Visual Language
- Grid-pattern background with subtle scanlines
- HUD-style corner brackets
- Glass cards with backdrop blur
- Tonal section alternating
- Pulsing timeline animations

---

## Components

### 1. Hamburger Menu Button

| Attribute | Value |
|----------|-------|
| **Location** | `src/components/Header.astro:99-107` |
| **Current** | Emoji `☰` (font-dependent) |
| **To** | SVG icon (Lucide/Heroicons) |
| **Touch Target** | Minimum 44×44pt |

**Specification:**
- Replace emoji with inline SVG icon
- Expand touch area to 44×44pt minimum
- Keep existing aria-label
- Maintain current color/animation

### 2. Animations (Reduced Motion)

| Attribute | Value |
|----------|-------|
| **Location** | `src/styles/global.css:36-47`, `src/pages/index.astro:78-95` |
| **Current** | Unconditional fade-in, scroll-reveal |
| **To** | Respect `prefers-reduced-motion` |

**Specification:**
- CSS: Add `@media (prefers-reduced-motion: reduce)` with instant opacity/transform
- JS: Check `window.matchMedia('(prefers-reduced-motion: reduce)').matches` before running IntersectionObserver
- Keep semantic animation for users who prefer motion

### 3. Form Error States

| Attribute | Value |
|----------|-------|
| **Location** | `src/components/ContactForm.astro` |
| **Current** | No error handling |
| **To** | Inline validation + error display |

**Specification:**
- Add error state styling (red border, helper text)
- Focus management: auto-focus first invalid field
- Error message near field (not just at top)
- Include recovery path in error messages

### 4. Text Contrast Verification

| Attribute | Value |
|----------|-------|
| **Location** | `src/layouts/Layout.astro:77` |
| **Current** | `#bbcabf` on `#0b1326` (estimated 4.2:1) |
| **To** | Verify ≥4.5:1 or adjust |

**Specification:**
- Test `--color-text-muted` at 12px against background
- If <4.5:1, darken to meet AA compliance
- Document actual contrast ratios

### 5. Navigation Keyboard States

| Attribute | Value |
|----------|-------|
| **Location** | `src/components/Header.astro:87-97` |
| **Current** | Hover + focus-visible mix |
| **To** | Distinct keyboard indication |

**Specification:**
- Ensure `:focus-visible` is visually distinct from hover
- Add focus ring animation if missing

---

## Responsive Breakpoints

| Breakpoint | Width | Status |
|-----------|------|--------|
| Mobile | <768px | Hamburger nav, smaller sections |
| Tablet | 768-1023px | Adjusted spacing, grid shift |
| Desktop | ≥1024px | Full horizontal nav |

---

## Animation Tokens

| Token | Value | Usage |
|-------|-------|-------|
| `duration-micro` | 150ms | Button hover, toggle |
| `duration-normal` | 300ms | Card hover, section fade |
| `duration-slow` | 500ms | Page transitions |
| `ease-out` | `cubic-bezier(.4, 0, .2, 1)` | Standard easing |

---

## Acceptance Criteria

### Must Pass (Gate: Pre-Merge)

- [ ] No emoji as structural icon (use SVG)
- [ ] Reduced motion honored in CSS + JS
- [ ] Touch target ≥44×44pt on hamburger
- [ ] Contrast verified ≥4.5:1 for all text
- [ ] Skip link functional
- [ ] Focus trap working

### Visual Checkpoints

- [ ] Grid background renders on dark
- [ ] HUD corners visible at all sizes
- [ ] Glass cards have blur effect
- [ ] Typography pairing correct (Space Grotesk + Inter)
- [ ] Animations smooth 60fps

---

## Anti-Patterns Avoided

| Anti-Pattern | Status |
|------------|--------|
| Emoji as icon | **TO FIX** |
| No reduced-motion | **TO FIX** |
| Small touch targets | **TO FIX** |
| Unverified contrast | **TO FIX** |
| Hover-only interactions | **TO FIX** |

---

## Implementation Notes

1. **Hamburger SVG**: Use inline SVG, not external icon library (keep zero-dep)
2. **Reduced motion**: Test with `DevTools > Accessibility > Reduced motion`
3. **Form errors**: Optional for v1, can ship as incremental fix
4. **Contrast**: Use WebAIM contrast checker to verify

---

## Files Touched

| File | Change |
|------|--------|
| `src/components/Header.astro` | SVG icon + touch target |
| `src/styles/global.css` | Reduced motion CSS |
| `src/pages/index.astro` | Reduced motion JS |
| `src/layouts/Layout.astro` | Contrast check |
| `src/components/ContactForm.astro` | Error states (optional) |