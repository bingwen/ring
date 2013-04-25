# -*- coding: utf-8 -*-
from django import forms
from django.forms.widgets import TextInput
from .models import *
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

class UserProfileInline(admin.StackedInline):
    model = UserProfile
    fk_name = 'user'
    max_num = 1

class UserProfileAdmin(UserAdmin):
    inlines = [UserProfileInline, ] #这样就可以在admin的用户管理页面中对扩展字段进行操作了

admin.site.unregister(User) #卸载user admin，并重新注册
admin.site.register(User, UserProfileAdmin)
admin.site.register(Pair)
admin.site.register(Token)
