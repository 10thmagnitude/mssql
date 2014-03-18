
::Chef::Recipe.send(:include, Opscode::OpenSSL::Password)

#if node['mssql']['instancename'] == 'MSSQLSERVER'
  #service_name = node['mssql']['instancename']
#else
  #service_name = "MSSQL$#{node['mssql']['instancename']}"
#end
#
static_tcp_reg_key = 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft SQL Server\\' + node['mssql']['reg_version'] +  node['mssql']['config_ini']['instancename']  + '\MSSQLServer\SuperSocketNetLib\Tcp\IPAll'

# generate and set a password for the 'sa' super user
node.set_unless['mssql']['config_ini']['agtsvcpassword'] =  "#{secure_password}-aA13"
node.set_unless['mssql']['config_ini']['sapwd'] = "#{secure_password}-aA13"
# force a save so we don't lose our generated password on a failed chef run
node.save unless Chef::Config[:solo]

config_file_path = win_friendly_path(File.join(Chef::Config[:file_cache_path], "ConfigurationFile.ini"))
install_file_path = win_friendly_path( "#{node['mssql']['install_drive']}#{node['mssql']['install_path']}" )

template config_file_path do
  source "ConfigurationFile.ini.erb"
end

execute "mount share #{node['mssql']['install_share']}" do
    command "net use #{node['mssql']['install_drive']} #{node['mssql']['install_share']} /user:vagrant 99vagrant! /persistent:No"
    not_if "net use | findstr /i \"Z:\" "
end
#mount "#{node['mssql']['install_drive']}" do
    #action :mount
    #device "#{node['mssql']['install_share']}"
#end


windows_package node['mssql']['server']['package_name'] do
  source install_file_path 
  options "/q /ConfigurationFile=#{config_file_path}"
  #checksum node['mssql']['server']['checksum']
  timeout node['mssql']['installer_timeout']
  installer_type :custom
  action :install
end

execute "unmount share #{node['mssql']['install_share']}" do
    command "net use #{node['mssql']['install_drive']} /d"
end
#mount "#{node['mssql']['install_drive']}" do
    #action :umount
    #device "#{node['mssql']['install_share']}"
#end

service node['mssql']['service_name'] do
  action :nothing
end

# set the static tcp port
registry_key static_tcp_reg_key do
  values [{ :name => 'TcpPort', :type => :string, :data => node['mssql']['port'].to_s },
    { :name => 'TcpDynamicPorts', :type => :string, :data => '' }]
  notifies :restart, "service[#{node['mssql']['service_name']}]", :immediately
end

# unlock port in firewall
# # this should leverage firewall_rule resource
# # once COOK-689 is completed
# firewall_rule_name = "#{node['mssql']['config_ini']['instancename']} Static Port"
#
# execute "open-static-port" do
#   command "netsh advfirewall firewall add rule name=\"#{firewall_rule_name}\" dir=in action=allow protocol=TCP localport=#{node['mssql']['port']}"
#     returns [0,1,42] # *sigh* cmd.exe return codes are wonky
#       not_if { SqlServer::Helper.firewall_rule_enabled?(firewall_rule_name) }
#       end

#include_recipe 'mssql::client'
