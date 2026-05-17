# Redesign Concept — Ajam Jamaludin Personal Website

## Understanding Summary

Website pribadi Ajam Jamaludin akan diarahkan ulang sebagai portfolio profesional yang minimal, elegan, akademik, dan teknis. Tujuannya bukan membuka semua detail proyek, tetapi memberi sinyal kredibilitas yang cepat: siapa Ajam, bidang geofisika yang ditekuni, konteks akademik/profesional, dan cara menghubungi.

Arah konten yang dikonfirmasi adalah technical geophysics portfolio dengan tone akademik. Homepage harus tetap ringkas dan aman secara informasi: tidak menampilkan dataset rinci, metode internal, parameter pemrosesan, hasil riset belum publik, atau detail proyek yang sensitif.

## Visual Direction

The redesign should feel like a minimal academic geoscience portfolio: light, calm, precise, and credible. It should communicate professional signal without exposing detailed technical work.

- Background: light/off-white base, avoiding heavy dark-mode treatment.
- Text: graphite/slate primary text with restrained contrast and clear hierarchy.
- Accent: muted teal or deep ocean accent for links, section markers, and selected highlights.
- Layout: generous spacing, narrow readable text measures, and calm section rhythm.
- Typography: editorial serif headings paired with a readable sans-serif body.
- Motif: subtle waveform, seismic trace, or contour-line motif only; decorative elements must stay quiet and non-distracting.
- Overall tone: minimal, elegant, professional, and academic rather than flashy or metric-heavy.

## Assumptions

- Audiens utama: akademisi, peneliti, calon kolaborator, recruiter, dan profesional geosains.
- Codebase aktual menggunakan Astro sebagai generator/build layer ringan untuk static site di GitHub Pages.
- Homepage berfungsi sebagai professional signal, bukan dokumentasi teknis lengkap.
- Detail proyek hanya ditampilkan pada level aman: judul umum, konteks, peran, dan hasil tingkat tinggi.
- Public-facing homepage copy should be English-first and consistently English unless the site is intentionally localized later.

## Non-Goals

- Tidak menjadikan homepage sebagai laporan teknis.
- Tidak menampilkan dataset mentah, koordinat sensitif, parameter pemrosesan rinci, workflow internal, atau kode sensitif.
- Tidak menambahkan analytics/tracking pihak ketiga.
- Tidak membuat desain terlalu eksperimental sehingga mengurangi kesan akademik.
- Tidak mengklaim seniority atau expertise yang belum bisa dibuktikan.

## Language Strategy

Homepage labels, navigation, calls to action, project summaries, SEO metadata, and public-facing copy should be consistently English for v1. Indonesian may remain in internal notes, planning documents, or draft annotations, but should not mix into homepage UI copy unless a deliberate localization pass is added later.

The tone should stay academic, concise, and grounded. Avoid inflated claims, senior-level positioning, or language that implies ownership of confidential research outcomes.

## Final Homepage Structure

1. Hero
2. About
3. Research & Technical Focus
4. Selected Work
5. Skills & Tools
6. Academic / Professional Profile
7. Contact
8. Footer

## Copy Draft

The following copy is intentionally high-level. It should provide safe proof points without revealing project details, datasets, internal methods, coordinates, unpublished results, or confidential affiliations.

### Hero

**Ajam Jamaludin**  
Junior Geophysical Research Assistant

Geophysics portfolio focused on seismic data processing, earthquake monitoring, and applied geophysics.

CTA:
- View CV
- Contact

### About

Ajam Jamaludin is a junior geophysical research assistant with a geophysics background from Universitas Gadjah Mada. His work focuses on seismic data processing, earthquake monitoring, and applied geophysics.

He is interested in practical, reproducible, and scientifically grounded workflows that support geophysical research, technical communication, and geoscience visualization.

### Safe Proof Points

Public copy may reference only broad, verifiable signals:

- Geophysics background from Universitas Gadjah Mada.
- Junior Geophysical Research Assistant role.
- Focus areas: seismic data processing, earthquake monitoring, seismology, and applied geophysics.
- Broad tools: Python, scientific computing, geospatial visualization, technical documentation, and research-oriented data analysis.
- Avoid overclaiming expertise, proprietary accomplishments, confidential project outcomes, or detailed technical metrics.

### Research & Technical Focus

Core areas of interest:

- Seismology and earthquake monitoring
- Seismic data processing
- Exploration geophysics
- Geophysical visualization and technical reporting
- Research-oriented data analysis workflows

### Selected Work

Selected work should be presented as short, non-sensitive summaries. Homepage cards should avoid detailed methods, datasets, metrics, coordinates, or internal workflow descriptions.

Suggested card format:

- Title: broad project/work category
- Context: one sentence
- Role: high-level role only
- Detail level: summary only / available on request / see CV

Suggested public-facing categories:

#### Seismic Data Processing

Processing and interpretation support for geophysical data analysis.  
Role: data preparation, visualization, and technical documentation.  
Detail level: summary only.

#### Earthquake Monitoring Workflow

Research-oriented work related to earthquake event observation and seismic signal analysis.  
Role: analysis support and workflow documentation.  
Detail level: general workflow description only.

#### Applied Geophysics Research Notes

Selected academic and technical explorations in geophysics, presented at a high level for portfolio review.  
Role: research support and technical communication.  
Detail level: non-sensitive summary.

### Skills & Tools

Technical areas:

- Seismic data processing
- Seismology
- Signal analysis
- Data visualization
- Technical writing
- Research documentation

Tools and environments:

