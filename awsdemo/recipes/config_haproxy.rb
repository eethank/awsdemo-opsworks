
tomcat_servers = search(:node, "layers:tomcat-server").first
#Chef::Log.info("Private IP: #{tomcat_servers[:private_ip]}")
Chef::Log.info("Private IP: #{tomcat_servers}")

file "/tmp/test" do
  content "#{tomcat_servers}"
  mode 0644
  action :create
end

