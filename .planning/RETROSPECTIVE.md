# Project Retrospective & Learnings

## Milestone 3: Academic Redesign (Astro)

### Core Learnings

1. **Astro static architecture is significantly more efficient than dynamic frameworks (Django/React) for academic portfolios.**
   - *Rationale:* Provides better performance (lower TTI), zero server maintenance, and easier deployment to GitHub Pages.
   - *Impact:* Reduced complexity and hosting costs.

2. **CSS clamp() function effectively reduces media query complexity.**
   - *Rationale:* Allows for fluid visual consistency across all device sizes (mobile to 4K) without writing hundreds of lines of breakpoint-specific code.
   - *Impact:* Maintainable and robust responsive styling.

3. **Astro <Image /> component is mandatory for asset optimization.**
   - *Rationale:* Automates WebP conversion, resizing, and critical PII protection by stripping EXIF/location metadata.
   - *Impact:* Faster load times and improved privacy.

4. **Honeypot fields are the preferred anti-spam solution for static contact forms.**
   - *Rationale:* Lightweight, CSS-hidden inputs successfully catch basic bots without requiring intrusive CAPTCHAs.
   - *Impact:* Better UX for real users while maintaining security.

5. **Early removal of deprecated experimental code is crucial.**
   - *Rationale:* Deleting unused framework folders (React/Django) reduces cognitive load during development and keeps the repository footprint lean.
   - *Impact:* Improved focus on the active Astro codebase.

### Visual Patterns
- **Theme**: Obsidian-Seismic (#0a0f0d background / #3b82f6 accent).
- **Surface**: Glassmorphism (rgba(20, 26, 23, 0.6) with 12px blur).
- **Navigation**: Sliding drawer for mobile with 44x44px touch targets.
