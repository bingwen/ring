import urllib2
import urllib

url = "http://localhost:8000/sendMood"
data = {'email':'bingwenst@foxmail.com', "token":"bc9f9b2a99","sender":"0","mood":"0","content":"test"}
encodeData = urllib.urlencode(data)
request = urllib2.Request(url, encodeData)
response = urllib2.urlopen(request)

print response.read()
