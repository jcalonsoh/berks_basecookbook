Chef::Log.info('Updating PAM Settings')

execute 'Updating PAM Settings' do
  command "grep -q -F 'session    required     pam_limits.so' /etc/pam.d/login || echo 'session    required     pam_limits.so' >> /etc/pam.d/login"
end
