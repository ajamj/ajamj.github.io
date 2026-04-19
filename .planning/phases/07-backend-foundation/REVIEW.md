---
phase: 07-backend-foundation
reviewed: 2026-04-19T12:00:00Z
depth: standard
files_reviewed: 10
files_reviewed_list:
  - backend/manage.py
  - backend/portfolio/settings.py
  - backend/portfolio/urls.py
  - backend/api/models.py
  - backend/api/admin.py
  - backend/api/views.py
  - backend/api/serializers.py
  - backend/api/urls.py
  - backend/requirements.txt
  - backend/.env
findings:
  critical: 3
  warning: 4
  info: 3
  total: 10
status: issues_found
---

# Phase 07: Backend Foundation Code Review

**Reviewed:** 2026-04-19
**Depth:** standard
**Files Reviewed:** 10
**Status:** issues_found

## Summary

The Django backend foundation implements REST APIs for portfolio content management. Several security, correctness, and maintainability issues were identified. **Critical issues** include hardcoded secrets and missing CSRF protection on POST endpoints. Performance is acceptable for MVP but has room for optimization.

## Critical Issues

### CR-01: Hardcoded Secrets in .env File

**File:** `backend/.env:2`
**Issue:** The `.env` file contains a hardcoded SECRET_KEY committed to version control. This is a security risk - secrets should never be committed to git.

**Fix:**
```bash
# Add to .gitignore:
backend/.env

# Regenerate new secret key:
python -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"
```

### CR-02: DEBUG True by Default in .env

**File:** `backend/.env:1`
**Issue:** `DEBUG=True` is hardcoded in the `.env` file. In production, DEBUG must be False to prevent information disclosure.

**Fix:** Remove `DEBUG=True` from `.env` and set via environment variable at runtime:
```bash
# In production, run:
DEBUG=False python manage.py runserver
```

### CR-03: Missing CSRF Protection on Contact API

**File:** `backend/api/views.py:17-19`
**Issue:** The ContactViewSet accepts POST requests without CSRF protection. While DRF has own CSRF handling, the current configuration may allow cross-site request forgery on the contact form endpoint.

**Fix:** Add explicit permission classes to ContactViewSet:
```python
class ContactViewSet(viewsets.ModelViewSet):
    queryset = Contact.objects.all()
    serializer_class = ContactSerializer
    permission_classes = [permissions.AllowAny]  # Explicit is better
```

---

## Warnings

### WR-01: Missing Database Indexes

**File:** `backend/api/models.py`
**Issue:** No explicit indexes defined. Queries on `published`, `slug`, and `read` fields would benefit from database indexes.

**Fix:**
```python
class BlogPost(models.Model):
    # ...
    class Meta:
        ordering = ['-date']
        indexes = [
            models.Index(fields=['published', '-date']),
            models.Index(fields=['slug']),
        ]

class Contact(models.Model):
    # ...
    class Meta:
        ordering = ['-created_at']
        indexes = [
            models.Index(fields=['read', '-created_at']),
        ]
```

### WR-02: No Pagination on ViewSets

**File:** `backend/api/views.py`
**Issue:** All ViewSets return unlimited querysets. Large result sets could cause performance issues.

**Fix:** Add pagination in settings.py:
```python
REST_FRAMEWORK = {
    'DEFAULT_PERMISSION_CLASSES': [
        'rest_framework.permissions.AllowAny',
    ],
    'DEFAULT_PAGINATION_CLASS': 'rest_framework.pagination.PageNumberPagination',
    'PAGE_SIZE': 20,
}
```

### WR-03: No Rate Limiting

**File:** `backend/api/views.py:17-19`
**Issue:** Contact endpoint has no rate limiting, allowing spam/abuse.

**Fix:** Add throttle class:
```python
from rest_framework.throttling import AnonRateThrottle

class ContactViewSet(viewsets.ModelViewSet):
    # ...
    throttle_classes = [AnonRateThrottle]
    throttle_rates = {'anon': '10/hour'}
```

### WR-04: Model Validation Gaps

**File:** `backend/api/models.py`
**Issue:** No model-level validators for email format or field constraints.

**Fix:**
```python
from django.core.validators import EmailValidator

class Contact(models.Model):
    email = models.EmailField(validators=[EmailValidator()])
    # Add blank=False for required fields:
    name = models.CharField(max_length=100, blank=False)
```

---

## Info

### IN-01: Unused Default Value

**File:** `backend/portfolio/settings.py:7`
**Issue:** Default SECRET_KEY `'django-insecure-dev-key-change-in-production'` should not exist - forces proper deployment practice but can be confusing.

**Fix:** Remove default, require environment variable:
```python
SECRET_KEY = os.environ.get('SECRET_KEY')
if not SECRET_KEY:
    raise ImproperlyConfigured("SECRET_KEY must be set")
```

### IN-02: Missing __str__ in Project

**File:** `backend/api/models.py:13-14`
**Issue:** Project.__str__ is acceptable but could include date for admin clarity.

**Fix:**
```python
def __str__(self):
    return f"{self.title} ({self.date.year})"
```

### IN-03: Skill Model - Consider Better Schema

**File:** `backend/api/models.py:52-67`
**Issue:** Using plain IntegerField for proficiency (0-100) could accept any value - no bounds validation.

**Fix:**
```python
from django.core.validators import MinValueValidator, MaxValueValidator

proficiency = models.IntegerField(
    default=50,
    validators=[MinValueValidator(0), MaxValueValidator(100)]
)
```

---

_Reviewed: 2026-04-19_
_Reviewer: gsd-code-reviewer_
_Depth: standard_