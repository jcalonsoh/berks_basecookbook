Chef::Log.info("Setting Firewall")

include_recipe "firewall"

firewall 'flush fw' do
  action :flush
end

firewall 'disabled fw' do
  action :disable
end
