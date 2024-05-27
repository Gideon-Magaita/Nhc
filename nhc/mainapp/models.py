from django.db import models
from django.core.validators import RegexValidator
from django.utils import timezone
from django.contrib.auth.models import User
import random

# Create your models here.
class Nationality(models.Model):
    country_name = models.CharField(max_length=200)

    def __str__(self):
        return self.country_name

MaritalStatus=(
    ('Single','Single'),
    ('Married','Married'),
    ('Widow','Widow'),
    ('Divorced','Divorced'),
)


class Applicant(models.Model):
    user = models.ForeignKey(User,null=True,blank=True, on_delete=models.CASCADE)
    surname = models.CharField(max_length=200, blank=True,null=True)
    first_name = models.CharField(max_length=200,blank=True,null=True)
    other_name = models.CharField(max_length=200)
    date_of_birth = models.DateField()
    nationality = models.ForeignKey(Nationality,on_delete=models.CASCADE,null=True, blank=True)
    passport_size = models.ImageField(blank=True,upload_to="pictures/")
    nida_birth = models.FileField(blank=True,upload_to="pictures/")
    marital_status = models.CharField(max_length=50, choices=MaritalStatus)
    status = models.CharField(max_length=200,default="pending")

    def __str__(self):
        return self.surname + " " + self.first_name
    #function to handle the default value on foreign key column(nationality)
    def save(self, *args, **kwargs):
        if not self.nationality:
            default_name, _ = Nationality.objects.get_or_create(country_name="Tanzania")
            self.nationality = default_name
        super().save(*args, **kwargs)



class Contact(models.Model):
    user = models.ForeignKey(User,null=True,blank=True, on_delete=models.CASCADE)
    address = models.CharField(max_length=255)
    home_phone_number = models.CharField(
        max_length=13,
        validators=[
            RegexValidator(
                regex=r'^\+255\d{9}$',
                message="Phone number must start with '+255' followed by 9 digits."
            )
        ]
    )
    office_phone_number = models.CharField(
        max_length=13,
        validators=[
            RegexValidator(
                regex=r'^\+255\d{9}$',
                message="Phone number must start with '+255' followed by 9 digits."
            )
        ]
    )
    your_phone_number = models.CharField(
        max_length=13,
        validators=[
            RegexValidator(
                regex=r'^\+255\d{9}$',
                message="Phone number must start with '+255' followed by 9 digits."
            )
        ]
    )
    office_email = models.EmailField(max_length=255, blank=True, null=True)
    your_email = models.EmailField(max_length=255, blank=True, null=True)

    def __str__(self):
        return self.address


class Employment(models.Model):
    user = models.ForeignKey(User,null=True,blank=True, on_delete=models.CASCADE)
    occupation = models.CharField(max_length=255, blank=True, null=True)
    employer = models.CharField(max_length=255, blank=True, null=True)
    address = models.CharField(max_length=255, blank=True, null=True)
    physical_address = models.CharField(max_length=255)
    phone_number = models.CharField(
        max_length=13,
        validators=[
            RegexValidator(
                regex=r'^\+255\d{9}$',
                message="Phone number must start with '+255' followed by 9 digits."
            )
        ]
    )
    business_duration = models.CharField(max_length=200,blank=True,null=True)

    def __str__(self):
        return self.occupation

class FinancialInformation(models.Model):
    user = models.ForeignKey(User,null=True,blank=True, on_delete=models.CASCADE)
    income_per_month = models.DecimalField(max_digits=10, decimal_places=2)
    income_per_annum = models.DecimalField(max_digits=12, decimal_places=2)
    salary = models.DecimalField(max_digits=10, decimal_places=2)
    house_allowance = models.DecimalField(max_digits=10, decimal_places=2)
    spouse_income = models.DecimalField(max_digits=10, decimal_places=2)
    any_other_allowance = models.DecimalField(max_digits=10, decimal_places=2)
    total_income = models.DecimalField(max_digits=12, decimal_places=2)
    have_any_loan = models.BooleanField(default=False)
    amount_of_loan = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)

    def __str__(self):
        return f"Income per month: {self.income_per_month}, Salary: {self.salary}, Total Income: {self.total_income}"
    
class Referee(models.Model):
    user = models.ForeignKey(User,null=True,blank=True, on_delete=models.CASCADE)
    name = models.CharField(max_length=200)
    position = models.CharField(max_length=200)
    address = models.CharField(max_length=50)
    mobile = models.CharField(
        max_length=13,
        validators=[
            RegexValidator(
                regex=r'^\+255\d{9}$',
                message="Phone number must start with '+255' followed by 9 digits."
            )
        ]
    )
    email = models.EmailField(max_length=255, blank=True, null=True)

    def __str__(self):
        self.name


class Project(models.Model):
    project_name = models.CharField(max_length=100)
    project_code = models.CharField(max_length=100, unique=True,blank=True,null=True)
    date = models.DateField(default=timezone.now)

    def save(self, *args, **kwargs):
        if not self.pk:  # If the object is being created
            current_year = timezone.now().year
            random_number = '{:02}'.format(random.randint(1, 99))  # Random number with leading zeros if necessary
            self.project_code = f'NHC-{current_year}-{self.project_name}-{random_number}'
            while Project.objects.filter(project_code=self.project_code).exists():
                random_number = '{:02}'.format(random.randint(1, 99))
                self.project_code = f'NHC-{current_year}-{self.project_name}-{random_number}'
        super().save(*args, **kwargs)

    def __str__(self):
        return self.project_name


HOUSE_TYPE=(
  ('apartment','apartment'),
  ('bungalow','bungalow'),
  ('ghorofa','ghorofa'),
  ('ya kawaida','ya kawaida'),
)

class House(models.Model):
    user = models.ForeignKey(User,null=True,blank=True, on_delete=models.CASCADE)
    project_name = models.ForeignKey(Project,on_delete=models.CASCADE)
    house_location = models.CharField(max_length=200)
    house_type = models.CharField(max_length=200,choices=HOUSE_TYPE)
    number_of_rooms = models.IntegerField()
    house_price = models.DecimalField(max_digits=10,decimal_places=2)
    mode_of_payment = models.CharField(max_length=200)

    def __str__(self):
        return self.house_location


class Declaration(models.Model):
    user = models.ForeignKey(User,null=True,blank=True, on_delete=models.CASCADE)
    signature = models.BooleanField(default=False)


GENDER = (
    ('male','male'),
    ('female','female'),
)

class Dependant(models.Model):
    user = models.ForeignKey(User,null=True,blank=True, on_delete=models.CASCADE)
    full_name = models.CharField(max_length=200)
    relationship_to_applicant = models.CharField(max_length=200)
    gender = models.CharField(max_length=200,choices=GENDER)
    date_of_birth = models.DateField()

    def __str__(self):
        return self.full_name


class Payment(models.Model):
    PAYMENT_CHOICES = (
        ('credit_card', 'Credit Card'),
        ('paypal', 'PayPal'),
        ('bank_transfer', 'Bank Transfer'),
    )
    user = models.ForeignKey(User,null=True,blank=True, on_delete=models.CASCADE)
    payment_method = models.CharField(max_length=200,choices=PAYMENT_CHOICES)
    amount = models.DecimalField(max_digits=10, decimal_places=2)

    def __str__(self):
        return self.payment_method