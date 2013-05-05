# -*- coding: utf-8 -*-
import datetime
import json

from django.db import models, connection
from django.contrib.auth.models import User
from django.contrib.contenttypes.models import ContentType
from django.core.urlresolvers import reverse


class Token(models.Model):
    user = models.ForeignKey(User,related_name='user_token', verbose_name=(u'用户'))
    token = models.CharField(u'token',max_length=10)
    submit_datetime = models.DateTimeField(u'添加时间', auto_now_add=True)
    
    def __unicode__(self):
        return self.user.username
    
    class Meta:
        db_table = 'UserToken'
        verbose_name = verbose_name_plural = u'token'

