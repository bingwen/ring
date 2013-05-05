# -*- coding: utf-8 -*-
from django.db import models

# Create your models here.
from django.contrib.auth.models import User
import datetime

SENDERLIST = ( 
	('0',u'A'), 
	('1',u'B'), 
) 
MOODLIST = ( 
	('0',u'好'), 
	('1',u'不好'), 
) 
WEATHERLIST = ( 
	('0',u'晴天'), 
	('1',u'阴雨'), 
) 

class Mood(models.Model):
	"""Mood model"""

	user = models.ForeignKey(User)
	submit_datetime = models.DateTimeField(u'添加时间', auto_now_add=True)
	sender = models.CharField(u'Sender', max_length=1,choices=SENDERLIST, default='0')
	mood = models.CharField(u'心情', max_length=1,choices=MOODLIST, default='0')
	content = models.TextField(u'内容')
	weather = models.CharField(u'天气', max_length=1,choices=WEATHERLIST, default='0')
	city = models.CharField(u'城市',max_length=20)
	longitude = models.CharField(u'经度',max_length=20)
	latitude = models.CharField(u'纬度',max_length=20)

	def __unicode__(self):
		return self.submit_datetime.strftime("%Y-%m-%d-%H")+">"+self.user.username
	
	class Meta:
		db_table = 'mood'
		verbose_name = verbose_name_plural = u'心情队列'


		