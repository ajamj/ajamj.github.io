from django.urls import path
from . import views

urlpatterns = [
    # Projects
    path("projects/", views.ProjectListView.as_view(), name="project-list"),
    path(
        "projects/<int:id>/", views.ProjectDetailView.as_view(), name="project-detail"
    ),
    # Blog
    path("blog/", views.BlogPostListView.as_view(), name="blog-list"),
    path("blog/<str:slug>/", views.BlogPostDetailView.as_view(), name="blog-detail"),
    # Contact
    path("contact/", views.ContactCreateView.as_view(), name="contact-create"),
    # Skills
    path("skills/", views.SkillListView.as_view(), name="skill-list"),
]
