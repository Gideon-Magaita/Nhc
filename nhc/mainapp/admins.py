from django.shortcuts import render,redirect
from .forms import *
from .models import *
from django.contrib import messages
from django.http import HttpResponse
#authentication imports
from django.contrib.auth.models import Group
from django.contrib.auth.forms  import UserCreationForm
from django.contrib.auth.decorators import login_required
from .decorators import unauthenticated_user,allowed_users,admin_only




@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admins'])
def admin_home(request):
    project = Project.objects.all().count()
    users = User.objects.all().count()
    context={
        'project': project,
        'users': users,
    }
    return render(request,'pages/admins/home.html',context)


@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admins'])
def users(request):
    users = User.objects.all()
    if request.method == 'POST':
        form = UserForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']
            group = form.cleaned_data['group']

            if User.objects.filter(username=username).exists():
                messages.error(request, 'Username already exists.')
            else:
                user = User.objects.create_user(username=username, password=password)
                group.user_set.add(user)
                messages.success(request, 'User added successfully.')

            return redirect('users')
    else:
        form = UserForm()
    
    return render(request, 'pages/admins/users.html', {'form': form,'users':users})



@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admins'])
def delete_user(request,id):
    futa_user = User.objects.get(id=id)
    if request.method == 'POST':
           futa_user.delete()
           messages.success(request,'user deleted')
           return redirect('users')
    return render(request,'pages/admins/confirm-delete.html', {'futa_user':futa_user})




@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admins'])
def add_project(request):
    project = Project.objects.all()
    if request.method == 'POST':
        form = ProjectForm(request.POST or None)
        if form.is_valid():
            form.save()
            messages.success(request,'project added successfully')
            return redirect('add_project')
        else:
            messages.info(request,'something went wrong')
            return redirect('add_project')
    else:
        form = ProjectForm()
    context={
        'form': form,
        'project': project,
    }
    return render(request, 'pages/admins/projects.html',context)




@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admins'])
def edit_project(request,id):
    project = Project.objects.get(id=id)
    form = ProjectForm(request.POST or None,instance=project)
    if form.is_valid():
        form.save()
        messages.success(request,'Project updated successfully')
        return redirect('add_project')
    return render(request,'pages/admins/edit-project.html',{'form':form})




@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admins'])
def add_house(request):
    house = House.objects.all()
    if request.method == 'POST':
        form = HouseForm(request.POST or None)
        if form.is_valid():
            form.save()
            messages.success(request,'house added successfully')
            return redirect('add_house')
        else:
            messages.info(request,'something went wrong')
            return redirect('add_house')
    else:
        form = HouseForm()
    context={
        'form': form,
        'house': house,
    }
    return render(request, 'pages/admins/houses.html',context)




@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admins'])
def edit_house(request,id):
    house = Project.objects.get(id=id)
    form = ProjectForm(request.POST or None,instance=house)
    if form.is_valid():
        form.save()
        messages.success(request,'House updated successfully')
        return redirect('add_house')
    return render(request,'pages/admins/edit-house.html',{'form':form})