- Python
- Scientific computing tools
- GIS/geoscience software
- Seismic interpretation and processing tools
- Git/GitHub
- HTML/CSS/JavaScript and Astro for portfolio presentation

### Placeholder Policy

Email, CV, GitHub, LinkedIn, Google Scholar, and other social/profile links must be resolved before shipping. If a link is not confirmed, omit it from the public homepage rather than publishing bracketed placeholder labels, `#`, empty links, or dummy URLs.

### Academic / Professional Profile

Background:

- Geophysics, Universitas Gadjah Mada
- Junior Geophysical Research Assistant
- Interest in seismic methods, earthquake monitoring, and applied geoscience research

Optional links:

- CV
- GitHub
- LinkedIn
- Google Scholar, if available

### Contact

For research collaboration, technical discussion, or professional opportunities, provide only confirmed contact channels in the final implementation.

Final implementation may include only confirmed links. If email, GitHub, LinkedIn, CV, or other profile links are unavailable, omit them entirely rather than replacing them with placeholders, empty links, `#`, or dummy URLs.

### Footer

© Ajam Jamaludin. Personal academic and technical portfolio.

## Content Privacy Rules

- Do not publish raw seismic data, client data, proprietary datasets, or unpublished research data.
- Do not expose detailed processing parameters, scripts, internal workflows, or confidential methodology.
- Do not mention client names unless explicitly approved.
- Do not show sensitive maps, coordinates, survey lines, station metadata, or acquisition geometry.
- Keep project descriptions at summary level: context, role, broad outcome, and safe tools/categories only.
- Use screenshots or figures only if they are cleared for public use.
- If uncertain, remove technical specificity and describe the work conceptually.

## Astro Implementation Mapping

- Keep Astro as the static output layer for GitHub Pages.
- Reuse the existing layout, header/navigation, footer, and page structure where practical.
- Convert the concept into simple static Astro components or existing sections rather than adding a new framework.
- Simplify or replace metric-heavy, dashboard-like, or data-viz-heavy components if they imply sensitive detail or distract from the academic portfolio tone.
- Remove, simplify, or clearly make non-sensitive any current interactive components. Interactions should support navigation or readability, not simulate confidential analysis workflows.
- Do not add runtime services, databases, analytics, tracking scripts, or heavy dependencies.
- Keep assets lightweight and public-safe. Any waveform/contour motif should be decorative and generic, not derived from sensitive data.

## Acceptance Criteria

- Pass: Homepage includes hero, about, research/technical focus, selected work, skills/tools, profile, contact, and footer. Fail: any core content section is missing or still uses unresolved placeholder text.
- Pass: Copy references only safe proof points at a high level. Fail: copy exposes datasets, coordinates, client names, unpublished results, internal methods, detailed processing parameters, or overclaims seniority.
- Pass: Public-facing copy is consistently English. Fail: homepage UI mixes Indonesian and English unintentionally.
- Pass: Layout is readable on mobile, tablet, and desktop with generous spacing and no horizontal overflow. Fail: content clips, overlaps, or requires sideways scrolling.
- Pass: Basic accessibility is covered: semantic headings, meaningful links, visible focus states, alt text for meaningful images, and sufficient contrast. Fail: keyboard users cannot navigate, focus is hidden, images lack useful alt handling, or contrast is weak.
- Pass: SEO metadata includes accurate title, description, canonical/social basics where appropriate, and no misleading keywords. Fail: metadata is missing, stale, placeholder-based, or overstates credentials.
- Pass: `npm run build` completes successfully and output remains static. Fail: build fails or requires a runtime service.
- Pass: Site remains lightweight with no heavy new dependencies. Fail: redesign introduces unnecessary runtime libraries or large assets.
- Pass: No analytics, trackers, pixels, third-party embeds, or hidden data collection are present. Fail: any tracking or non-essential external script is added.

## Verification Plan

1. Run `npm run build` and confirm the Astro static build succeeds.
2. Review responsive layouts at mobile, tablet, and desktop widths.
3. Check keyboard navigation and visible focus states for header, CTA, project links, and contact links.
4. Inspect SEO metadata for accurate English title, description, and social preview values.
5. Confirm there are no analytics scripts, tracking pixels, third-party embeds, or unexpected network-dependent runtime services.
6. Review all public copy and assets for privacy: no sensitive project details, client identifiers, coordinates, raw data, unpublished results, or placeholder links.

## Decision Log

| Decision | Rationale |
|---|---|
| Minimal professional design | Supports academic credibility and avoids visual clutter. |
| Technical but restrained copy | Signals expertise without exposing sensitive project details. |
| Homepage as overview only | Keeps the page concise and recruiter/collaborator friendly. |
| No detailed methods on homepage | Protects research, client, and project confidentiality. |
| Astro static site retained | Matches actual codebase while keeping deployment lightweight. |
| Academic tone | Fits Ajam's geophysics research background. |
| English-first public copy | Keeps the homepage consistent for academic, recruiter, and collaborator audiences. |
| Safe proof points only | Builds credibility without exposing private project details or overclaiming. |

## Risks

- Copy may become too generic if project descriptions are overly restricted.
- Portfolio may feel thin without approved visuals or public-facing outputs.
- Overly minimal design may reduce memorability if typography and layout are not carefully handled.
- Localization may need a dedicated pass later if Indonesian public copy is intentionally introduced.
- Public project summaries must be reviewed to ensure no confidential detail is accidentally exposed.
- Placeholder links may accidentally ship if CV, email, or social profiles are not resolved before implementation.

## Next Step

Before implementation, run the concept through a design review gate and convert the approved concept into a concrete Astro implementation plan.
