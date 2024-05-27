# Generated by Django 5.0.3 on 2024-03-21 21:06

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mainapp', '0005_contact_alter_applicant_status'),
    ]

    operations = [
        migrations.AlterField(
            model_name='applicant',
            name='status',
            field=models.CharField(choices=[('accepted', 'accepted'), ('rejected', 'rejected'), ('pending', 'pending')], default='pending', max_length=50),
        ),
        migrations.AlterField(
            model_name='contact',
            name='home_phone_number',
            field=models.CharField(max_length=13, validators=[django.core.validators.RegexValidator(message="Phone number must start with '+255' followed by 9 digits.", regex='^\\+255\\d{9}$')]),
        ),
        migrations.AlterField(
            model_name='contact',
            name='office_phone_number',
            field=models.CharField(max_length=13, validators=[django.core.validators.RegexValidator(message="Phone number must start with '+255' followed by 9 digits.", regex='^\\+255\\d{9}$')]),
        ),
        migrations.AlterField(
            model_name='contact',
            name='your_phone_number',
            field=models.CharField(max_length=13, validators=[django.core.validators.RegexValidator(message="Phone number must start with '+255' followed by 9 digits.", regex='^\\+255\\d{9}$')]),
        ),
    ]
