# Research: Multi-Page Structure

## Current State
- Single-page SPA dengan anchor links (`#hero`, `#projects`, `#skills`, `#contact`)
- Blog sudah separate page di `/blog`

## Target State
- `/` - Home (simplified Hero tanpa full content)
- `/projects` - Portfolio Projects page
- `/skills` - Technical Skills page
- `/contact` - Contact page (bisa sama seperti sekarang)
- `/about` - About section terpisah

## Implementation Approach

### Option 1: Decompose Index
```bash
src/pages/
├── index.astro          # Simplified hero + full sections
├── projects.astro       # Dedicated projects page
├── skills.astro         # Dedicated skills page
├── about.astro          # About/Bio page
└── contact.astro        # Contact page
```

### Option 2: Keep Index, Add New Pages
Tambah pages baru tanpa ubah yang existing:
- `/about` - Full bio dengan portrait
- `/projects` - Extended project descriptions
- `/cv` - CV/Resume download

## Considerations

| Factor | Analysis |
|--------|----------|
| **SEO** | Better separate pages untuk target keywords |
| **User Flow** | Anchor smooth scroll vs page navigation |
| **Content** | More space untuk detailed project descriptions |
| **Maintenance** | Slightly more files to manage |
| **Astro Routing** | Automatic via file-based routing |

## Recommended

Start dengan Option 2 (Keep Index, Add New Pages):
1. `/about` - Full bio + portrait
2. `/cv` - Resume/CV page
3. `/projects` - Extended project showcase (bukan hanya cards)

This minimizes risk dan maintains existing functionality.