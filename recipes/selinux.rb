Chef::Log.info('Disabling SELINUX')

include_recipe 'selinux'

selinux_state 'SELinux' do
  action :disabled
end
