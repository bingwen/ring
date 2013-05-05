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

from mood.models import Mood
from account.views import requiretoken

from django.contrib.auth import authenticate, login as auth_login ,logout as auth_logout
from django.contrib.auth.models import User

@requiretoken
def sendMood(requset):
	user = requset.user
	post = requset.POST;

	result = {}

	if post.has_key('sender') and post.has_key('mood') and post.has_key('content'):
		mood = Mood(user=user,sender=post['sender'],content=post['content'])
		mood.save()
		if post.has_key('weather'):
			mood.weather = post['weather']
		if post.has_key('city'):
			mood.city = post['city']
		if post.has_key('longitude'):
			mood.longitude = post['longitude']
		if post.has_key('latitude'):
			mood.latitude = post['latitude']
		mood.save()
		result['result'] = 'success'
	else :
		result['result'] = 'failed'
	return HttpResponse(json.dumps(result), mimetype="application/json")

@requiretoken
def getMood(requset):
	user = requset.user
	post = requset.POST;

	result = {}
	if post.has_key('sender'):
		moodList = Mood.objects.filter(user=user,sender=sender).order_by('submit_datetime')
		if moodList.count() > 10:
			moodList = moodList[0:10]
		result['result'] = 'success'
		result['moodlist'] = moodList
	else:
		result['result'] = 'failed'
	return HttpResponse(json.dumps(result), mimetype="application/json")
    
