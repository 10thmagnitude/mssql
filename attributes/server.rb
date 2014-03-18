default['mssql']['port'] = '1433'
default['mssql']['installer_timeout'] = 1500

if kernel['machine'] =~ /x86_64/
    default['mssql']['server']['package_name'] = 'Microsoft SQL Server 2008 (64-bit)'
else
    default['mssql']['server']['package_name'] = 'Microsoft SQL Server 2008 R2 (32-bit)'
end
default['mssql']['reg_version'] = 'MSSQL10_50.'


default['mssql']['install_drive'] = 'Z:'
#default['mssql']['install_share'] = '\\\\10.211.55.2\vagrant'
default['mssql']['install_share'] = '\\\\192.168.100.210\\vagrant'
default['mssql']['install_path'] = '\software\SQLSTD\SQLFULL_ENU\setup.exe'

default['mssql']['config_ini']['instancename'] = 'MSSQLSERVER'
default['mssql']['config_ini']['action'] = 'Install'
default['mssql']['config_ini']['features'] = 'SQLENGINE,BIDS,CONN,SSMS,ADV_SSMS'
default['mssql']['config_ini']['help'] = 'False'
default['mssql']['config_ini']['indicateprogress'] = 'False'
default['mssql']['config_ini']['quiet'] = 'True'
default['mssql']['config_ini']['quietsimple'] = 'False'
default['mssql']['config_ini']['x86'] = 'False'
default['mssql']['config_ini']['enu'] = 'True'
default['mssql']['config_ini']['errorreporting'] = 'False'
default['mssql']['config_ini']['installshareddir'] = 'C:\Program Files\Microsoft SQL Server'
default['mssql']['config_ini']['installsharedwowdir'] = 'C:\Program Files (x86)\Microsoft SQL Server'
default['mssql']['config_ini']['instancedir'] = 'C:\Program Files\Microsoft SQL Server'
default['mssql']['config_ini']['sqmreporting'] = 'False'
default['mssql']['config_ini']['sqlsysadminaccounts'] = 'Administrators'
default['mssql']['config_ini']['agtsvcaccount'] = 'NT AUTHORITY\NETWORK SERVICE'
#default['mssql']['config_ini']['agtsvcpassword'] = '!'
default['mssql']['config_ini']['agtsvcstartuptype'] = 'Manual'
default['mssql']['config_ini']['assvcstartuptype'] = 'Automatic'
default['mssql']['config_ini']['ascollation'] = 'Latin1_General_CI_AS'
default['mssql']['config_ini']['asdatadir'] = 'Data'
default['mssql']['config_ini']['aslogdir'] = 'Log'
default['mssql']['config_ini']['asbackupdir'] = 'Backup'
default['mssql']['config_ini']['astempdir'] = 'Temp'
default['mssql']['config_ini']['asconfigdir'] = 'Config'
default['mssql']['config_ini']['asprovidermsolap'] = '1'
default['mssql']['config_ini']['farmadminport'] = '0'
default['mssql']['config_ini']['sqlsvcstartuptype'] = 'Automatic'
default['mssql']['config_ini']['filestreamlevel'] = '0'
default['mssql']['config_ini']['enableranu'] = 'False'
default['mssql']['config_ini']['sqlcollation'] = 'SQL_Latin1_General_CP1_CI_AS'
default['mssql']['config_ini']['sqlsvcaccount'] = 'NT AUTHORITY\SYSTEM'
default['mssql']['config_ini']['sqlsysadminaccounts'] = 'Administrators'
default['mssql']['config_ini']['securitymode'] = 'SQL'
#default['mssql']['config_ini']['sapwd'] = ''
default['mssql']['config_ini']['installsqldatadir'] = 'C:\Data'
default['mssql']['config_ini']['sqluserdblogdir'] = 'C:\Logs'
default['mssql']['config_ini']['sqltempdblogdir'] = 'C:\Logs'
default['mssql']['config_ini']['iacceptsqlserverlicenseterms'] = 'True'
default['mssql']['config_ini']['tcpenabled'] = '1'
default['mssql']['config_ini']['npenabled'] = '1'
default['mssql']['config_ini']['browsersvcstartuptype'] = 'Automatic'
default['mssql']['config_ini']['rssvcstartuptype'] = 'Automatic'

if node['mssql']['config_ini']['instancename'] == 'MSSQLSERVER'
  default['mssql']['service_name'] = node['mssql']['config_ini']['instancename']
else
  default['mssql']['service_name'] = "MSSQL$#{node['mssql']['config_ini']['instancename']}"
end


