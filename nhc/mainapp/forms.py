from django import forms
from django.forms import ModelForm
from .models import *
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User, Group
from decimal import Decimal


class UserForm(forms.Form):
    username = forms.CharField(widget=forms.TextInput(attrs={'class':'form-control','placeholder': 'Enter Username'}))
    password = forms.CharField(widget=forms.PasswordInput(attrs={'class':'form-control','placeholder': 'enter Password'}))
    group = forms.ModelChoiceField(queryset=Group.objects.all(), widget=forms.Select(attrs={'class':'form-control'}))




class CreateUserForm(UserCreationForm):
    class Meta:
        model = User
        fields = ['username','email','password1','password2']



class ApplicantForm(ModelForm):
    class Meta:
        model = Applicant
        fields=['surname','first_name','other_name','date_of_birth','nationality','passport_size','nida_birth','marital_status']

        widgets={
            'surname': forms.TextInput(attrs={'class':'form-control','placeholder':'Enter surname','required':'required'}),
            'first_name': forms.TextInput(attrs={'class':'form-control','placeholder':'Enter first name','required':'required'}),
            'other_name': forms.TextInput(attrs={'class':'form-control','placeholder':'Enter other names','required':'required'}),
            'date_of_birth':forms.DateInput(attrs={'class':'form-control','type':'date','required':'required'}),
            'nationality':forms.Select(attrs={'class':'form-control'}),
            'passport_size':forms.FileInput(attrs={'class':'form-control', 'required':'required'}),
            'nida_birth':forms.FileInput(attrs={'class':'form-control', 'required':'required'}),
            'marital_status':forms.Select(attrs={'class':'form-control'}),
        }


class ContactForm(forms.ModelForm):
    class Meta:
        model = Contact
        fields = ['address', 'home_phone_number', 'office_phone_number', 'your_phone_number', 'office_email', 'your_email']

        widgets = {
            'address': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter address', 'required': 'required'}),
            'home_phone_number': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter home phone number'}),
            'office_phone_number': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter office phone number'}),
            'your_phone_number': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter your phone number'}),
            'office_email': forms.EmailInput(attrs={'class': 'form-control', 'placeholder': 'Enter office email'}),
            'your_email': forms.EmailInput(attrs={'class': 'form-control', 'placeholder': 'Enter your email'}),
        }


class EmploymentForm(ModelForm):
    class Meta:
        model = Employment
        fields = ['occupation','employer','address','physical_address','phone_number','business_duration']

        widgets = {
            'occupation': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter occupation', 'required': 'required'}),
            'employer': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter employer name'}),
            'address': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter your address'}),
            'physical_address': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter your physical address', 'required': 'required'}),
            'phone_number': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter phone number'}),
            'business_duration': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter business duration'}),
        }

class FinancialInformationForm(ModelForm):
    class Meta:
        model = FinancialInformation
        fields = ['income_per_month', 'income_per_annum', 'salary', 'house_allowance', 'spouse_income', 'any_other_allowance', 'total_income', 'have_any_loan', 'amount_of_loan']

        widgets = {
            'income_per_month': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Enter income per month', 'required': 'required'}),
            'income_per_annum': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Enter income per annum'}),
            'salary': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Enter salary'}),
            'house_allowance': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Enter house allowance'}),
            'spouse_income': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Enter spouse income'}),
            'any_other_allowance': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Enter any other allowance'}),
            'total_income': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Enter total income', 'required': 'required'}),
            'have_any_loan': forms.CheckboxInput(attrs={'class': 'form-control'}),
            'amount_of_loan': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Enter amount of loan'}),
        }


class RefereeForm(ModelForm):
    class Meta:
        model = Referee
        fields = ['name', 'position', 'address', 'mobile', 'email']

        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter name'}),
            'position': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter position'}),
            'address': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter address'}),
            'mobile': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter mobile number'}),
            'email': forms.EmailInput(attrs={'class': 'form-control', 'placeholder': 'Enter email (optional)'}),
        }

class HouseForm(ModelForm):
    class Meta:
        model = House
        fields = ['project_name','house_location','house_type','number_of_rooms','house_price','mode_of_payment']

        widgets = {
            'project_name': forms.Select(attrs={'class': 'form-control', 'placeholder': 'select project name'}),
            'house_location': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter house location'}),
            'house_type': forms.Select(attrs={'class': 'form-control'}),
            'number_of_rooms': forms.NumberInput(attrs={'class': 'form-control'}),
            'house_price': forms.NumberInput(attrs={'class': 'form-control'}),
            'mode_of_payment': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter mode of payment'}),
        }  

class DeclarationForm(ModelForm):
    class Meta:
        model = Declaration

        fields=['signature'] 

        widgets = {
               'signature': forms.CheckboxInput(attrs={'class': 'form-control','rqeuired':'required'}),
        }


class DependantForm(ModelForm):
    class Meta:
        model = Dependant
        fields = ['full_name','relationship_to_applicant','gender','date_of_birth']
        widgets = {
            'full_name':forms.TextInput(attrs={'class': 'form-control','placeholder': 'Enter dependant full name'}),
            'relationship_to_applicant':forms.TextInput(attrs={'class': 'form-control','placeholder':'Enter relationship to applicant'}),
            'gender':forms.Select(attrs={'class': 'form-control'}),
            'date_of_birth':forms.DateInput(attrs={'class': 'form-control','type':'date','required':'required'}),
        }


class PaymentForm(ModelForm):
    class Meta:
        model = Payment

        fields=['payment_method','amount']

        widgets={
            'payment_method':forms.Select(attrs={'class':'form-control'}),
            'amount':forms.NumberInput(attrs={'class': 'form-control'}),
        }
    
    
    def clean_amount(self):
        amount = self.cleaned_data.get('amount')
        house_price = self.initial.get('house_price')
        
        if house_price is not None:
            house_price = Decimal(house_price)
            expected_amount = Decimal('0.1') * house_price
            if amount != expected_amount:
                raise forms.ValidationError("The entered amount must be 10% of the house price.")

        return amount
    


class ChangeStatusForm(ModelForm):
    class Meta:
        model = Applicant
        fields = ['status']  

        widgets = {
            'status': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Change status', 'required': 'required'}),
        }


class ProjectForm(ModelForm):
    class Meta:
        model = Project

        fields=['project_name']

        widgets={
            'project_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter project name', 'required': 'required'}),
        }