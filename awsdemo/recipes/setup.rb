
java_home = node['java']['java_home']
jdk_url = node['java']['jdk_url']

ruby_block "set-env-java-home" do
  block do
    ENV["JAVA_HOME"] = java_home
  end
  not_if { ENV["JAVA_HOME"] == java_home }
end

remote_file "#{Chef::Config[:file_cache_path]}/jdk.rpm" do
  source jdk_url
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

rpm_package 'JDK' do
  source "#{Chef::Config[:file_cache_path]}/jdk.rpm"
  action :install
end

