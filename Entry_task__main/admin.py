from django.contrib import admin
from . import models


class GradeAdmin(admin.ModelAdmin):
    fieldsets = (
        ("Grade", {"fields": ("title",)}),
    )

    list_display = ("title",)
    search_fields = ("title",)
    list_filter = ("title",)


admin.site.register(models.Grade, GradeAdmin)
