# -*- coding: utf-8 -*-
import datetime
import json

from django.db import models, connection
from django.contrib.auth.models import User
from django.contrib.contenttypes.models import ContentType
from django.core.urlresolvers import reverse

class OrderedModel(models.Model):
    order = models.PositiveIntegerField(editable=False)

    def save(self):
        if not self.id:
            try:
                self.order = self.__class__.objects.all().order_by("-order")[0].order + 1
            except IndexError:
                self.order = 0
        super(OrderedModel, self).save()
        

    def order_link(self):
        model_type_id = ContentType.objects.get_for_model(self.__class__).id
        model_id = self.id
        kwargs = {"direction": "up", "model_type_id": model_type_id, "model_id": model_id}
        url_up = reverse("admin-move", kwargs=kwargs)
        kwargs["direction"] = "down"
        url_down = reverse("admin-move", kwargs=kwargs)
        return '<a href="%s">up</a> | <a href="%s">down</a>' % (url_up, url_down)
    order_link.allow_tags = True
    order_link.short_description = 'Move'
    order_link.admin_order_field = 'order'


    @staticmethod
    def move_down(model_type_id, model_id):
        try:
            ModelClass = ContentType.objects.get(id=model_type_id).model_class()

            lower_model = ModelClass.objects.get(id=model_id)
            higher_model = ModelClass.objects.filter(order__gt=lower_model.order)[0]
            
            lower_model.order, higher_model.order = higher_model.order, lower_model.order

            higher_model.save()
            lower_model.save()
        except IndexError:
            pass
        except ModelClass.DoesNotExist:
            pass
                
    @staticmethod
    def move_up(model_type_id, model_id):
        try:
            ModelClass = ContentType.objects.get(id=model_type_id).model_class()

            higher_model = ModelClass.objects.get(id=model_id)
            lower_model = list(ModelClass.objects.filter(order__lt=higher_model.order))[-1]

            lower_model.order, higher_model.order = higher_model.order, lower_model.order

            higher_model.save()
            lower_model.save()
        except IndexError:
            pass
        except ModelClass.DoesNotExist:
            pass

    class Meta:
        ordering = ["order"]
        abstract = True

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
		return self.user1+self.user2
	
	class Meta:
		db_table = 'UserProfile'
		verbose_name = verbose_name_plural = u'配对'

