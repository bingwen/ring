# -*- coding: utf-8 -*-
from django import forms
from django.forms.widgets import TextInput
from .models import *
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

admin.site.register(Mood)
