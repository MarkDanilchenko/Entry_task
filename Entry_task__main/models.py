from django.db import models


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
