Chef::Log.info("Adding RHEL YUM REPO")

template "/etc/yum.repos.d/CUSTOM.repo" do
  source 'customrepo.erb'
  mode 00644
end
