from django.test import TestCase, Client


class GradeTest_views(TestCase):
    def test_grade_info(self):
        client = Client()
        response = client.get("/employees/info")
        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed(response, "employees.html")
