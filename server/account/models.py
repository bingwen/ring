# -*- coding: utf-8 -*-
import datetime
import json

from django.db import models, connection
from django.contrib.auth.models import User
from django.contrib.contenttypes.models import ContentType
from django.core.urlresolvers import reverse

GENDER = ( 
	('M',u'男'), 
	('F',u'女'), 
) 

PAIRSTATE = ( 
	('0',u'邀请中'), 
	('1',u'已配对'),
	('2',u'乙拒绝'), 
	('3',u'甲解除'),
	('4',u'乙解除'),  
) 

class UserProfile(models.Model):
	"""UserProfile model"""

	user = models.OneToOneField(User, blank=True, null=True, related_name='user', verbose_name=(u'用户'))
	gender = models.CharField((u'性别'), max_length=1, choices=GENDER, default='M')
	def __unicode__(self):
		return self.user
	
	class Meta:
		db_table = 'UserProfile'
		verbose_name = verbose_name_plural = u'用户信息'

class Pair(models.Model):
	user1 = models.ForeignKey(User,related_name='user1', verbose_name=(u'甲'))
	user2 = models.ForeignKey(User,related_name='user2', verbose_name=(u'乙'))
	state = models.CharField((u'状态'), max_length=1, choices=PAIRSTATE, default='0')
	submit_datetime = models.DateTimeField(u'添加时间', auto_now_add=True)
	
	def __unicode__(self):
		return self.user1.username+self.user2.username
	
	class Meta:
		db_table = 'pair'
		verbose_name = verbose_name_plural = u'配对'

class Token(models.Model):
    user = models.ForeignKey(User,related_name='user_token', verbose_name=(u'用户'))
    token = models.CharField(u'token',max_length=10)
    submit_datetime = models.DateTimeField(u'添加时间', auto_now_add=True)
    
    def __unicode__(self):
        return self.user.username
    
    class Meta:
        db_table = 'UserToken'
        verbose_name = verbose_name_plural = u'token'

