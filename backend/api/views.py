from rest_framework import generics
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import AllowAny
from django.shortcuts import get_object_or_404
from .models import Project, BlogPost, Contact, Skill
from .serializers import (
    ProjectSerializer,
    BlogPostListSerializer,
    BlogPostDetailSerializer,
    ContactSerializer,
    SkillSerializer,
)


# Project Views
class ProjectListView(generics.ListAPIView):
    """GET /api/projects/ - List all projects"""

    queryset = Project.objects.all().order_by("-date")
    serializer_class = ProjectSerializer
    permission_classes = [AllowAny]


class ProjectDetailView(generics.RetrieveAPIView):
    """GET /api/projects/:id/ - Get single project"""

    queryset = Project.objects.all()
    serializer_class = ProjectSerializer
    lookup_field = "id"
    permission_classes = [AllowAny]


# Blog Views
class BlogPostListView(generics.ListAPIView):
    """GET /api/blog/ - List published posts"""

    queryset = BlogPost.objects.filter(published=True).order_by("-date")
    serializer_class = BlogPostListSerializer
    permission_classes = [AllowAny]


class BlogPostDetailView(generics.RetrieveAPIView):
    """GET /api/blog/:slug/ - Get single post"""

    queryset = BlogPost.objects.filter(published=True)
    serializer_class = BlogPostDetailSerializer
    lookup_field = "slug"
    permission_classes = [AllowAny]


# Contact View
class ContactCreateView(generics.CreateAPIView):
    """POST /api/contact/ - Submit contact form"""

    serializer_class = ContactSerializer
    permission_classes = [AllowAny]

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        return Response(
            {"message": "Thank you for your message! I'll get back to you soon."},
            status=status.HTTP_201_CREATED,
        )


# Skill View
class SkillListView(generics.ListAPIView):
    """GET /api/skills/ - List all skills"""

    queryset = Skill.objects.all().order_by("category", "-proficiency")
    serializer_class = SkillSerializer
    permission_classes = [AllowAny]
