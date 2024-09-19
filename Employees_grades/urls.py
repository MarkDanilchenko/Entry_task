from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from Employees_grades__main import views

urlpatterns = [
    path("admin/", admin.site.urls),
    path("", include("Employees_grades__main.urls")),
    path("accounts/", include("django.contrib.auth.urls")),
    path("accounts/signup", views.signUp, name="signup"),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
