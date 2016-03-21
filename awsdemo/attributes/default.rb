#
# Author:: Piljoong Kim
# Cookbook Name:: awsdemo
#

default['java']['java_home'] = '/usr/bin/jvm/java'

default['java']['jdk_url'] = 'https://s3-ap-northeast-1.amazonaws.com/awsdemo-apps/jdk-8u65-linux-x64.rpm'

default['tomcat']['webapp_root'] = '/var/lib/tomcat7/'
