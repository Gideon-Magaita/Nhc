# Generated by Django 4.1.7 on 2024-03-25 10:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mainapp', '0011_project_alter_applicant_status'),
    ]

    operations = [
        migrations.AlterField(
            model_name='project',
            name='project_code',
            field=models.CharField(blank=True, max_length=100, null=True, unique=True),
        ),
    ]
