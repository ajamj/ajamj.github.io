---
phase: 08
plan: 01
status: discussed
created: 2026-04-19
---

## Gray Areas & Decisions

| Area | Decision | Rationale |
|------|----------|----------|
| Pagination | Default DRF pagination (50 items) | Sufficient for portfolio, can adjust later |
| Filtering | `published=True` exposed via query param | Keep simple, filter on client or via `?published=true` |
| Error Format | DRF default | Works out of box, sufficient for MVP |
| API Versioning | No versioning (single API) | Keep simple, add `/api/v1/` later if needed |

## Downstream Guidance

**For researcher:**
- All technical decisions are standard DRF patterns
- No special research needed

**For planner:**
- Standard ModelViewSet patterns from Phase 07 are sufficient
- All serializers already created in Phase 07
- Only need to wire up URLs

## Locked Decisions

- `/api/projects/` — GET list, POST create
- `/api/projects/:id/` — GET, PUT, DELETE
- `/api/blog/` — GET list (filter support), POST create
- `/api/blog/:slug/` — GET detail, PUT, DELETE
- `/api/contact/` — POST only (public endpoint)
- `/api/skills/` — GET list

## Deferred Ideas

- API versioning (for future)
- Rate limiting (for production, Phase 12)
- Custom error responses (if needed later)