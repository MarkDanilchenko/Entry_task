from django.test import TestCase

from Entry_task__main import forms


class GradeTest_form(TestCase):
    def test_grade_help_text(self):
        form = forms.GradeForm()
        self.assertEqual(form.fields["title"].help_text, "Grade title")

    def test_grade_length(self):
        form = forms.GradeForm()
        self.assertTrue(len(form.fields["title"].max_length) <= 50)
