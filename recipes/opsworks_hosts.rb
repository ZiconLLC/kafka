#
# Set attributes for dependant nodes that are currently online at the time this
# chef run started this recipe
#  - if a node is not online it will get missed, this is a problem

instances = node[:opsworks][:layers]['zookeeper'][:instances]

hosts = []
instances.each do |name, instance| 
	hosts.push("#{instance[:private_ip]}:2181")
end

node.normal[:kafka][:zookeeper_nodes] = hosts

