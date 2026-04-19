---
phase: 08-backend-api
reviewed: 2026-04-19T14:30:00Z
depth: standard
files_reviewed: 3
files_reviewed_list:
  - backend/api/serializers.py
  - backend/api/views.py
  - backend/api/urls.py
findings:
  critical: 0
  warning: 3
  info: 3
  total: 6
status: issues_found
---

# Phase 8: Backend API Code Review

**Reviewed:** 2026-04-19
**Depth:** standard
**Files Reviewed:** 3
**Status:** issues_found

## Summary

The REST API implementation for the portfolio backend is well-structured with clear separation of concerns. It provides public read endpoints for Projects, Blog Posts, Skills, and a write endpoint for Contact submissions. Overall code quality is solid with proper use of Django REST Framework patterns.

**Key strengths:**
- Clean architecture with separate serializers, views, and URLs
- Lightweight list serializers vs detailed serializers for optimal payload
- Database indexes on frequently queried fields
- Proper HTTP status codes (201 for created)

**Issues found are moderate warnings** - the code works correctly but has room for improvement in production hardening.

---

## Warnings

### WR-01: Hardcoded CORS Origins in settings.py

**File:** `backend/portfolio/settings.py:39-43`
**Issue:** CORS origins are hardcoded instead of environment variables. This creates deployment friction and potential for forgetting to update in production.
**Fix:**
```python
# Change from:
CORS_ALLOWED_ORIGINS = [
    "https://ajamj.pages.dev",
    "http://localhost:5173",
    "http://localhost:3000",
]

# To:
CORS_ALLOWED_ORIGINS = [
    os.environ.get("CORS_ORIGIN", "http://localhost:5173"),
]
# Or use CORS_ALLOW_ALL_ORIGINS = DEBUG for dev
```

---

### WR-02: No Input Validation on Contact Form

**File:** `backend/api/serializers.py:46-54`
**Issue:** ContactSerializer has no field validation beyond Django's default. The `message` field has no max_length, allowing excessively long submissions. No honeypot or rate limiting for spam prevention.
**Fix:**
```python
class ContactSerializer(serializers.ModelSerializer):
    class Meta:
        model = Contact
        fields = ["id", "name", "email", "message", "created_at"]
        read_only_fields = ["id", "created_at"]

    # Add validation
    def validate_message(self, value):
        if len(value) < 10:
            raise serializers.ValidationError("Message too short")
        if len(value) > 2000:
            raise serializers.ValidationError("Message too long (max 2000 chars)")
        return value

    def validate_name(self, value):
        if len(value) < 2:
            raise serializers.ValidationError("Name too short")
        return value.strip()
```

---

### WR-03: No Rate Limiting on Contact Endpoint

**File:** `backend/api/views.py:54-67`
**Issue:** The contact form endpoint has no rate limiting, making it vulnerable to spam/abuse. Users could automate submissions.
**Fix:** Add throttling in settings:
```python
REST_FRAMEWORK = {
    "DEFAULT_PERMISSION_CLASSES": [
        "rest_framework.permissions.AllowAny",
    ],
    "DEFAULT_THROTTLE_CLASSES": [
        "rest_framework.throttling.AnonRateThrottle",
    ],
    "DEFAULT_THROTTLE_RATES": {
        "anon": "10/hour",  # 10 submissions per hour
    },
}
```

Or apply per-endpoint in ContactCreateView:
```python
class ContactCreateView(generics.CreateAPIView):
    throttle_classes = [AnonRateThrottle]
    throttle_scope = "contact"
```

---

## Info

### IN-01: Missing URL Namespaces

**File:** `backend/api/urls.py`
**Issue:** URL patterns have no `name` parameter, making reverse lookups harder.
**Fix:**
```python
urlpatterns = [
    path("projects/", views.ProjectListView.as_view(), name="api-project-list"),
    path("projects/<int:id>/", views.ProjectListView.as_view(), name="api-project-detail"),
    # ... etc
]
```

---

### IN-02: No Pagination

**File:** `backend/api/views.py`
**Issue:** List views return all objects. At scale, this could cause performance issues. Currently acceptable for portfolio size.
**Fix:** Add pagination for future-proofing in settings:
```python
REST_FRAMEWORK = {
    # ... existing config
    "DEFAULT_PAGINATION_CLASS": "rest_framework.pagination.LimitOffsetPagination",
    "PAGE_SIZE": 20,
}
```

---

### IN-03: Success Message Could Be Contextual

**File:** `backend/api/views.py:64-67`
**Issue:** The success message is static. Could vary based on time of day or other context for better UX.
**Fix:** (Optional) Consider making message more personalized or localized.

---

_Reviewed: 2026-04-19_
_Reviewer: the agent (gsd-code-reviewer)_
_Depth: standard_