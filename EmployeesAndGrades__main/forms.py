from django.contrib.auth.forms import UserCreationForm
from . import models
from django import forms


class UserForm(UserCreationForm):
    email = forms.EmailField(
        max_length=255,
        label="Email",
        help_text="Email address",
    )
    phone = forms.CharField(
        max_length=15,
        required=False,
        label="Phone number",
        help_text="Phone format: _(___)___-__-__",
    )

    class Meta:
        model = models.User
        fields = (
            "username",
            "first_name",
            "last_name",
            "email",
            "password1",
            "password2",
            "phone",
        )


class GradeForm(forms.ModelForm):
    title = forms.CharField(
        max_length=50,
        help_text="Grade title",
        label="Grade",
    )

    class Meta:
        model = models.Grade
        fields = ("title",)


class EmployeeForm(forms.ModelForm):
    first_name = forms.CharField(
        max_length=50,
        help_text="First name",
        label="First name",
    )
    last_name = forms.CharField(
        max_length=50,
        help_text="Last name",
        label="Last name",
    )
    second_name = forms.CharField(
        max_length=50,
        help_text="Second name",
        label="Second name",
    )
    grade = forms.ModelChoiceField(
        queryset=models.Grade.objects.all(),
        required=False,
        help_text="Grade",
        label="Grade",
    )
    date_of_employment = forms.DateField(
        widget=forms.DateInput(attrs={"class": "form-control", "type": "date"}),
        help_text="Date of employment",
        label="Date of employment",
    )

    class Meta:
        model = models.Employee
        fields = (
            "first_name",
            "last_name",
            "second_name",
            "grade",
            "date_of_employment",
        )
