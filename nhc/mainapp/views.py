from django.shortcuts import render,redirect
from .models import *
from .forms import *
from django.contrib import messages
from decimal import Decimal
#authentication imports
from django.contrib.auth.models import Group
from django.contrib.auth.forms  import UserCreationForm
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from .decorators import unauthenticated_user,allowed_users,admin_only



#authentication functions
@unauthenticated_user
def login_user(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username,password=password)
        if user is not None:
            login(request, user)
            return redirect('home')
        else:
            messages.info(request,'username or password is incorrect') 

    return render(request,'pages/auth/login.html')


def logoutUser(request):
    logout(request)
    return redirect('login_user')



@unauthenticated_user
def register(request):
    form = CreateUserForm()
    if request.method == 'POST':
        form = CreateUserForm(request.POST)
        if form.is_valid():
           user = form.save()
           username = form.cleaned_data.get('username')
           group = Group.objects.get(name='client')
           user.groups.add(group)
           messages.success(request, 'Account was created for '+ username)
           return redirect('login_user')
    else:
        form = CreateUserForm()    
    return render(request,'pages/auth/register.html',{'form':form})


#endauthentication functions

#1
@login_required(login_url='login_user')
@admin_only
def home(request):
    project = Project.objects.all().count()
    clients = Applicant.objects.all().count()
    house = House.objects.all().count()
    context = {
        'project':project,
        'clients':clients,
        'house':house,
    }
    return render(request,'pages/client/dashboard.html',context)




def applicant_info(request):
    applica = Applicant.objects.filter(user_id=request.user.id)
    if request.method == 'POST':
        form = ApplicantForm(request.POST or None, request.FILES or None)
        if form.is_valid():
            add_app=form.save(commit=False)
            add_app.user=request.user
            add_app.save()
            messages.success(request,'Applicant particulars saved successfuly')
        else:
            messages.error(request,'Something went wrong')
        return redirect('applicant_info')
    else:
        form = ApplicantForm()
    context = {
        'applica':applica,
        'form':form,
    }
    return render(request,'pages/client/applicant_info.html',context)


def delete_applicant(request,id):
    applicant = Applicant.objects.get(id=id)

    if request.method == 'POST':
        applicant.delete()
        messages.success(request,'Data deleted successfully')
        return redirect('applicant_info')
    return render(request,'pages/client/confirm.html', {'applicant':applicant})


def edit_applicant(request,id):
    applicant = Applicant.objects.get(id=id)
    form = ApplicantForm(request.POST or None,request.FILES or None,instance=applicant)
    if form.is_valid():
        form.save()
        messages.success(request,'Applicant particulars updated successfully')
        return redirect('applicant_info')
    return render(request,'pages/client/edit_applicant_info.html',{'form':form})



#2
def contact_info(request):
    contact = Contact.objects.filter(user_id=request.user.id)
    
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            cont = form.save(commit=False)
            cont.user = request.user
            cont.save()
            messages.success(request, 'Contact information saved successfully.')
            return redirect('contact_info')
        else:
            messages.error(request, 'Failed to save contact information. Please check the provided data.')
    else:
        form = ContactForm()
    
    context = {
        'contact': contact,
        'form': form,
    }
    return render(request, 'pages/client/contact.html', context)


def delete_contact(request,id):
    applicant = Contact.objects.get(id=id)

    if request.method == 'POST':
        applicant.delete()
        messages.success(request,'Data deleted successfully')
        return redirect('contact_info')
    return render(request,'pages/client/delete_contact.html', {'applicant':applicant})


def edit_contact(request,id):
    contact = Contact.objects.get(id=id)
    form = ContactForm(request.POST or None,instance=contact)
    if form.is_valid():
        form.save()
        messages.success(request,'Contact updated successfully')
        return redirect('contact_info')
    return render(request,'pages/client/edit_contact.html',{'form':form})


#3
def employment_info(request):
    employee = Employment.objects.filter(user_id=request.user.id)
    
    if request.method == 'POST':
        form = EmploymentForm(request.POST)
        if form.is_valid():
            emp=form.save(commit=False)
            emp.user = request.user
            emp.save()
            messages.success(request, 'Employee information saved successfully.')
            return redirect('employment_info')
        else:
            messages.error(request, 'Failed to save employee information. Please check the provided data.')
    else:
        form = EmploymentForm()
    
    context = {
        'employee':employee,
        'form':form,
    }
    return render(request, 'pages/client/employment.html', context)


