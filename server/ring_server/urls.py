from django.conf.urls import patterns, include, url

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'ring_server.views.home', name='home'),
    # url(r'^ring_server/', include('ring_server.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),


    url(r'^accounts/register$', 'account.views.register',name="register"),  
	url(r'^accounts/login$', 'account.views.login',name="login"),  
	url(r'^accounts/logout$', 'account.views.logout',name="logout"), 
)
