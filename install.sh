#!/bin/bash

# Run as root
yum install httpd24 -y
service httpd start

# These must be installed in this order. Otherwise mod_security_crs tries to install the regular
# mod_security which is not compatible with http24
yum install mod24_security -y
yum install mod_security_crs -y
service httpd restart

# To test
# $curl -ks -o /dev/null -w '%{http_code}' "http://ec2-54-144-13-156.compute-1.amazonaws.com/foo?username=1'%20or%20'1'%20=%20'"
# If its working it will return 403 instead of 404 
