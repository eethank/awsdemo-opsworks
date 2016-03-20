
tomcat_layer_id = search("aws_opsworks_layer", "name:Tomcat Server").first['layer_id']

tomcat_servers = search("aws_opsworks_instance", "layer_ids:#{tomcat_layer_id}")

servers = []
idx = 1 
tomcat_servers.each do |s|
  str = "server app" + idx.to_s + " " + s['private_ip'] + ":8080 check"
  servers << str
  idx = idx + 1
end

template '/etc/haproxy/haproxy.cfg' do
  source 'haproxy.cfg.erb'
  mode '0440'
  owner 'root'
  group 'root'
  variables({
    :tomcat_servers => servers
            })
end
