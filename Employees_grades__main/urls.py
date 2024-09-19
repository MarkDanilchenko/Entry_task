from django.urls import path, include
from django.views.generic import TemplateView
from . import views

employees_urls = [
    path("info/", views.employees_info, name="employees_info"),
    path("search/", views.employees_search, name="employees_search"),
    path("add/", views.employees_add, name="employees_add"),
    path("update/<int:id>/", views.employees_update, name="employees_update"),
    path("delete/<int:id>/", views.employees_delete, name="employees_delete"),
]

grades_urls = [
    path("info/", views.grades_info, name="grades_info"),
    path("search/", views.grades_search, name="grades_search"),
    path("add/", views.grades_add, name="grades_add"),
    path("update/<int:id>/", views.grades_update, name="grades_update"),
    path("delete/<int:id>/", views.grades_delete, name="grades_delete"),
]

urlpatterns = [
    path("", TemplateView.as_view(template_name="index.html")),
    path("employees/", include(employees_urls)),
    path("grades/", include(grades_urls)),
]
