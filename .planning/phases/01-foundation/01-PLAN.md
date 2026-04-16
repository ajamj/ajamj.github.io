---
phase: 01-foundation
plan: 01-01
type: execute
wave: 1
depends_on: []
files_modified: [index.html]
autonomous: true
requirements: [STRU-01, STRU-02, STRU-03, STRU-04]
user_setup: []

must_haves:
  truths:
    - "All four sections exist in the DOM with correct IDs"
    - "Navigation links scroll smoothly to their target sections"
    - "Page loads without errors in modern browsers"
    - "HTML is valid semantic HTML5"
  artifacts:
    - path: index.html
      provides: Root HTML file served by GitHub Pages
      min_lines: 60
      exports: [DOCTYPE html, html lang="en", head, body, nav, section#about, section#projects, section#skills, section#contact]
    - path: style.css
      provides: Main stylesheet (created in 01-02)
      exports: [linked via link#main-css]
  key_links:
    - from: nav
      to: section#about, section#projects, section#skills, section#contact
      via: href="#{id}"
      pattern: "href=\"#(about|projects|skills|contact)\""
    - from: section
      to: id attribute
      via: id="section-name"
      pattern: "id=\"(about|projects|skills|contact)\""
---

<objective>
Create the HTML skeleton for the portfolio website: a valid HTML5 document with a fixed header navigation bar and four semantic sections (About, Projects, Skills, Contact). This establishes the DOM structure that all CSS and content will build upon.
</objective>

<context>
@.planning/phases/01-foundation/01-CONTEXT.md
@.planning/REQUIREMENTS.md
</context>

<interfaces>
<!-- Per D-17: Single index.html file structure, pure HTML, semantic HTML5 -->
<!-- Per D-18: index.html + style.css (2 files only) -->
<!-- Per D-02: Smooth scroll via anchor links, fixed header per D-11 -->
<!-- Per D-12: Nav links: Home (→#about), About, Projects, Skills, Contact -->
<!-- Per D-13: Mobile hamburger menu (CSS/JS added in Plan 01-02/01-03) -->
<!-- Per D-19: Placeholder content only — real content in Phase 2 -->

From index.html (created by this plan):
```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Ajam Jamaludin | Geophysics Researcher</title>
  <link rel="stylesheet" href="style.css" id="main-css">
</head>
<body>
  <header id="site-header">
    <nav id="main-nav">
      <a href="#about">Home</a>
      <a href="#projects">Projects</a>
      <a href="#skills">Skills</a>
      <a href="#contact">Contact</a>
    </nav>
  </header>
  <main>
    <section id="about">...</section>
    <section id="projects">...</section>
    <section id="skills">...</section>
    <section id="contact">...</section>
  </main>
</body>
</html>
```
</interfaces>

<tasks>

<task type="auto">
  <name>Task 1: Create index.html with semantic HTML5 structure</name>
  <files>index.html</files>
  <read_first>index.html (new file — read confirms it does not exist)</read_first>
  <action>
    Create `index.html` in the project root (D:\Ajam\ajamj.github.io\index.html) with the following structure:

    1. DOCTYPE html, html lang="en"
    2. head: meta charset="UTF-8", meta viewport (width=device-width, initial-scale=1.0), title "Ajam Jamaludin | Geophysics Researcher", link rel="stylesheet" href="style.css"
    3. body with: fixed-position header containing nav#main-nav, main element containing four section elements
    4. Header: id="site-header", style includes position:fixed, top:0, width:100%, z-index:1000, background color added in Plan 01-03
    5. Nav links (per D-12): href="#about" (labeled "Home"), href="#projects", href="#skills", href="#contact"
    6. Main: four sections — id="about", id="projects", id="skills", id="contact" — each with an h2 heading and placeholder paragraph text
    7. Each section heading: h2 with text "About", "Projects", "Skills", "Contact" respectively
    8. Add aria-label to nav: aria-label="Main navigation"
    9. Each section: add role="region" and aria-labelledby pointing to its h2's id (e.g., aria-labelledby="heading-about")
    10. h2 ids: id="heading-about", id="heading-projects", id="heading-skills", id="heading-contact"

    DO NOT add inline styles — all styling goes in style.css (Plan 01-02).
    DO NOT add JavaScript — hamburger menu toggling added in Plan 01-03.
    DO NOT add real content — placeholder text only (e.g., "About section placeholder — content coming in Phase 2").
    DO NOT add a mobile menu button element yet — it will be added in Plan 01-03.
  </action>
  <verify>
    <automated>grep -c 'id="about"' index.html && grep -c 'id="projects"' index.html && grep -c 'id="skills"' index.html && grep -c 'id="contact"' index.html && grep -c 'href="style.css"' index.html</automated>
  </verify>
  <done>index.html exists in project root with DOCTYPE, four sections with correct IDs, navigation with four anchor links, linked to style.css, valid HTML5</done>
  <acceptance_criteria>
    - [ ] File `index.html` exists at project root
    - [ ] First line is `&lt;!DOCTYPE html&gt;`
    - [ ] html element has `lang="en"`
    - [ ] meta viewport tag present with `width=device-width, initial-scale=1.0`
    - [ ] title tag: "Ajam Jamaludin | Geophysics Researcher"
    - [ ] link tag: `href="style.css"` (stylesheet linked)
    - [ ] header#site-header present
    - [ ] nav#main-nav present with aria-label="Main navigation"
    - [ ] nav contains exactly 4 anchor tags with href="#about", href="#projects", href="#skills", href="#contact"
    - [ ] section#about with h2#heading-about and role="region"
    - [ ] section#projects with h2#heading-projects and role="region"
    - [ ] section#skills with h2#heading-skills and role="region"
    - [ ] section#contact with h2#heading-contact and role="region"
    - [ ] No inline style attributes anywhere in the file
    - [ ] No script tags present
  </acceptance_criteria>
</task>

</tasks>

<verification>
1. Open index.html in browser — page renders four blank sections
2. Click nav "Projects" — page scrolls to #projects section (requires smooth scroll CSS from Plan 01-02)
3. `grep -c 'section id=' index.html` returns 4
</verification>

<success_criteria>
- index.html is valid HTML5 (passes W3C validator — manual check)
- All four sections present with correct IDs matching nav href targets
- No inline styles or script tags in the file
- GitHub Pages will serve this file from the root URL

<output>
After completion, create `.planning/phases/01-foundation/01-01-SUMMARY.md`
</output>

---

---
phase: 01-foundation
plan: 01-02
type: execute
wave: 2
depends_on: [01-01]
files_modified: [style.css]
autonomous: true
requirements: [DESN-02, DESN-03]
user_setup: []

must_haves:
  truths:
    - "CSS layout is mobile-first — base styles apply to smallest screens"
    - "Layout adapts at 768px and 1024px breakpoints"
    - "Header is fixed and overlays content (not pushing it down)"
    - "Sections stack vertically on mobile, multi-column on desktop"
  artifacts:
    - path: style.css
      provides: Main stylesheet with responsive layout, CSS custom properties, and smooth scroll
      min_lines: 80
      exports: [CSS custom properties, media queries, flexbox/grid layout]
  key_links:
    - from: index.html link[href="style.css"]
      to: style.css
      via: link tag
      pattern: 'href="style.css"'
    - from: header
      to: viewport
      via: position:fixed
      pattern: "position:\\s*fixed"
---

<objective>
Create the responsive CSS layout foundation: mobile-first styles, CSS custom properties for the color palette, fixed header positioning, and responsive breakpoints at 768px and 1024px. This plan establishes the layout skeleton without visual styling — color and typography come in Plan 01-03.
</objective>

<context>
@index.html (created in 01-01 — MUST be read before writing CSS)
@.planning/phases/01-foundation/01-CONTEXT.md
</context>

<interfaces>
<!-- Per D-14: Mobile-first CSS approach -->
<!-- Per D-15: Breakpoints at 480px (small mobile), 768px (tablet), 1024px (desktop) -->
<!-- Per D-16: Single column on mobile, grid-based multi-column on desktop -->
<!-- Per D-17: CSS custom properties for theming (--color-bg, --color-text, --color-accent, --color-accent-secondary) -->
<!-- Per D-03: Sections fill viewport height on desktop -->
<!-- Per D-11: Fixed header, solid background on scroll (toggled via JS in Plan 01-03) -->

Color values from D-07, D-08, D-09 (use in custom properties):
- --color-bg: #FAFAFA (off-white background)
- --color-text: #1A1A2E (near-black text)
- --color-accent: #0D7377 (deep teal)
- --color-accent-secondary: #E8A838 (warm amber)

Breakpoints:
- Base: 0 to 479px (mobile small)
- @media (min-width: 480px): small mobile to tablet
- @media (min-width: 768px): tablet to desktop
- @media (min-width: 1024px): desktop wide

From style.css (created by this plan):
```css
:root {
  --color-bg: #FAFAFA;
  --color-text: #1A1A2E;
  --color-accent: #0D7377;
  --color-accent-secondary: #E8A838;
  /* Spacing scale: 1.25 modular */
  --space-xs: 0.5rem;
  --space-sm: 0.75rem;
  --space-md: 1rem;
  --space-lg: 1.5rem;
  --space-xl: 2rem;
  --space-2xl: 3rem;
  --space-3xl: 4rem;
}
body {
  margin: 0;
  background-color: var(--color-bg);
  color: var(--color-text);
}
#site-header {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  z-index: 1000;
}
/* Offset body content for fixed header */
body {
  padding-top: 60px; /* header height */
}
@media (min-width: 768px) {
  body { padding-top: 70px; }
}
@media (min-width: 1024px) {
  body { padding-top: 80px; }
}
section {
  min-height: 100vh;
  padding: var(--space-xl) var(--space-md);
}
@media (min-width: 768px) {
  section { padding: var(--space-3xl) var(--space-xl); }
}
/* Smooth scroll for anchor navigation */
html { scroll-behavior: smooth; }
```
</interfaces>

<tasks>

<task type="auto">
  <name>Task 1: Create style.css with CSS custom properties and mobile-first base layout</name>
  <files>style.css</files>
  <read_first>index.html</read_first>
  <action>
    Create `style.css` in the project root (D:\Ajam\ajamj.github.io\style.css) with the following:

    1. CSS Custom Properties (`:root` block):
       - `--color-bg: #FAFAFA`
       - `--color-text: #1A1A2E`
       - `--color-accent: #0D7377`
       - `--color-accent-secondary: #E8A838`
       - Spacing scale (1.25 modular, per D-48):
         - `--space-xs: 0.5rem`
         - `--space-sm: 0.75rem`
         - `--space-md: 1rem`
         - `--space-lg: 1.5rem`
         - `--space-xl: 2rem`
         - `--space-2xl: 3rem`
         - `--space-3xl: 4rem`

    2. Base reset and body:
       - `* { box-sizing: border-box; }`
       - `html { scroll-behavior: smooth; }`
       - `body { margin: 0; padding-top: 60px; background-color: var(--color-bg); color: var(--color-text); font-family: system-ui, -apple-system, sans-serif; }`

    3. Fixed header styles:
       - `#site-header { position: fixed; top: 0; left: 0; width: 100%; z-index: 1000; background-color: var(--color-bg); border-bottom: 1px solid #e0e0e0; }`
       - `#main-nav { display: flex; justify-content: center; gap: var(--space-lg); padding: var(--space-sm) var(--space-md); }`
       - `#main-nav a { text-decoration: none; color: var(--color-text); font-size: 0.9rem; font-weight: 500; }`

    4. Section base styles (mobile-first):
       - `section { min-height: 100vh; padding: var(--space-xl) var(--space-md); display: flex; flex-direction: column; justify-content: center; }`
       - `section h2 { font-size: 1.75rem; margin: 0 0 var(--space-md) 0; }`
       - On mobile (base): `#main-nav { flex-wrap: wrap; gap: var(--space-sm); }`

    5. Tablet breakpoint (768px):
       - `@media (min-width: 768px) { body { padding-top: 70px; } section { padding: var(--space-3xl) var(--space-xl); } section h2 { font-size: 2rem; } }`

    6. Desktop breakpoint (1024px):
       - `@media (min-width: 1024px) { body { padding-top: 80px; } #main-nav { gap: var(--space-xl); } }`

    DO NOT add font-family declarations beyond system-ui fallback — fonts added in Plan 01-03.
    DO NOT add color styling to nav links or hover states — color styling in Plan 01-03.
    DO NOT add JavaScript — all interactivity handled via CSS only for this plan.
    DO NOT hardcode color values — use CSS custom properties throughout.
  </action>
  <verify>
    <automated>grep -c '\-\-color-accent' style.css && grep -c 'position: fixed' style.css && grep -c '@media (min-width: 768px)' style.css && grep -c '@media (min-width: 1024px)' style.css</automated>
  </verify>
  <done>style.css exists with CSS custom properties, fixed header, responsive breakpoints, mobile-first base styles, smooth scroll</done>
  <acceptance_criteria>
    - [ ] File `style.css` exists at project root
    - [ ] CSS custom property `--color-accent: #0D7377` present
    - [ ] CSS custom property `--color-bg: #FAFAFA` present
    - [ ] CSS custom property `--color-text: #1A1A2E` present
    - [ ] CSS custom property `--color-accent-secondary: #E8A838` present
    - [ ] `position: fixed` applied to `#site-header`
    - [ ] `scroll-behavior: smooth` applied to `html`
    - [ ] `body { padding-top: 60px }` present (header offset)
    - [ ] `@media (min-width: 768px)` breakpoint present
    - [ ] `@media (min-width: 1024px)` breakpoint present
    - [ ] All colors reference CSS custom properties (no hardcoded hex in body/section styles)
    - [ ] No JavaScript or `&lt;script&gt;` tags in the file
  </acceptance_criteria>
</task>

</tasks>

<verification>
1. Open index.html in browser — header is fixed at top, does not scroll away
2. Resize to mobile width (< 480px) — nav links wrap to two rows, sections are full-height
3. Resize to 768px+ — padding increases per breakpoint
4. Click nav link — smooth scroll to section
5. All four sections are visible and vertically centered (desktop) or stacked (mobile)
</verification>

<success_criteria>
- Header stays fixed during scroll
- Body content not hidden behind fixed header (padding-top offset applied)
- Layout adapts at 768px and 1024px breakpoints
- Smooth scroll works on nav click
- All four sections render and are accessible via navigation

<output>
After completion, create `.planning/phases/01-foundation/01-02-SUMMARY.md`
</output>

---

---
phase: 01-foundation
plan: 01-03
type: execute
wave: 3
depends_on: [01-02]
files_modified: [style.css, index.html]
autonomous: true
requirements: [DESN-01, DESN-04, DESN-05]
user_setup: []

must_haves:
  truths:
    - "Typography uses a clean, readable font with proper hierarchy (h1 > h2 > body)"
    - "Color scheme applies deep teal accent consistently across the site"
    - "Contrast ratios meet WCAG AA minimum (4.5:1 for body text)"
    - "Visual hierarchy is clear — headings stand out from body text"
  artifacts:
    - path: style.css
      provides: Complete visual styling with typography scale, color application, hover states, base visual polish
      exports: [font loading, color application to nav/links/sections, hover states, visual spacing]
  key_links:
    - from: body text
      to: --color-text
      via: color: var(--color-text)
      pattern: "color:\\s*var\\(--color-text\\)"
    - from: nav links on hover
      to: --color-accent
      via: color: var(--color-accent)
      pattern: "#main-nav a:hover"
---

<objective>
Apply typography, color scheme, and base visual styling: load Inter font, apply the deep teal + amber color scheme to nav/links/sections, establish the modular typography scale, add hover states, and set the clean academic visual foundation. This completes the visual design of Phase 1.
</objective>

<context>
@style.css (created in 01-02 — MUST be read before modifying)
@index.html (created in 01-01 — add mobile menu button HTML)
@.planning/phases/01-foundation/01-CONTEXT.md
</context>

<interfaces>
<!-- Per D-05: Sans-serif typography — Inter font from Google Fonts, fallback system-ui -->
<!-- Per D-04: Clean, minimalist academic design — no clutter, generous whitespace -->
<!-- Per D-07, D-08, D-09: Color scheme -->
<!-- Per D-10: WCAG AA minimum contrast (4.5:1) -->
<!-- Per D-48: Font size scale: 1.25rem base with 1.25 modular scale -->
<!-- Per D-13: Mobile hamburger menu button added to index.html -->
<!-- Per D-50: CSS transitions only for hover states -->

Typography scale (1.25 modular from 1rem base):
- --text-xs: 0.64rem
- --text-sm: 0.8rem
- --text-base: 1rem
- --text-lg: 1.25rem
- --text-xl: 1.563rem
- --text-2xl: 1.953rem
- --text-3xl: 2.441rem
- --text-4xl: 3.052rem

From style.css additions (this plan):
```css
/* Font loading — add to <head> in index.html */
/* <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet"> */

/* Typography */
body { font-size: var(--text-base); line-height: 1.6; font-family: 'Inter', system-ui, sans-serif; }
h1 { font-size: var(--text-4xl); font-weight: 700; line-height: 1.2; }
h2 { font-size: var(--text-2xl); font-weight: 600; line-height: 1.3; }
h3 { font-size: var(--text-xl); font-weight: 600; }

/* Nav color styling */
#main-nav a { color: var(--color-text); transition: color 0.2s ease; }
#main-nav a:hover { color: var(--color-accent); }
#main-nav a:focus-visible { outline: 2px solid var(--color-accent); outline-offset: 2px; }

/* Section styling */
section { border-bottom: 1px solid #e5e5e5; }
section:last-child { border-bottom: none; }

/* Section headings accent underline */
section h2 { border-bottom: 3px solid var(--color-accent); display: inline-block; padding-bottom: var(--space-xs); margin-bottom: var(--space-xl); }

/* Mobile menu button (hidden on desktop) */
#menu-toggle { display: none; background: none; border: none; font-size: 1.5rem; cursor: pointer; color: var(--color-text); }
@media (max-width: 767px) {
  #menu-toggle { display: block; }
  #main-nav { display: none; flex-direction: column; align-items: center; padding: var(--space-md); }
  #main-nav.is-open { display: flex; }
}
```
</interfaces>

<tasks>

<task type="auto">
  <name>Task 1: Add Inter font and typography CSS to style.css</name>
  <files>style.css</files>
  <read_first>style.css</read_first>
  <action>
    Append the following to `style.css` (add after existing content — do NOT replace existing rules):

    1. Typography CSS custom properties (add to :root):
       ```
       --text-xs: 0.64rem;
       --text-sm: 0.8rem;
       --text-base: 1rem;
       --text-lg: 1.25rem;
       --text-xl: 1.563rem;
       --text-2xl: 1.953rem;
       --text-3xl: 2.441rem;
       --text-4xl: 3.052rem;
       ```

    2. Typography base styles:
       - `body { font-size: var(--text-base); line-height: 1.6; }`
       - `h1 { font-size: var(--text-4xl); font-weight: 700; line-height: 1.2; margin: 0 0 var(--space-lg) 0; }`
       - `h2 { font-size: var(--text-2xl); font-weight: 600; line-height: 1.3; margin: 0 0 var(--space-md) 0; }`
       - `h3 { font-size: var(--text-xl); font-weight: 600; margin: 0 0 var(--space-sm) 0; }`
       - `p { margin: 0 0 var(--space-md) 0; }`

    3. Header visual styling (replace/override the current header background):
       - `#site-header { background-color: #FFFFFF; box-shadow: 0 1px 3px rgba(0,0,0,0.08); }`

    4. Nav color application:
       - `#main-nav a { color: var(--color-text); text-decoration: none; font-size: var(--text-sm); transition: color 0.2s ease; padding: var(--space-xs) var(--space-sm); }`
       - `#main-nav a:hover { color: var(--color-accent); }`
       - `#main-nav a:focus-visible { outline: 2px solid var(--color-accent); outline-offset: 2px; border-radius: 2px; }`
       - `#main-nav a.active { color: var(--color-accent); font-weight: 600; }`

    5. Section heading accent styling:
       - `section h2 { color: var(--color-text); border-bottom: 3px solid var(--color-accent); display: inline-block; padding-bottom: var(--space-xs); margin-bottom: var(--space-xl); }`

    6. Section base styling refinements:
       - `section { border-bottom: 1px solid #e5e5e5; background-color: var(--color-bg); }`
       - `section:last-child { border-bottom: none; }`

    7. Links in content:
       - `a { color: var(--color-accent); text-decoration: none; transition: color 0.2s ease; }`
       - `a:hover { color: var(--color-accent-secondary); }`
       - `a:focus-visible { outline: 2px solid var(--color-accent); outline-offset: 2px; }`

    DO NOT change the layout rules (position:fixed, breakpoints, flexbox) from Plan 01-02.
    DO NOT use `!important` anywhere.
    DO NOT add animations beyond CSS transitions (0.2s ease).
  </action>
  <verify>
    <automated>grep -c 'Inter' style.css && grep -c 'var(--color-accent)' style.css && grep -c 'var(--text-4xl)' style.css && grep -c 'transition:' style.css</automated>
  </verify>
  <done>Typography scale, font-family, color application to nav/links/headings, hover states with CSS transitions, section visual polish added to style.css</done>
  <acceptance_criteria>
    - [ ] `--text-4xl: 3.052rem` in :root
    - [ ] `--text-2xl: 1.953rem` in :root
    - [ ] `font-family: 'Inter', system-ui, sans-serif` applied to body
    - [ ] `border-bottom: 3px solid var(--color-accent)` applied to section h2
    - [ ] `#site-header` has box-shadow
    - [ ] `transition: color 0.2s ease` present on nav links
    - [ ] `a:hover { color: var(--color-accent-secondary) }` present
    - [ ] `a:focus-visible` outline rule present
    - [ ] No layout rules (position, display, flex, grid, media queries) from Plan 01-02 were modified
    - [ ] No `!important` declarations in the file
  </acceptance_criteria>
</task>

<task type="auto">
  <name>Task 2: Add Inter font preconnect links to index.html and mobile menu button</name>
  <files>index.html</files>
  <read_first>index.html</read_first>
  <action>
    Modify `index.html` to add the following (insert inside &lt;head&gt;, before the existing link to style.css):

    1. Font preconnect and loading links:
       ```html
       <link rel="preconnect" href="https://fonts.googleapis.com">
       <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
       <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
       ```

    2. Mobile menu toggle button: Add a &lt;button id="menu-toggle" aria-label="Toggle navigation" aria-expanded="false"&gt;&#9776;&lt;/button&gt; inside #site-header, before the nav element.

    3. Add minimal JavaScript at the end of &lt;body&gt; (before the closing &lt;/body&gt; tag):
       ```html
       <script>
         const menuToggle = document.getElementById('menu-toggle');
         const mainNav = document.getElementById('main-nav');
         if (menuToggle && mainNav) {
           menuToggle.addEventListener('click', function() {
             mainNav.classList.toggle('is-open');
             const isOpen = mainNav.classList.contains('is-open');
             menuToggle.setAttribute('aria-expanded', isOpen);
           });
           // Close menu when clicking a nav link
           mainNav.querySelectorAll('a').forEach(function(link) {
             link.addEventListener('click', function() {
               mainNav.classList.remove('is-open');
               menuToggle.setAttribute('aria-expanded', 'false');
             });
           });
         }
       </script>
       ```

    Keep all existing structure (header, nav, sections) intact.
    DO NOT add any external JavaScript libraries.
    DO NOT modify the section content or add new elements outside header.
  </action>
  <verify>
    <automated>grep -c 'fonts.googleapis.com' index.html && grep -c 'menu-toggle' index.html && grep -c '&lt;script&gt;' index.html</automated>
  </verify>
  <done>Inter font loaded via Google Fonts preconnect, mobile hamburger button added to header, JavaScript for mobile menu toggle working</done>
  <acceptance_criteria>
    - [ ] `link rel="preconnect" href="https://fonts.googleapis.com"` present in head
    - [ ] `link rel="preconnect" href="https://fonts.gstatic.com"` present in head
    - [ ] `link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap"` present in head
    - [ ] button#menu-toggle with aria-label="Toggle navigation" present inside #site-header
    - [ ] Inline &lt;script&gt; block present at end of body
    - [ ] Script toggles 'is-open' class on #main-nav
    - [ ] Script closes menu when nav link is clicked
    - [ ] All four sections still present and unchanged
    - [ ] Nav still has all four anchor links
  </acceptance_criteria>
</task>

</tasks>

<verification>
1. Open index.html in browser — Inter font loads (check Network tab), teal accent visible on h2 underlines
2. Resize to mobile (< 768px) — hamburger menu button appears, clicking opens nav overlay
3. Click nav link — menu closes, page scrolls to section
4. All nav links: default color is near-black, hover color is teal
5. H2 headings have teal underline
6. Page meets WCAG AA contrast (teal on off-white background)
</verification>

<success_criteria>
- Inter font renders correctly (falls back to system-ui if offline)
- Color scheme (deep teal + amber + off-white + near-black) applied consistently
- Typography hierarchy is clear and readable
- Mobile hamburger menu works without external libraries
- Nav hover states use CSS transitions (no JS animation)
- All four sections visually consistent with academic/professional aesthetic

<output>
After completion, create `.planning/phases/01-foundation/01-03-SUMMARY.md`
</output>

---

## Decision Coverage Matrix

| Requirement | Plan | Task | Full/Partial | Notes |
|-------------|------|------|-------------|-------|
| STRU-01 | 01-01 | 1 | Full | section#about with h2, role=region, aria-labelledby |
| STRU-02 | 01-01 | 1 | Full | section#projects with h2, role=region |
| STRU-03 | 01-01 | 1 | Full | section#skills with h2, role=region |
| STRU-04 | 01-01 | 1 | Full | section#contact with h2, role=region |
| DESN-01 | 01-03 | 1 | Full | Clean academic aesthetic via off-white bg, teal accents, generous spacing, Inter font |
| DESN-02 | 01-02 | 1 | Full | Mobile-first CSS, breakpoints at 480/768/1024px, responsive nav |
| DESN-03 | 01-02 | 1 | Full | Static HTML/CSS only, no framework, no build step |
| DESN-04 | 01-03 | 1 | Full | WCAG AA contrast (near-black on off-white = 15.8:1), Inter font with 1.6 line-height |
| DESN-05 | 01-03 | 1 | Full | CSS custom properties for consistent color scheme, consistent section border styling |
