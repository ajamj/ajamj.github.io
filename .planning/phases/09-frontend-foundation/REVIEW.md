---
phase: 09-frontend-foundation
reviewed: 2026-04-19T12:00:00Z
depth: standard
files_reviewed: 15
files_reviewed_list:
  - frontend/src/main.jsx
  - frontend/src/App.jsx
  - frontend/vite.config.js
  - frontend/index.html
  - frontend/package.json
  - frontend/eslint.config.js
  - frontend/src/components/ContactForm.jsx
  - frontend/src/components/Header.jsx
  - frontend/src/components/Hero.jsx
  - frontend/src/components/Footer.jsx
  - frontend/src/pages/Blog.jsx
  - frontend/src/pages/BlogPost.jsx
  - frontend/src/pages/Home.jsx
  - frontend/src/pages/Projects.jsx
  - frontend/src/pages/CV.jsx
findings:
  critical: 1
  warning: 3
  info: 5
  total: 9
status: issues_found
---

# Phase 09: Frontend Foundation Review Report

**Reviewed:** 2026-04-19
**Depth:** standard
**Files Reviewed:** 15
**Status:** issues_found

## Summary

The React Vite implementation provides a solid foundation with proper routing structure and React Router v7 integration. However, there is **one critical security issue** (XSS vulnerability) that must be addressed before production deployment. Performance optimizations are needed for lazy loading, and several maintainability improvements would enhance long-term code quality.

## Critical Issues

### CR-01: XSS Vulnerability in BlogPost.jsx

**File:** `frontend/src/pages/BlogPost.jsx:24`
**Issue:** Using `dangerouslySetInnerHTML` to render untrusted content from API without sanitization creates a direct XSS vulnerability. If `post.content` contains malicious JavaScript (e.g., `<script>alert('xss')</script>` or event handlers), it will execute in users' browsers.
**Fix:**
```jsx
// Install DOMPurify: npm install dompurify
import DOMPurify from 'dompurify'

// In the component, sanitize before rendering:
<div dangerouslySetInnerHTML={{ __html: DOMPurify.sanitize(post.content) }} />
```

## Warnings

### WR-01: No Route-Based Code Splitting

**File:** `frontend/src/App.jsx:17-24`
**Issue:** All routes are bundled into a single JavaScript chunk. This increases initial bundle size and slows Time to Interactive (TTI).
**Fix:**
```jsx
import { lazy, Suspense } from 'react'
import { Routes, Route } from 'react-router-dom'

const Home = lazy(() => import('./pages/Home'))
const About = lazy(() => import('./pages/About'))
const Projects = lazy(() => import('./pages/Projects'))
const CV = lazy(() => import('./pages/CV'))
const Blog = lazy(() => import('./pages/Blog'))
const BlogPost = lazy(() => import('./pages/BlogPost'))

function App() {
  return (
    <Suspense fallback={<div>Loading...</div>}>
      <Routes>
        <Route path="/" element={<Home />} />
        {/* ...other routes */}
      </Routes>
    </Suspense>
  )
}
```

### WR-02: Missing Input Validation in ContactForm

**File:** `frontend/src/components/ContactForm.jsx:12-17`
**Issue:** Form inputs are stored directly without sanitization. While React escapes by default, consider adding length limits and server-side validation.
**Fix:**
```jsx
const handleChange = (e) => {
  const { name, value } = e.target
  // Add length limits
  const sanitized = name === 'message' ? value.slice(0, 1000) : value.slice(0, 100)
  setFormData({ ...formData, [name]: sanitized })
}
```

### WR-03: Hardcoded API Endpoint

**File:** `frontend/src/components/ContactForm.jsx:24`
**Issue:** API endpoint `/api/contact/` is hardcoded with no environment-based configuration.
**Fix:** Create `.env` file:
```env
VITE_API_URL=http://localhost:3000
```
Then use: `import.meta.env.VITE_API_URL + '/contact/'`

## Info

### IN-01: Generic HTML Title

**File:** `frontend/index.html:7`
**Issue:** Title is set to "frontend" - should be the site name.
**Fix:** Change to `<title>Ajam Jamaludin | Geophysics Researcher</title>`

### IN-02: Missing CSS Reset/Normalize

**File:** `frontend/src/index.css`
**Issue:** No CSS reset for consistent cross-browser rendering.
**Fix:** Add minimal reset:
```css
*, *::before, *::after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}
```

### IN-03: No Error Boundary

**File:** `frontend/src/main.jsx`
**Issue:** No error boundary to catch rendering errors gracefully.
**Fix:** Add error boundary component wrapper.

### IN-04: Minimal Vite Config

**File:** `frontend/vite.config.js`
**Issue:** Basic build config without optimization options.
**Fix:**
```js
export default defineConfig({
  plugins: [react()],
  build: {
    outDir: 'dist',
    rollupOptions: {
      output: {
        manualChunks: {
          vendor: ['react', 'react-dom', 'react-router-dom'],
        },
      },
    },
  },
})
```

### IN-05: Missing Favicon

**File:** `frontend/index.html:5`
**Issue:** References `/favicon.svg` but file location unclear.
**Fix:** Ensure `frontend/public/favicon.svg` exists, or update path.

---

_Reviewed: 2026-04-19_
_Reviewer: the agent (gsd-code-reviewer)_
_Depth: standard_