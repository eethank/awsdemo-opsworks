#
# Author:: Piljoong Kim
# Cookbook Name:: awsdemo
#

default['java']['java_home'] = '/usr/bin/jvm/java'

#default['java']['jdk_url'] = 'https://s3-us-west-2.amazonaws.com/awsdemo-test/jdk-8u65-linux-x64.gz'
default['java']['jdk_url'] = 'https://s3-us-west-2.amazonaws.com/awsdemo-test/jdk-8u65-linux-x64.rpm'

default['tomcat']['webapp_root'] = '/var/lib/tomcat7/'
