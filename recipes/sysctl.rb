Chef::Log.info('Aplying sysctl kernel mods')

node.set['sysctl']['params']['kernel.sysrq'] = 0
node.set['sysctl']['params']['kernel.core_uses_pid'] = 1

node.set['sysctl']['params']['net.ipv4.ip_forward'] = 0
node.set['sysctl']['params']['net.ipv4.conf.default.rp_filter'] = 1
node.set['sysctl']['params']['net.ipv4.conf.default.accept_source_route'] = 0
node.set['sysctl']['params']['net.ipv4.ip_local_port_range'] = '9000 65500'
node.set['sysctl']['params']['net.ipv4.tcp_syncookies'] = 1

node.set['sysctl']['params']['kernel.msgmnb'] = 65_536
node.set['sysctl']['params']['kernel.msgmax'] = 65_536
node.set['sysctl']['params']['kernel.shmmax'] = 68_719_476_736
node.set['sysctl']['params']['kernel.shmall'] = 4_294_967_296
node.set['sysctl']['params']['kernel.sem'] = '250 32000 100 128'

node.set['sysctl']['params']['net.core.somaxconn'] = 40_000
node.set['sysctl']['params']['net.core.netdev_max_backlog'] = 40_000

node.set['sysctl']['params']['net.core.rmem_default'] = 8_388_608
node.set['sysctl']['params']['net.core.rmem_max'] = 8_388_608
node.set['sysctl']['params']['net.core.wmem_default'] = 8_388_608
node.set['sysctl']['params']['net.core.wmem_max'] = 8_388_608
node.set['sysctl']['params']['net.core.optmem_max'] = 40_960

node.set['sysctl']['params']['net.ipv4.tcp_timestamps'] = 0
node.set['sysctl']['params']['net.ipv4.tcp_sack'] = 0
node.set['sysctl']['params']['net.ipv4.tcp_fack'] = 0
node.set['sysctl']['params']['net.ipv4.tcp_window_scaling'] = 1

node.set['sysctl']['params']['fs.aio-max-nr'] = 1_048_576
node.set['sysctl']['params']['fs.file-max'] = 681_574
node.set['sysctl']['params']['vm.overcommit_memory'] = 1

include_recipe 'sysctl2'

execute 'reload-sysctl' do
  command 'sysctl -e -p'
end
