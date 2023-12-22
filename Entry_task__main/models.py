from django.contrib.auth.models import AbstractUser
from django.db import models
from datetime import datetime
import regex, re
from django.core.exceptions import ValidationError


# VALIDATORS
def employeeName_validator(value):
    if regex.search(r"\P{Letter}", value, regex.UNICODE) and value != "-":
        raise ValidationError("Name must contain only letters!")
    return value


def date_of_employment_validator(value):
    if value > datetime.now().date():
        raise ValidationError("Date of employment can't be in the future!")
    return value


# phone validation for model: User
def validate_phone(value):
    if re.search(r"\d{1}\(\d{3}\)\d{3}-\d{2}-\d{2}", value) is None:
        raise ValidationError(
            "Phone number must contain only 11 digits in format _(___)___-__-__"
        )
    else:
        return f"+{value}"


class User(AbstractUser):
    phone = models.CharField(
        max_length=15,
        unique=True,
        blank=True,
        null=True,
        validators=[validate_phone],
        verbose_name="Phone number",
        help_text="Phone number must contain only 11 digits in format _(___)___-__-__",
    )

    def __str__(self):
        return f"{self.username}, email: ({self.email})"


class Grade(models.Model):
    # choices = (
    #     ("Trainee", "Trainee"),
    #     ("Junior", "Junior"),
    #     ("Middle", "Middle"),
    #     ("Senior", "Senior"),
    #     ("Teamlead", "Teamlead"),
    #     ("Director", "Director"),
    # )

    title = models.CharField(
        max_length=50,
        unique=True,
        verbose_name="Grade",
        help_text="Grade title",
        blank=False,
        null=False,
    )

    def __str__(self):
        return self.title

    class Meta:
        verbose_name_plural = "Grades"
        ordering = ["title"]


class Employee(models.Model):
    first_name = models.CharField(
        max_length=50,
        verbose_name="First name",
        help_text="First name",
        blank=False,
        null=False,
        validators=[employeeName_validator],
    )

    last_name = models.CharField(
        max_length=50,
        verbose_name="Last name",
        help_text="Last name",
        blank=False,
        null=False,
        validators=[employeeName_validator],
    )

    second_name = models.CharField(
        max_length=50,
        verbose_name="Second name",
        help_text="Second name",
        default="-",
        blank=True,
        null=True,
        validators=[employeeName_validator],
    )

    grade = models.ForeignKey(
        "Grade",
        on_delete=models.SET_NULL,
        verbose_name="Grade",
        help_text="Grade",
        blank=False,
        null=True,
    )

    date_of_employment = models.DateField(
        verbose_name="Date of employment",
        help_text="Date of employment",
        blank=False,
        null=False,
        default=datetime.today,
        validators=[date_of_employment_validator],
    )

    def __str__(self):
        return f"Employee: {self.first_name} {self.last_name}; Grade: {self.grade}"

    class Meta:
        verbose_name_plural = "Employees"
        ordering = ["last_name", "first_name"]
