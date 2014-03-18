# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.define "db" do |db|
    db.vm.hostname = "sql-server-db"
    db.vm.box = "vagrant-win2k8r2"
    db.vm.guest = :windows
    #db.omnibus.chef_version = :latest
    db.vm.box_url = "https://dl.dropboxusercontent.com/u/2105139/vagrant/win2k8r2.box"
    db.vm.network :private_network, ip: "33.33.33.20"

      # Port forward WinRM and RDP
    db.vm.network :forwarded_port, guest: 3389, host: 3389, id: "rdp", auto_correct: true
    db.vm.network :forwarded_port, guest: 5985, host: 5985, id: "winrm", auto_correct: true

    db.vm.provider :virtualbox do |vb|
       # Don't boot with headless mode
       vb.gui = true
    #   # Use VBoxManage to customize the VM. For example to change memory:
    #   vb.customize ["modifyvm", :id, "--memory", "1024"]
    end

    db.vm.boot_timeout = 120


   # Max time to wait for the guest to shutdown
    db.windows.halt_timeout = 25

      # Admin user name and password
    db.winrm.username = "vagrant"
    db.winrm.password = "vagrant"

    db.vm.provision :chef_solo do |chef|
      #chef.log_level = :debug
    #####added next 2 lines to get around sql_server error (https://tickets.opscode.com/browse/COOK-4355)
      chef.add_recipe 'dotnetframework'
      chef.file_cache_path = 'c:/chef/cache'
      #chef.cookbooks_path = ['cookbooks', '/Users/johnsmyth/.berkshelf/cookbooks','/Users/johnsmyth/.berkshelf/cookbooks/openssl-1.1.0'] 
      chef.json = {
        'mssql' => {
          #'instance_name' => 'MSSQL_TEST_INST',
          #'instance_name' => 'MSSQLSERVER',
          #'accept_eula' => 'true'
        }, 
        :minitest => {
          :ci_reports => '/tmp/chefci'
        }
      }
      chef.run_list = [
          "recipe[mssql::server]",
          "recipe[minitest-handler::default]"
      ]
    end
  end    
    
  config.vm.define "ssrs" do |ssrs|
    ssrs.vm.hostname = "sql-ssrs-test"
    ssrs.vm.box = "vagrant-win2k8r2"
    ssrs.vm.guest = :windows
    ssrs.omnibus.chef_version = :latest
    ssrs.vm.box_url = "https://dl.dropboxusercontent.com/u/2105139/vagrant/win2k8r2.box"
    ssrs.vm.network :private_network, ip: "33.33.33.21"

      # Port forward WinRM and RDP
    ssrs.vm.network :forwarded_port, guest: 3389, host: 3389, id: "rdp", auto_correct: true
    ssrs.vm.network :forwarded_port, guest: 5985, host: 5985, id: "winrm", auto_correct: true

    ssrs.vm.provider :virtualbox do |vb|
       # Don't boot with headless mode
       vb.gui = true
    #   # Use VBoxManage to customize the VM. For example to change memory:
    #   vb.customize ["modifyvm", :id, "--memory", "1024"]
    end

    ssrs.vm.boot_timeout = 120


   # Max time to wait for the guest to shutdown
    ssrs.windows.halt_timeout = 25

      # Admin user name and password
    ssrs.winrm.username = "vagrant"
    ssrs.winrm.password = "vagrant"

    ssrs.vm.provision :chef_solo do |chef|
      #####added next 2 lines to get around mssqlerror (https://tickets.opscode.com/browse/COOK-4355)
      #chef.add_recipe 'dotnetframework'
      #chef.file_cache_path = 'c:/chef/cache'
      chef.json = {
        :minitest => {
          :ci_reports => '/tmp/chefci'
        }
      }
      chef.run_list = [
          "recipe[mssql::ssrs]",
     #     "recipe[minitest-handler::default]"
      ]
    end
  end  






  config.vm.define "ssis" do |ssis|
    ssis.vm.hostname = "sql-ssis-test"
    ssis.vm.box = "vagrant-win2k8r2"
    ssis.vm.guest = :windows
    ssis.omnibus.chef_version = :latest
    ssis.vm.box_url = "https://dl.dropboxusercontent.com/u/2105139/vagrant/win2k8r2.box"
    ssis.vm.network :private_network, ip: "33.33.33.22"

      # Port forward WinRM and RDP
    ssis.vm.network :forwarded_port, guest: 3389, host: 3389, id: "rdp", auto_correct: true
    ssis.vm.network :forwarded_port, guest: 5985, host: 5985, id: "winrm", auto_correct: true

    ssis.vm.provider :virtualbox do |vb|
       # Don't boot with headless mode
       vb.gui = true
    #   # Use VBoxManage to customize the VM. For example to change memory:
    #   vb.customize ["modifyvm", :id, "--memory", "1024"]
    end

    ssis.vm.boot_timeout = 120


   # Max time to wait for the guest to shutdown
    ssis.windows.halt_timeout = 25

      # Admin user name and password
    ssis.winrm.username = "vagrant"
    ssis.winrm.password = "vagrant"

    ssis.vm.provision :chef_solo do |chef|
      #####added next 2 lines to get around sql_server error (https://tickets.opscode.com/browse/COOK-4355)
      ##chef.add_recipe 'dotnetframework'
      #chef.file_cache_path = 'c:/chef/cache'
      chef.json = {
        :minitest => {
          :ci_reports => '/tmp/chefci'
        }
      }
      chef.run_list = [
          "recipe[mssql::ssis]",
     #     "recipe[minitest-handler::default]"
      ]
    end
  end    


  config.vm.define "sql_client" do |sql_client|
    sql_client.vm.hostname = "sql-client-test"
    sql_client.vm.box = "vagrant-win2k8r2"
    sql_client.vm.guest = :windows
    sql_client.omnibus.chef_version = :latest
    sql_client.vm.box_url = "https://dl.dropboxusercontent.com/u/2105139/vagrant/win2k8r2.box"
    sql_client.vm.network :private_network, ip: "33.33.33.23"

      # Port forward WinRM and RDP
    sql_client.vm.network :forwarded_port, guest: 3389, host: 3389, id: "rdp", auto_correct: true
    sql_client.vm.network :forwarded_port, guest: 5985, host: 5985, id: "winrm", auto_correct: true

    sql_client.vm.provider :virtualbox do |vb|
       # Don't boot with headless mode
       vb.gui = true
    #   # Use VBoxManage to customize the VM. For example to change memory:
    #   vb.customize ["modifyvm", :id, "--memory", "1024"]
    end

    sql_client.vm.boot_timeout = 120


   # Max time to wait for the guest to shutdown
    sql_client.windows.halt_timeout = 25

      # Admin user name and password
    sql_client.winrm.username = "vagrant"
    sql_client.winrm.password = "vagrant"

    sql_client.vm.provision :chef_solo do |chef|
      #####added next 2 lines to get around sql_server error (https://tickets.opscode.com/browse/COOK-4355)
      chef.add_recipe 'dotnetframework'
      chef.file_cache_path = 'c:/chef/cache'
      chef.json = {
        :minitest => {
          :ci_reports => '/tmp/chefci'
        }
      }
      chef.run_list = [
          "recipe[mssql::client]",
     #     "recipe[minitest-handler::default]"
      ]
    end
  end

  # The path to the Berksfile to use with Vagrant Berkshelf
  # config.berkshelf.berksfile_path = "./Berksfile"

  # Enabling the Berkshelf plugin. To enable this globally, add this configuration
  # option to your ~/.vagrant.d/Vagrantfile file
  config.berkshelf.enabled = true

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to exclusively install and copy to Vagrant's shelf.
  # config.berkshelf.only = []

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to skip installing and copying to Vagrant's shelf.
  # config.berkshelf.except = []


end
