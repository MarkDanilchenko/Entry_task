from django.contrib import admin
from . import models


class GradeAdmin(admin.ModelAdmin):
    fieldsets = (("Grade", {"fields": ("title",)}),)

    list_display = ("title",)
    search_fields = ("title",)
    list_filter = ("title",)


admin.site.register(models.Grade, GradeAdmin)


class EmployeeAdmin(admin.ModelAdmin):
    fieldsets = (
        ("Employee name", {"fields": ("first_name", "last_name", "second_name")}),
        ("Employee status", {"fields": ("grade", "date_of_employment")}),
    )

    list_display = (
        "first_name",
        "last_name",
        "second_name",
        "grade",
        "date_of_employment",
    )
    search_fields = (
        "first_name",
        "last_name",
        "second_name",
        "grade",
        "date_of_employment",
    )
    list_filter = ("last_name", "grade", "date_of_employment")


admin.site.register(models.Employee, EmployeeAdmin)
