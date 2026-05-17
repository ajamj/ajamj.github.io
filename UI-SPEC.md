# UI Design Specification: Dark Theme & Mobile-First Fluid Optimization (Phase 15) - REVISED

## 1. Overview
- **Goal**: Transition to a high-performance Dark Theme (Obsidian-Seismic) and implement fluid, accessible, and responsive layouts.
- **Aesthetic**: Obsidian-Seismic (Dark Theme), Editorial Typography, Minimalist.
- **Framework**: Astro (Vanilla CSS).

## 2. Design Tokens
### 2.1 Colors & Accessibility
- **Background**: `#0a0f0d` (Obsidian Deep)
- **Surface/Card**: `rgba(20, 26, 23, 0.6)` with `backdrop-filter: blur(12px)`
- **Accent**: `#3b82f6` (Seismic Blue) - Ensure 4.5:1 contrast against Background/Surface.
- **Text Primary**: `#f0f5f2` (Main body and headings)
- **Text Muted**: `#a0ada5` (Labels and secondary text)

### 2.2 Typography (Fluid)
- **Heading 1 (Hero)**: `clamp(2rem, 8vw, 3.5rem)`
- **Heading 2 (Section)**: `clamp(1.5rem, 5vw, 2.25rem)`
- **Body Text**: `clamp(1rem, 1.2vw, 1.125rem)` (Min 16px).

## 3. Component Specifications & ARIA
### 3.1 Hero Section
- **Visual**: Center profile picture on screens < 768px.
- **Profile Image**: Use Astro `<Image />` component. `width: 110px` (Mobile) → `width: 140px` (Desktop).
- **ARIA**: Hero section must use `<section aria-labelledby="hero-title">`.

### 3.2 Blog & Project Grids
- **Behavior**: `grid-template-columns: repeat(auto-fill, minmax(min(100%, 320px), 1fr))`.
- **ARIA**: Use `<article>` within a container with `role="list"`.

### 3.3 Experience Timeline (Accessible Mode)
- **Mobile Layout (< 640px)**: Left-rail mode.
- **Accessibility**: 
  - Main container: `role="list"`.
  - Each item: `role="listitem"`.
  - Date markers: `aria-hidden="true"` if purely decorative, otherwise properly labeled.

### 3.4 Navigation (Header)
- **Touch Targets**: Min 44x44px.
- **Mobile Menu**: 
  - Sliding drawer with `role="dialog"` and `aria-modal="true"`.
  - Trigger button: `aria-expanded` and `aria-controls`.
  - Focus trapping required when open.

## 4. Interaction & Security
### 4.1 Contact Form
- **Validation**: 
  - Client-side: Required fields and email format.
  - Server-side: Input sanitization and character length limits.
- **Anti-Spam**: Implement a hidden "honeypot" field (CSS hidden).
- **Security**: Links must use `rel="noopener noreferrer"`.

### 4.2 Security Policies
- **Metadata**: Strip EXIF/location data from all uploaded images.
- **Security Headers**: Define basic Content Security Policy (CSP) allowing local assets and required CDNs.

## 5. Validation & TDD Assertions
### 5.1 Responsive Assertions (Manual/Automated)
- [ ] At 375px: Navbar collapses into hamburger; Hero image is centered; Blog cards are full width.
- [ ] At 480px: CTA buttons in Hero section stack vertically.
- [ ] At 1024px+: Timeline returns to dual-sided or center-aligned mode.

### 5.2 Performance Targets
- **Lighthouse**: Target 95+ (Performance, Accessibility, SEO).
- **Verification**: Run `npm run build` followed by local Lighthouse audit before every push.

## 6. Decision Log
- **Honeypot**: Chosen as a low-friction anti-spam measure for a static site.
- **Left-rail Timeline**: Chosen for mobile to maximize text column width and readability.
- **Astro <Image />**: Mandated for automated WebP conversion and metadata stripping.
