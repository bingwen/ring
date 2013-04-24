# -*- coding: utf-8 -*-

import os
import time

from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.shortcuts import render_to_response, render, redirect
from django.utils import simplejson as json
from django.contrib.auth.decorators import permission_required
from django.core.paginator import Paginator
from django.utils.decorators import method_decorator
from django.core.servers.basehttp import FileWrapper
from django.contrib.contenttypes.models import ContentType

from django.template import RequestContext
from django.db import transaction
from django.core.context_processors import csrf
from django.utils import timezone

from account.forms import RegisterForm,LoginForm
from django.contrib.auth import authenticate, login as auth_login ,logout as auth_logout
from django.contrib.auth.models import User

def requirelogin(fn):
	def wraper(*args, **kwargs):
		request = args[0]
		if request.user.is_authenticated():
			return fn(*args, **kwargs)
		else:
			return HttpResponseRedirect(reverse("login"))
	return wraper
	

def _login(request,username,password):
	'''登陆核心方法'''

	user=authenticate(username=username,password=password)
	if user:
		if user.is_active:
			auth_login(request,user)
			return HttpResponseRedirect(reverse("home"))
		else:
			context = {'msg':u'用户没有激活',}	
			return render_to_response('result.html', context,context_instance=RequestContext(request))
	else:
		context = {'msg':u'用户不存在',}	
		return render_to_response('result.html', context,context_instance=RequestContext(request))


def register(request):
    '''注册视图'''
    context={}
    form = RegisterForm()    
    if request.method=="POST":
        form=RegisterForm(request.POST.copy())
        if form.is_valid():
            username=form.cleaned_data["username"]
            email=form.cleaned_data["email"]
            password=form.cleaned_data["password"]
            user=User.objects.create_user(username,email,password)
            user.save()
            return _login(request,username,password)
    context["form"]=form
    return render_to_response("accounts/register.html",context,context_instance=RequestContext(request))

def login(request):
    '''登陆视图'''
    context={}
    form = LoginForm()    
    if request.method == 'POST':
        form=LoginForm(request.POST.copy())
        if form.is_valid():
            return _login(request,form.cleaned_data["username"],form.cleaned_data["password"])
    context["form"]=form        
    return render_to_response("accounts/login.html",context,\
                                   context_instance=RequestContext(request))

def logout(request):
    '''注销视图'''
    auth_logout(request)
    return HttpResponseRedirect(reverse('home'))