from django.urls import path
from .import views
from .import officer_view
from .import admins

urlpatterns = [
    path('',views.home,name="home"),
    path('applicant_info',views.applicant_info,name="applicant_info"),
    path('delete_applicant/<int:id>/',views.delete_applicant, name='delete_applicant'),
    path('edit_applicant/<int:id>/',views.edit_applicant, name='edit_applicant'),
    path('contact_info',views.contact_info,name="contact_info"),
    path('delete_contact/<int:id>',views.delete_contact,name='delete_contact'),
    path('edit_contact/<int:id>/',views.edit_contact,name='edit_contact'),
    path('dependant_details',views.dependant_details,name="dependant_details"),
    path('delete_dependant/<int:id>/',views.delete_dependant,name='delete_dependant'),
    path('edit_dependant/<int:id>/',views.edit_dependant,name='edit_dependant'),
    path('employment_info',views.employment_info,name="employment_info"),
    path('edit_employment/<int:id>/',views.edit_employment,name='edit_employment'),
    path('delete_employment/<int:id>/',views.delete_employment,name='delete_employment'),
    path('financial_info',views.financial_info,name='financial_info'),
    path('edit_financial/<int:id>/',views.edit_financial,name='edit_financial'),
    path('delete_financial/<int:id>/',views.delete_financial,name='delete_financial'),
    path('referee_info',views.referee_info,name="referee_info"),
    path('edit_referee/<int:id>/',views.edit_referee,name='edit_referee'),
    path('delete_referee/<int:id>/',views.delete_referee,name='delete_referee'),
    path('house_info',views.house_info,name="house_info"),
    path('edit_house_info/<int:id>/',views.edit_house_info,name='edit_house_info'),
    path('delete_house/<int:id>',views.delete_house,name='delete_house'),
    path('declaration_info',views.declaration_info,name="declaration_info"),
    path('preview_info',views.preview_info,name="preview_info"),

    #authorization urls
    path('login_user', views.login_user, name='login_user'),
    path('register',views.register, name='register'),
    path('logoutUser',views.logoutUser, name='logoutUser'),

    #officers urls
    path('home_page',officer_view.home_page,name='home_page'),
    path('applicant_details',officer_view.applicant_details,name='applicant_details'),
    path('edit_status/<int:id>',officer_view.edit_status,name='edit_status'),
    #payment
    path('payment_details',views.payment_details,name='payment_details'),
    #admin url
    path('admin_home',admins.admin_home,name='admin_home'),
    path('users',admins.users,name='users'),
    path('delete_user/<int:id>',admins.delete_user,name='delete_user'),
    path('add_project',admins.add_project,name='add_project'),
    path('dit_project/<int:id>',admins.edit_project,name='edit_project'),
    path('add_house',admins.add_house,name='add_house'),
    path('edit_house/<int:id>',admins.edit_house,name='edit_house'),
]
