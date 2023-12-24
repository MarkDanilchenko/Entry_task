from django.test import TestCase

from Entry_task__main import models


class GradeTest_model(TestCase):
    def setUp(self) -> None:
        models.Grade.objects.create(title="TestGrade")

    def test_grade_creation(self):
        grade = models.Grade.objects.get(title="TestGrade")
        self.assertEqual(grade.title, "TestGrade")

    def test_grade_length(self):
        grade = models.Grade.objects.get(title="TestGrade")
        self.assertTrue(len(grade.title) <= 50)

    def tearDown(self) -> None:
        models.Grade.objects.filter(title="TestGrade").delete()
