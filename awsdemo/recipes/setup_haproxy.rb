
package "haproxy" do
  action :install
end

service "haproxy" do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end

service "monit" do
  supports :status => false, :restart => true, :reload => true
  action [:enable, :start]
end

template '/etc/failure.sh' do
  source 'failure.sh.erb'
  owner 'root'
  group 'root'
  mode 0755
end

template '/etc/monit.d/hpfailwatch.monitrc' do
  source 'hpfailwatch.monitrc.erb'
  owner 'root'
  group 'root'
  mode 0440
  notifies :reload, "service[monit]", :immediately
end
