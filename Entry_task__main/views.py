from django.shortcuts import render, redirect
from . import models, forms
from fuzzywuzzy import fuzz, process


def employees_info(request):
    pass


def grades_info(request):
    result = models.Grade.objects.all()
    return render(request, "grades.html", {"result": result})


def grades_search(request):
    try:
        searchGrade = request.POST.get("searchGrade")
        if len(searchGrade) == 0:
            raise Exception
        else:
            result = models.Grade.objects.values_list()
            for i in result:
                for j in list(i):
                    if fuzz.partial_ratio(searchGrade, str(j)) > 60:
                        break
                else:
                    result = result.exclude(id=i[0])
            else:
                if len(result) == 0:
                    return render(
                        request, "grades.html", {"notResultSearch": "Not found"}
                    )
                return render(request, "grades.html", {"result": result.values()})

    except:
        result = models.Grade.objects.all()
        return render(request, "grades.html", {"result": result})


def grades_delete(request, id):
    try:
        if models.Grade.objects.filter(id=id).exists():
            models.Grade.objects.filter(id=id).delete()
            result = models.Grade.objects.all()
            return render(request, "grades.html", {"result": result})
    except:
        result = models.Grade.objects.all()
        return render(request, "grades.html", {"result": result})


def grades_add(request):
    if request.method == "POST":
        form = forms.GradeForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect("/grades/info")
    else:
        form = forms.GradeForm()
    return render(request, "grades_add.html", {"form": form})


def grades_update(request, id):
    try:
        result = models.Grade.objects.get(id=id)
        form = forms.GradeForm(instance=result)
        if request.method == "POST":
            form = forms.GradeForm(request.POST, instance=result)
            if form.is_valid():
                form.save()
                return redirect("/grades/info")
        return render(request, "grades_update.html", {"form": form})
    except:
        result = models.Grade.objects.all()
        return render(request, "grades.html", {"result": result})
