from django.contrib.auth.models import AbstractUser
from django.db import models
from datetime import datetime
import regex, re
from django.core.exceptions import ValidationError


def employeeName_validator(value):
    if regex.search(r"\P{Letter}", value, regex.UNICODE) and value != "-":
        raise ValidationError("Name must contain only letters!")
    return value


def date_of_employment_validator(value):
    if value > datetime.now().date():
        raise ValidationError("Invalid date!")
    return value


def validate_phone(value):
    if re.search(r"\d{1}\(\d{3}\)\d{3}-\d{2}-\d{2}", value) is None:
        raise ValidationError("Phone format: _(___)___-__-__")
    else:
        return f"+{value}"


class User(AbstractUser):
    phone = models.CharField(
        max_length=15,
        unique=False,
        blank=True,
        null=True,
        validators=[validate_phone],
        verbose_name="Phone number",
        help_text="Phone format: _(___)___-__-__",
    )

    def __str__(self):
        return self.username

    class Meta:
        verbose_name_plural = "Users"
        ordering = ["username"]


class Grade(models.Model):
    title = models.CharField(
        max_length=50,
        unique=True,
        blank=False,
        null=False,
        verbose_name="Grade",
        help_text="Grade title",
    )

    def __str__(self):
        return self.title

    class Meta:
        verbose_name_plural = "Grades"
        ordering = ["title"]


class Employee(models.Model):
    first_name = models.CharField(
        max_length=50,
        blank=False,
        null=False,
        verbose_name="First name",
        help_text="First name",
        validators=[employeeName_validator],
    )
    last_name = models.CharField(
        max_length=50,
        blank=False,
        null=False,
        verbose_name="Last name",
        help_text="Last name",
        validators=[employeeName_validator],
    )
    second_name = models.CharField(
        max_length=50,
        blank=False,
        null=False,
        verbose_name="Second name",
        help_text="Second name",
        validators=[employeeName_validator],
    )
    grade = models.ForeignKey(
        "Grade",
        on_delete=models.SET_NULL,
        blank=False,
        null=True,
        verbose_name="Grade",
        help_text="Grade",
    )
    date_of_employment = models.DateField(
        blank=False,
        null=False,
        verbose_name="Date of employment",
        help_text="Date of employment",
        default=datetime.today,
        validators=[date_of_employment_validator],
    )

    def __str__(self):
        return f"{self.first_name} {self.last_name}"

    class Meta:
        verbose_name_plural = "Employees"
        ordering = ["date_of_employment"]
