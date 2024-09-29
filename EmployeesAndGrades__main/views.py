from django.contrib.auth import authenticate, login
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
from . import models, forms
from fuzzywuzzy import fuzz


def signUp(request):
    if request.method == "POST":
        form = forms.UserForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get("username")
            password = form.cleaned_data.get("password1")
            userSignIn = authenticate(username=username, password=password)
            login(request, userSignIn)
            return redirect("/")
    else:
        form = forms.UserForm()
    return render(request, "registration/signup.html", {"form": form})


@login_required
def employees_info(request):
    result = models.Employee.objects.all()
    return render(request, "employees.html", {"result": result})


@login_required
def employees_search(request):
    try:
        searchEmployee = request.POST.get("searchEmployee")
        if len(searchEmployee) == 0:
            raise Exception
        else:
            result = models.Employee.objects.all()
            for i in result:
                if (
                    (fuzz.partial_ratio(searchEmployee, str(i.first_name)) > 60)
                    or (fuzz.partial_ratio(searchEmployee, str(i.last_name)) > 60)
                    or (fuzz.partial_ratio(searchEmployee, str(i.second_name)) > 60)
                    or (fuzz.partial_ratio(searchEmployee, str(i.grade.title)) > 60)
                    or (
                        fuzz.partial_ratio(searchEmployee, str(i.date_of_employment))
                        > 60
                    )
                ):
                    continue
                else:
                    result = result.exclude(id=i.pk)
            else:
                if len(result) == 0:
                    return render(
                        request, "employees.html", {"notResultSearch": "Not found"}
                    )
                return render(request, "employees.html", {"result": result})
    except:
        result = models.Employee.objects.all()
        return render(request, "employees.html", {"result": result})


@login_required
def employees_delete(request, id):
    try:
        if models.Employee.objects.filter(id=id).exists():
            models.Employee.objects.filter(id=id).delete()
            result = models.Employee.objects.all()
            return render(request, "employees.html", {"result": result})
        raise Exception
    except:
        result = models.Employee.objects.all()
        return render(request, "employees.html", {"result": result})


@login_required
def employees_add(request):
    if request.method == "POST":
        form = forms.EmployeeForm(request.POST)
        if form.is_valid():
            form.save()
            result = models.Employee.objects.all()
            return render(request, "employees.html", {"result": result})
    else:
        form = forms.EmployeeForm()
    return render(request, "employees_add.html", {"form": form})


@login_required
def employees_update(request, id):
    try:
        result = models.Employee.objects.get(id=id)
        form = forms.EmployeeForm(instance=result)
        if request.method == "POST":
            form = forms.EmployeeForm(request.POST, instance=result)
            if form.is_valid():
                form.save()
                result = models.Employee.objects.all()
                return render(request, "employees.html", {"result": result})
        return render(request, "employees_update.html", {"form": form})
    except:
        result = models.Employee.objects.all()
        return render(request, "employees.html", {"result": result})


@login_required
def grades_info(request):
    result = models.Grade.objects.all()
    return render(request, "grades.html", {"result": result})


@login_required
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


@login_required
def grades_delete(request, id):
    try:
        if models.Grade.objects.filter(id=id).exists():
            models.Grade.objects.filter(id=id).delete()
            result = models.Grade.objects.all()
            return render(request, "grades.html", {"result": result})
        raise Exception
    except:
        result = models.Grade.objects.all()
        return render(request, "grades.html", {"result": result})


@login_required
def grades_add(request):
    if request.method == "POST":
        form = forms.GradeForm(request.POST)
        if form.is_valid():
            form.save()
            result = models.Grade.objects.all()
            return render(request, "grades.html", {"result": result})
    else:
        form = forms.GradeForm()
    return render(request, "grades_add.html", {"form": form})


@login_required
def grades_update(request, id):
    try:
        result = models.Grade.objects.get(id=id)
        form = forms.GradeForm(instance=result)
        if request.method == "POST":
            form = forms.GradeForm(request.POST, instance=result)
            if form.is_valid():
                form.save()
                result = models.Grade.objects.all()
                return render(request, "grades.html", {"result": result})
        return render(request, "grades_update.html", {"form": form})
    except:
        result = models.Grade.objects.all()
        return render(request, "grades.html", {"result": result})
