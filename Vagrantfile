
VAGRANTFILE_API_VERSION = '2'

Vagrant.require_version '>= 1.5.0'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = 'base-berkshelf'

  if Vagrant.has_plugin?('vagrant-omnibus')
    config.omnibus.chef_version = 'latest'
  end

  config.vm.box = 'jcalonsoh/centos71'

  config.vm.network :private_network, type: 'dhcp'

  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provider :virtualbox do |vb|
    vb.gui = true
    vb.customize ['modifyvm', :id, '--memory', '1024']
  end

  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.berkshelf.enabled = true

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to exclusively install and copy to Vagrant's shelf.
  # config.berkshelf.only = []

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to skip installing and copying to Vagrant's shelf.
  # config.berkshelf.except = []

  # kettle_dir = ENV['KETTLE_DIR'] ## Passed through $bash KETTLE_DIR=shity/dir vagrant up

  config.vm.provision :chef_solo do |chef|
    # chef.json = {
    #  mysql: {
    #    server_root_password: 'rootpass',
    #    server_debian_password: 'debpass',
    #    server_repl_password: 'replpass'
    #  }
    # }

    chef.run_list = [
      'recipe[base::default]'
    ]
  end
end
