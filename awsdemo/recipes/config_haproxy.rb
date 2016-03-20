
tomcat_layer_id = search("aws_opsworks_layer", "name:Tomcat Server").first['layer_id']

tomcat_servers = search("aws_opsworks_instance", "layer_id:" + tomcat_layer_id).first
#Chef::Log.info("Private IP: #{tomcat_servers[:private_ip]}")
Chef::Log.info("Private IP: #{tomcat_servers}")

file "/tmp/test" do
  content "#{tomcat_servers}"
  mode 0644
  action :create
end



servers = []
idx = 1 
tomcat_servers.each do |s|
  str = "server app" + idx.to_s + " " + s['private_ip'].to_s + ":8080 check"
  servers << str
  idx = idx + 1
end

template '/etc/haproxy/haproxy.conf' do
  source 'haproxy.conf.erb'
  mode '0440'
  owner 'root'
  group 'root'
  variables({
    :tomcat_servers => servers
            })
end
