from django.urls import path, include
from rest_framework import routers
from .views import ProjectViewSet, BlogPostViewSet, ContactViewSet, SkillViewSet

router = routers.DefaultRouter()
router.register(r'projects', ProjectViewSet)
router.register(r'blog', BlogPostViewSet)
router.register(r'contact', ContactViewSet)
router.register(r'skills', SkillViewSet)

urlpatterns = [
    path('', include(router.urls)),
]