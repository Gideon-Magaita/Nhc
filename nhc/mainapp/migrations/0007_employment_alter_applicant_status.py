# Generated by Django 4.1.7 on 2024-03-22 07:35

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mainapp', '0006_alter_applicant_status_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='Employment',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('occupation', models.CharField(blank=True, max_length=255, null=True)),
                ('business', models.CharField(blank=True, max_length=255, null=True)),
                ('address', models.CharField(blank=True, max_length=255, null=True)),
                ('physical_address', models.CharField(max_length=255)),
                ('phone_number', models.CharField(max_length=13, validators=[django.core.validators.RegexValidator(message="Phone number must start with '+255' followed by 9 digits.", regex='^\\+255\\d{9}$')])),
                ('business_duration', models.CharField(blank=True, max_length=200, null=True)),
            ],
        ),
        migrations.AlterField(
            model_name='applicant',
            name='status',
            field=models.CharField(choices=[('pending', 'pending'), ('rejected', 'rejected'), ('accepted', 'accepted')], default='pending', max_length=50),
        ),
    ]
