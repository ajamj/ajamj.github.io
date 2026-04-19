from django.db import models


class Project(models.Model):
    title = models.CharField(max_length=200)
    description = models.TextField()
    tech_stack = models.JSONField(default=list)
    image = models.URLField(blank=True)
    link = models.URLField(blank=True)
    date = models.DateField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title

    class Meta:
        ordering = ["-date"]
        indexes = [
            models.Index(fields=["-date"]),
        ]


class BlogPost(models.Model):
    title = models.CharField(max_length=200)
    slug = models.SlugField(unique=True)
    content = models.TextField()
    excerpt = models.TextField(blank=True)
    published = models.BooleanField(default=False, db_index=True)
    date = models.DateField()
    tags = models.JSONField(default=list)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title

    class Meta:
        ordering = ["-date"]
        indexes = [
            models.Index(fields=["-date"]),
            models.Index(fields=["published"]),
            models.Index(fields=["slug"]),
        ]


class Contact(models.Model):
    name = models.CharField(max_length=100)
    email = models.EmailField()
    message = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    read = models.BooleanField(default=False, db_index=True)

    def __str__(self):
        return f"{self.name} - {self.email}"

    class Meta:
        ordering = ["-created_at"]
        indexes = [
            models.Index(fields=["-created_at"]),
            models.Index(fields=["read"]),
        ]


class Skill(models.Model):
    CATEGORY_CHOICES = [
        ("programming", "Programming"),
        ("seismology", "Seismology"),
        ("data_analysis", "Data Analysis"),
        ("tools", "Tools & Software"),
    ]
    name = models.CharField(max_length=100)
    category = models.CharField(max_length=20, choices=CATEGORY_CHOICES)
    proficiency = models.IntegerField(default=50)

    def __str__(self):
        return self.name

    class Meta:
        ordering = ["category", "name"]
