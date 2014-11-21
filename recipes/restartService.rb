#  restart 
service "kafka" do
  action :stop
  supports :restart => true, :status => true
  init_command  "/etc/init.d/kafka"
end

sleep 5

service "kafka" do
  action :start
  supports :restart => true, :status => true
  init_command  "/etc/init.d/kafka"
end