def edit_employment(request,id):
    employment = Employment.objects.get(id=id)
    form = EmploymentForm(request.POST or None,instance=employment)
    if form.is_valid():
        form.save()
        messages.success(request, 'Employee information updated successfully')
        return redirect('employment_info')
    return render(request, 'pages/client/edit_employment.html',{'form':form})

def delete_employment(request,id):
    employment = Employment.objects.get(id=id)

    if request.method == 'POST':
       employment.delete()
       messages.success(request,'Data deleted successfully')
       return redirect('employment_info')
    return render(request,'pages/client/delete_employment.html', {'employment':employment})


#4
def financial_info(request):
    finances = FinancialInformation.objects.filter(user_id=request.user.id)
    
    if request.method == 'POST':
        form = FinancialInformationForm(request.POST)
        if form.is_valid():
            fin=form.save(commit=False)
            fin.user = request.user
            fin.save()
            messages.success(request, 'Financial information saved successfully.')
            return redirect('financial_info')
        else:
            messages.error(request, 'Failed to save financial information. Please check the provided data.')
    else:
        form = FinancialInformationForm()
    
    context = {
        'finances': finances,
        'form': form,
    }
    return render(request, 'pages/client/income.html', context)



def edit_financial(request,id):
    income = FinancialInformation.objects.get(id=id)
    form = FinancialInformationForm(request.POST or None,instance=income)
    if form.is_valid():
        form.save()
        messages.success(request,'financial informations updated successfully')
        return redirect('financial_info')
    return render(request,'pages/client/edit_income.html',{'form':form})



def delete_financial(request,id):
    income = FinancialInformation.objects.get(id=id)

    if request.method == 'POST':
        income.delete()
        messages.success(request,'Financial information deleted successfully')
        return redirect('financial_info')
    return render(request,'pages/client/delete_income.html',{'income':income})


#5
def referee_info(request):
    referees = Referee.objects.filter(user_id=request.user.id)
    
    if request.method == 'POST':
        form = RefereeForm(request.POST)
        if form.is_valid():
            ref=form.save(commit=False)
            ref.user = request.user
            ref.save()
            messages.success(request, 'Referee information saved successfully.')
            return redirect('referee_info')
        else:
            messages.error(request, 'Failed to save referee information. Please check the provided data.')
    else:
        form = RefereeForm()
    
    context = {
        'referees': referees,
        'form': form,
    }
    return render(request, 'pages/client/referee.html', context)

def edit_referee(request,id):
    referee = Referee.objects.get(id=id)
    form = RefereeForm(request.POST or None,instance=referee)
    if form.is_valid():
        form.save()
        messages.success(request,'Referee informations updated successfully')
        return redirect('referee_info')
    return render(request,'pages/client/edit_referee.html',{'form':form})


def delete_referee(request,id):
    ref = Referee.objects.get(id=id)

    if request.method == 'POST':
        ref.delete()
        messages.success(request,'Referee information deleted successfully')
        return redirect('referee_info')
    return render(request,'pages/client/delete_referee.html',{'ref':ref})


#6
def house_info(request):
    house = House.objects.filter(user_id=request.user.id)
    if request.method == 'POST':
        form = HouseForm(request.POST or None)
        if form.is_valid():
            h=form.save(commit=False)
            h.user = request.user
            h.save()
            messages.success(request,'house details saved successfully')
        else:
            messages.error(request,'Something went wrong')
        return redirect('house_info')
    else:
        form = HouseForm()
    c = {
        'form':form,
        'house':house,
    }
    return render(request,'pages/client/house.html', c)


def edit_house_info(request,id):
    house = House.objects.get(id=id)
    form = HouseForm(request.POST or None,instance=house)
    if form.is_valid():
        form.save()
        messages.success(request,'House informations updated successfully')
        return redirect('house_info')
    return render(request,'pages/client/edit_house.html',{'form':form})


