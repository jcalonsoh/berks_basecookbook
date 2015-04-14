require 'spec_helper'

describe file('/proc/sys/kernel/sysrq') do
  it { should be_file }
  it { should contain '0' }
end

describe file('/proc/sys/kernel/core_uses_pid') do
  it { should be_file }
  it { should contain '1' }
end

describe file('/proc/sys/net/ipv4/ip_forward') do
  it { should be_file }
  it { should contain '0' }
end

describe file('/proc/sys/net/ipv4/conf/default/rp_filter') do
  it { should be_file }
  it { should contain '1' }
end

describe file('/proc/sys/net/ipv4/conf/default/accept_source_route') do
  it { should be_file }
  it { should contain '0' }
end

describe file('/proc/sys/net/ipv4/ip_local_port_range') do
  it { should be_file }
  it { should contain '9000	65500' }
end

describe file('/proc/sys/net/ipv4/tcp_syncookies') do
  it { should be_file }
  it { should contain '1' }
end

describe file('/proc/sys/kernel/msgmnb') do
  it { should be_file }
  it { should contain '65536' }
end

describe file('/proc/sys/kernel/msgmax') do
  it { should be_file }
  it { should contain '65536' }
end

describe file('/proc/sys/kernel/shmmax') do
  it { should be_file }
  it { should contain '68719476736' }
end

describe file('/proc/sys/kernel/shmall') do
  it { should be_file }
  it { should contain '4294967296' }
end

describe file('/proc/sys/kernel/sem') do
  it { should be_file }
  it { should contain '250	32000	100	128' }
end

describe file('/proc/sys/net/core/somaxconn') do
  it { should be_file }
  it { should contain '40000' }
end

describe file('/proc/sys/net/core/netdev_max_backlog') do
  it { should be_file }
  it { should contain '40000' }
end

describe file('/proc/sys/net/core/rmem_default') do
  it { should be_file }
  it { should contain '8388608' }
end

describe file('/proc/sys/net/core/rmem_max') do
  it { should be_file }
  it { should contain '8388608' }
end

describe file('/proc/sys/net/core/wmem_default') do
  it { should be_file }
  it { should contain '8388608' }
end

describe file('/proc/sys/net/core/wmem_max') do
  it { should be_file }
  it { should contain '8388608' }
end

describe file('/proc/sys/net/core/optmem_max') do
  it { should be_file }
  it { should contain '40960' }
end

describe file('/proc/sys/net/ipv4/tcp_timestamps') do
  it { should be_file }
  it { should contain '0' }
end

describe file('/proc/sys/net/ipv4/tcp_sack') do
  it { should be_file }
  it { should contain '0' }
end

describe file('/proc/sys/net/ipv4/tcp_fack') do
  it { should be_file }
  it { should contain '0' }
end

describe file('/proc/sys/net/ipv4/tcp_window_scaling') do
  it { should be_file }
  it { should contain '1' }
end

describe file('/proc/sys/fs/aio-max-nr') do
  it { should be_file }
  it { should contain '1048576' }
end

describe file('/proc/sys/fs/file-max') do
  it { should be_file }
  it { should contain '681574' }
end

describe file('/proc/sys/vm/overcommit_memory') do
  it { should be_file }
  it { should contain '1' }
end

persistence_file = case os[:family]
                     when 'RedHat', 'Fedora', 'Debian', 'Ubuntu'
                       '/etc/sysctl.d/99-chef-attributes.conf'
                     else
                       '/etc/sysctl.conf'
                   end

describe file(persistence_file) do
  it { should be_file }
  it { should contain 'kernel.sysrq = 0' }
  it { should contain 'kernel.core_uses_pid = 1' }
  it { should contain 'net.ipv4.ip_forward = 0' }
  it { should contain 'net.ipv4.conf.default.rp_filter = 1' }
  it { should contain 'net.ipv4.conf.default.accept_source_route = 0' }
  it { should contain 'net.ipv4.ip_local_port_range = 9000 65500' }
  it { should contain 'net.ipv4.tcp_syncookies = 1' }
  it { should contain 'kernel.msgmnb = 65536' }
  it { should contain 'kernel.msgmax = 65536' }
  it { should contain 'kernel.shmmax = 68719476736' }
  it { should contain 'kernel.shmall = 4294967296' }
  it { should contain 'kernel.sem = 250 32000 100 128' }
  it { should contain 'net.core.somaxconn = 40000' }
  it { should contain 'net.core.netdev_max_backlog = 40000' }
  it { should contain 'net.core.rmem_default = 8388608' }
  it { should contain 'net.core.rmem_max = 8388608' }
  it { should contain 'net.core.wmem_default = 8388608' }
  it { should contain 'net.core.wmem_max = 8388608' }
  it { should contain 'net.core.optmem_max = 40960' }
  it { should contain 'net.ipv4.tcp_timestamps = 0' }
  it { should contain 'net.ipv4.tcp_sack = 0' }
  it { should contain 'net.ipv4.tcp_fack = 0' }
  it { should contain 'net.ipv4.tcp_window_scaling = 1' }
  it { should contain 'fs.aio-max-nr = 1048576' }
  it { should contain 'fs.file-max = 681574' }
  it { should contain 'vm.overcommit_memory = 1' }
end
