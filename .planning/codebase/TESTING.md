# Testing Patterns

**Analysis Date:** 2026-04-17

## Test Framework

**Runner:**
- Not detected. No testing framework is currently configured in `package.json`.

**Assertion Library:**
- Not detected.

**Run Commands:**
- No test-related commands found in `package.json`.

## Test File Organization

**Location:**
- No test files found in the project.

**Naming:**
- No standard pattern established yet.

## Test Structure

**Suite Organization:**
- Not applicable.

## Mocking

**Framework:** Not detected.

**Patterns:**
- Not applicable.

## Fixtures and Factories

**Test Data:**
- Not applicable.

**Location:**
- Not applicable.

## Coverage

**Requirements:** None enforced.

**View Coverage:**
- Not applicable.

## Test Types

**Unit Tests:**
- Not used.

**Integration Tests:**
- Not used.

**E2E Tests:**
- Not used.

## Recommended Patterns (Proposed)

Given the focus on data visualization and geophysics, the following testing patterns are recommended for future implementation:

1. **Visual Regression Testing:**
   - Use Playwright or Cypress to ensure interactive visualizations (e.g., `src/components/ResearchDataViz.astro`) render correctly across different screen sizes.

2. **Component Testing:**
   - Use Vitest with `astro-component-tester` or similar to test prop-based rendering of components.

3. **Schema Validation Tests:**
   - Ensure content in `src/content/blog/` matches the schema defined in `src/content/config.ts` during the build process (Astro does this by default).

4. **Data Logic Tests:**
   - If complex geophysics calculations are added to the frontend, extract them into helper functions in `src/utils/` and test them with Vitest.

---

*Testing analysis: 2026-04-17*
