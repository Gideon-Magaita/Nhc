from django.shortcuts import render,redirect
from .models import *
from .forms import *
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from .decorators import unauthenticated_user,allowed_users,admin_only



@login_required(login_url='login_user')
@allowed_users(allowed_roles=['officer'])
def home_page(request):
    application = Applicant.objects.all().count()
    projects = Project.objects.all().count()
    house = House.objects.all().count()
    context={
        'application':application,
        'projects':projects,
        'house':house,
    }
    return render(request,'pages/officers/home.html',context)


@login_required(login_url='login_user')
@allowed_users(allowed_roles=['officer'])
def applicant_details(request):
    # Retrieve data from all models
    applicants = Applicant.objects.all()
    contacts = Contact.objects.all()
    employments = Employment.objects.all()
    financial_infos = FinancialInformation.objects.all()
    referees = Referee.objects.all()
    payments = Payment.objects.all()
    houses = House.objects.all()
    declaration = Declaration.objects.all()
    # Pass the data to the template for rendering
    return render(request, 'pages/officers/applicant_details.html', {
        'applicants': applicants,
        'contacts': contacts,
        'employments': employments,
        'financial_infos': financial_infos,
        'referees': referees,
        'payments': payments,
        'houses':houses,
        'declaration': declaration,
    })



@login_required(login_url='login_user')
@allowed_users(allowed_roles=['officer'])
def edit_status(request,id):
    applicant = Applicant.objects.get(id=id)
    form = ChangeStatusForm(request.POST or None,instance=applicant)
    if form.is_valid():
        form.save()
        messages.success(request,'status updated')
        return redirect('applicant_details')
    return render(request, 'pages/officers/edit_applicant_details.html',{'form':form})