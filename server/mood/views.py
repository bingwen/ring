# -*- coding: utf-8 -*-

import os
import time
import random
import hashlib

from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.shortcuts import render_to_response, render, redirect
from django.contrib.auth.decorators import permission_required
from django.core.paginator import Paginator
from django.utils.decorators import method_decorator

from django.template import RequestContext
from django.core.context_processors import csrf
from django.utils import timezone

from django.utils.simplejson import dumps, loads, JSONEncoder
from django.db.models.query import QuerySet
from django.core.serializers import serialize
from django.utils.functional import curry

from mood.models import Mood
from account.views import requiretoken

from django.contrib.auth import authenticate, login as auth_login ,logout as auth_logout
from django.contrib.auth.models import User

class DjangoJSONEncoder(JSONEncoder):
    def default(self, obj):
        if isinstance(obj, QuerySet):
            # `default` must return a python serializable
            # structure, the easiest way is to load the JSON
            # string produced by `serialize` and return it
            return loads(serialize('json', obj))
        return JSONEncoder.default(self,obj)

dumps = curry(dumps, cls=DjangoJSONEncoder)

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
	return HttpResponse(dumps(result), mimetype="application/json")

@requiretoken
def getMood(requset):
	user = requset.user
	post = requset.POST;

	result = {}
	if post.has_key('sender'):
		moodList = Mood.objects.filter(user=user,sender=post['sender']).order_by('submit_datetime')
		if moodList.count() > 10:
			moodList = moodList[0:10]
		result['result'] = 'success'
		if moodList.count() < 1:
			result['result'] = "null"
		else :
			result['moodlist'] = moodList
	else:
		result['result'] = 'failed'
	return HttpResponse(dumps(result), mimetype="application/json")
    
