from rest_framework import serializers
from .models import Project, BlogPost, Contact, Skill


class ProjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = Project
        fields = [
            "id",
            "title",
            "description",
            "tech_stack",
            "image",
            "link",
            "date",
            "created_at",
        ]


class BlogPostListSerializer(serializers.ModelSerializer):
    """Lightweight serializer for blog listing"""

    class Meta:
        model = BlogPost
        fields = ["id", "title", "slug", "excerpt", "published", "date", "tags"]


class BlogPostDetailSerializer(serializers.ModelSerializer):
    """Full serializer for single blog post"""

    class Meta:
        model = BlogPost
        fields = [
            "id",
            "title",
            "slug",
            "content",
            "excerpt",
            "published",
            "date",
            "tags",
            "created_at",
        ]


class ContactSerializer(serializers.ModelSerializer):
    class Meta:
        model = Contact
        fields = ["id", "name", "email", "message", "created_at"]
        read_only_fields = ["id", "created_at"]

    def create(self, validated_data):
        # Contact submissions don't need a response
        return super().create(validated_data)


class SkillSerializer(serializers.ModelSerializer):
    class Meta:
        model = Skill
        fields = ["id", "name", "category", "proficiency"]
