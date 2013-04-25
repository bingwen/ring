# -*- coding: utf-8 -*-

import os
import time
import random
import hashlib

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

from account.models import UserProfile,Token,Pair

from django.contrib.auth import authenticate, login as auth_login ,logout as auth_logout
from django.contrib.auth.models import User

def requiretoken(fn):
    def wraper(*args, **kwargs):
        request = args[0]
        if request.method=="POST":
            post = request.POST
            if post.has_key('email') and post.has_key('token'):
                if len(User.objects.filter(email=post['email'])) > 0:
                    user = User.objects.filter(email=post['email'])[0]
                    if len(Token.objects.filter(user=user)) > 0:
                        token = Token.objects.filter(user=user)[0]
                        if cmp(token.token,post['token']) == 0:
                            return fn(*args, **kwargs)
        return HttpResponse(json.dumps({'result':'illegal token'}), mimetype="application/json")
    return wraper
	

def generateToken(user):
    tokens = Token.objects.filter(user=user)
    for token in tokens:
        token.delete()
    _str = hashlib.md5(user.username+str(time.time())).hexdigest()
    _str = _str[0:10]
    newToken = Token(user=user,token=_str)
    newToken.save()
    return _str

def register(request):
    '''注册'''
    result={}
    if request.method=="POST":
        post = request.POST
        if post.has_key('email') and post.has_key('password'):
            if len(User.objects.filter(email=post['email'])) >= 1:
                result['msg'] = 'email exists'
            else:
                user=User.objects.create_user(post['email'],post['email'],post['password'])
                user.save()
                if post.has_key('gender'):
                    profile = UserProfile(user=user,gender=post['gender'])
                    profile.save()
                result['result'] = 'success'
                result['token'] = generateToken(user)
                return HttpResponse(json.dumps(result), mimetype="application/json")
        else :
            result['msg'] = 'no email or password'
    else :
        result['msg'] = 'not post'
    result['result'] = 'failed'
    return HttpResponse(json.dumps(result), mimetype="application/json")


def login(request):
    '''登陆'''
    result={}
    if request.method=="POST":
        post = request.POST
        if post.has_key('email') and post.has_key('password'):
            if len(User.objects.filter(email=post['email'])) < 1:
                result['msg'] = 'user not exists'
            else:
                user=User.objects.filter(email=post['email'])[0]
                if user.check_password(post['password']):
                    result['result'] = 'success'
                    result['token'] = generateToken(user)
                    return HttpResponse(json.dumps(result), mimetype="application/json")
                else:
                    result['msg'] = 'email and password is not match'
        else :
            result['msg'] = 'no email or password'
    else :
        result['msg'] = 'not post'
    result['result'] = 'failed'
    return HttpResponse(json.dumps(result), mimetype="application/json")

def logout(request):
    '''注销'''
    result={}
    if request.method=="POST":
        post = request.POST
        if post.has_key('email'):
            if len(User.objects.filter(email=post['email'])) < 1:
                result['msg'] = 'user not exists'
            else:
                for user in User.objects.filter(email=post['email']):
                    tokens = Token.objects.filter(user=user)
                    for token in tokens:
                        token.delete()
                result['result'] = 'success'
                return HttpResponse(json.dumps(result), mimetype="application/json")
        else :
            result['msg'] = 'no email'
    else :
        result['msg'] = 'not post'
    result['result'] = 'failed'
    return HttpResponse(json.dumps(result), mimetype="application/json")

@requiretoken
def userinfo(request):
    '''用户信息'''
    result={}
    post = request.POST
    user = User.objects.filter(email=post['email'])[0]

    result['result'] = 'success'
    result['user'] = user.username
    return HttpResponse(json.dumps(result), mimetype="application/json")