from . import models
from django import forms


class GradeForm(forms.ModelForm):
    title = forms.CharField(
        max_length=50,
        help_text="Grade title",
        label="Grade",
        widget=forms.TextInput(attrs={"class": "form-control"}),
        required=True,
    )

    class Meta:
        model = models.Grade
        fields = ("title",)
