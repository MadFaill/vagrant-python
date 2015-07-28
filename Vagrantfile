VAGRANT_API_VERSION = "2"
VAGRANT_DEFAULT_PROVIDER = "virtualbox"
PROVISION_PATH = "provision"

@ui = Vagrant::UI::Colored.new
Vagrant.require_version ">= #{VAGRANT_API_VERSION}"

plugins = [
    'vagrant-hostsupdater',
    'vagrant-env',
    'vagrant-vbguest',
    'vagrant-cachier',
]

plugins.each do |plugin|
    if !Vagrant.has_plugin?(plugin)
        system("vagrant plugin install #{plugin}")
    end
end

Vagrant.configure(VAGRANT_API_VERSION) do |config|

    config.package.name = 'rn-ubuntu.box'
    config.vm.box       = 'phusion/ubuntu-12.04-amd64'

    config.vm.define 'developer-local'
    config.ssh.forward_agent = true
    config.env.enable

    config.cache.scope = :box
    config.cache.auto_detect = false
    config.cache.enable :apt
    config.cache.enable :apt_lists
    config.cache.enable :gem
    config.cache.enable :generic, {
      "pip" => { cache_dir: "/root/.cache/pip" },
      "npm" => { cache_dir: "/root/.npm" },
      "product_details" => { cache_dir: "/home/vagrant/product_details_json" },
    }

  #network
  config.vm.network :private_network, ip: "10.10.10.10"
  config.vm.network "forwarded_port", guest: 80,    host: 8080
  config.vm.network "forwarded_port", guest: 3306,  host: 33306

  config.vm.hostname = "host.local"
  config.hostsupdater.aliases = ["www.host.local"]

  #shared
  config.vm.synced_folder "./shared", "/home/vagrant/shared", type: 'nfs'

  #virtualbox
  config.vbguest.auto_update = true

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory",             "1024"]
    vb.customize ["modifyvm", :id, "--cpuexecutioncap",      "95"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1",  "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1",         "on"]
    vb.gui = false
  end

  config.vm.provision :puppet, run: "always" do |puppet|
    puppet.manifests_path = "#{PROVISION_PATH}/puppet/manifests"
    puppet.module_path = "#{PROVISION_PATH}/puppet/modules"
    puppet.manifest_file  = 'init.pp'
    puppet.options = '--verbose --debug'
  end

  # Pass vagrant_root variable to the VM and cd into the directory upon login.
  config.vm.provision "shell", run: "always" do |s|
    s.inline = <<-SCRIPT
      sudo service nginx restart
      sudo service supervisor restart
    SCRIPT
  end

  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  config.hostsupdater.remove_on_suspend = true

end
