
template "/etc/init.d/kafka" do
  source  "kafka-init_d.erb"
  owner "root"
  group "root"
  mode  00755
  variables({
    :install_dir => node[:kafka][:install_dir],
    :conf_dir => node[:kafka][:conf_link_dir],
    :user => user
  })
end

service "kafka" do
  init_command "/etc/init.d/kafka"
  supports :restart => true, :status => true
  action [:enable, :start]  # see actions section below
end


