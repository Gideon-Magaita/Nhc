# Generated by Django 5.0.3 on 2024-03-21 21:04

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mainapp', '0004_alter_applicant_nationality_alter_applicant_status'),
    ]

    operations = [
        migrations.CreateModel(
            name='Contact',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('address', models.CharField(max_length=255)),
                ('home_phone_number', models.CharField(max_length=12, validators=[django.core.validators.RegexValidator(message="Phone number must start with '+255' followed by 9 digits.", regex='^\\+255\\d{9}$')])),
                ('office_phone_number', models.CharField(max_length=12, validators=[django.core.validators.RegexValidator(message="Phone number must start with '+255' followed by 9 digits.", regex='^\\+255\\d{9}$')])),
                ('your_phone_number', models.CharField(max_length=12, validators=[django.core.validators.RegexValidator(message="Phone number must start with '+255' followed by 9 digits.", regex='^\\+255\\d{9}$')])),
                ('office_email', models.EmailField(blank=True, max_length=255, null=True)),
                ('your_email', models.EmailField(blank=True, max_length=255, null=True)),
            ],
        ),
        migrations.AlterField(
            model_name='applicant',
            name='status',
            field=models.CharField(choices=[('rejected', 'rejected'), ('pending', 'pending'), ('accepted', 'accepted')], default='pending', max_length=50),
        ),
    ]