def delete_house(request,id):
    house = House.objects.get(id=id)
    if request.method == 'POST':
        house.delete()
        messages.success(request,'House deleted successfully')
        return redirect('house_info')
    return render(request,'pages/client/delete_house.html',{'house':house})

#7
@login_required(login_url='login_user')
@admin_only
def declaration_info(request):
    signed = Declaration.objects.filter(signature=True).exists()
    sign = Declaration.objects.filter(user_id=request.user.id)
    if request.method == 'POST':
        form = DeclarationForm(request.POST or None)
        if form.is_valid():
            s=form.save(commit=False)
            s.user = request.user
            s.save()      
            messages.success(request,'Signature submitted successfully')
        else:
            messages.error(request,'something went wrong')
        return redirect('declaration_info')
    else:
        form = DeclarationForm() 
    return render(request,'pages/client/declaration.html',{'form':form,'signed':signed,'sign':sign})

#8
def dependant_details(request):
    dependant = Dependant.objects.filter(user_id=request.user.id)
    if request.method == 'POST':
        form = DependantForm(request.POST or None)
        if form.is_valid():
            dep=form.save(commit=False)
            dep.user=request.user
            dep.save()
            messages.success(request,'Dependant details saved successfully')
        else:
            messages.error(request,'Something went wrong')
        return redirect('dependant_details')
    else:
        form = DependantForm()
    context = {
        'form':form,
        'dependant':dependant
    }
    return render(request,'pages/client/dependant.html',context)


def delete_dependant(request,id):
    dependant= Dependant.objects.get(id=id)
    if request.method == 'POST':
       dependant.delete()
       messages.success(request,'dependant deleted successfully')
       return redirect('dependant_details')
    return render(request,'pages/client/delete_dependant.html',{'dependant':dependant})


def edit_dependant(request,id):
    dependant = Dependant.objects.get(id=id)
    form = DependantForm(request.POST or None,instance=dependant)
    if form.is_valid():
        form.save()
        messages.success(request,'House informations updated successfully')
        return redirect('dependant_details')
    return render(request,'pages/client/edit_dependant.html',{'form':form})


def preview_info(request):
    applica = Applicant.objects.filter(user_id=request.user.id)
    contact = Contact.objects.filter(user_id=request.user.id)
    employee = Employment.objects.filter(user_id=request.user.id)
    finances = FinancialInformation.objects.filter(user_id=request.user.id)
    referees = Referee.objects.filter(user_id=request.user.id)
    house = House.objects.filter(user_id=request.user.id)
    declaration = Declaration.objects.filter(user_id=request.user.id)
    dependant = Dependant.objects.filter(user_id=request.user.id)
    declaration = Declaration.objects.filter(user_id=request.user.id)
    payment = Payment.objects.filter(user_id=request.user.id)


    context = {
        'applica':applica,
        'contact':contact,
        'employee':employee,
        'finances':finances,
        'referees':referees,
        'house':house,
        'declaration':declaration,
        'dependant':dependant,
        'declaration':declaration,
        'payment':payment,
    }
    return render(request,'pages/client/preview.html',context)



def payment_details(request):
    payment = Payment.objects.filter(user_id=request.user.id)
    house_price = Decimal(0)
    payment_amount = Decimal(0)
    
    # Get the house price for the user
    if request.user.is_authenticated:
        house = House.objects.filter(user_id=request.user.id).first()
        if house:
            house_price = house.house_price
            if house_price is not None:
                # Calculate 10% of the house price
                payment_amount = Decimal('0.10') * house_price
    
    if request.method == 'POST':
        form = PaymentForm(request.POST, initial={'house_price': house_price})
        if form.is_valid():
            # Save payment details
            pay = form.save(commit=False)
            pay.user = request.user
            pay.amount = payment_amount
            pay.save()
            messages.success(request, 'Payment submitted successfully')
            return redirect('payment_details')
        else:
            messages.error(request, 'Something went wrong')
    else:
        form = PaymentForm(initial={'house_price': house_price})
    
    context = {
        'form': form,
        'payment': payment,
        'house_price': house_price,
        'payment_amount': payment_amount,
    }
    return render(request, 'pages/client/payment.html', context)