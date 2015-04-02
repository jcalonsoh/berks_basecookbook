Chef::Log.info("Installing packages")

execute 'UPDATE ALL' do
  Chef::Log.info("UPDATE SYSTEM")
  command 'yum update -y'
end

package 'mysql-libs' do
  action :remove
end

node.packages.each do |packages|
  package packages[:name]
end