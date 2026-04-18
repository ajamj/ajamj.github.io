# Research: Personal Portrait Integration

## Current State
- Hero section punya animated seismic waveform background
- Title dan subtitle only (no photo)

## Target State
- Add personal photo di Hero section

## Implementation Approach

### Option 1: Hero Photo (Recommended)
Lokasi: Hero section, sebelah nama
- Circular atau rounded-square frame
- Geophysics-themed border (waveform/grid)
- Responsive: smaller di mobile

### Option 2: About Section Photo
Lokasi: About section
- Full-width atau floated image
- Caption dengan name dan title

### Constraints
- **Image source**: `img/self-portrait.jpg` (sudah ada di repo)
- **Accessibility**: Proper alt text
- **Responsive**: Work di mobile dan desktop
- **Aesthetic**: Match "Digital Lithosphere" / HUD theme

## Technical Details

```astro
// Di Hero.astro
<img 
  src="/img/self-portrait.jpg" 
  alt="Ajam Jamaludin - Geophysics Researcher"
  class="hero-portrait"
/>
```

```css
.hero-portrait {
  width: 150px;
  height: 150px;
  border-radius: 50%;
  border: 2px solid var(--color-accent);
  box-shadow: 0 0 20px var(--color-accent-glow);
}
```

## Recommended

**Hero Photo (Option 1)** - Most visible dan professional untuk portfolio:
- Circular frame dengan accent border glow
- Alt text for accessibility
- Lazy loading untuk performance
- Size optimization via Astro Image component