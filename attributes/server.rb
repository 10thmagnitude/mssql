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

default['mssql']['instancename'] = 'MSSQLSERVER'
default['mssql']['instanceid'] = 'MSSQLSERVER'
default['mssql']['action'] = 'Install'
default['mssql']['features'] = 'SQLENGINE,BIDS,CONN,SSMS,ADV_SSMS'
default['mssql']['help'] = 'False'
default['mssql']['indicateprogress'] = 'False'
default['mssql']['quiet'] = 'True'
default['mssql']['quietsimple'] = 'False'
default['mssql']['x86'] = 'False'
default['mssql']['enu'] = 'True'
default['mssql']['errorreporting'] = 'False'
default['mssql']['installshareddir'] = 'C:\Program Files\Microsoft SQL Server'
default['mssql']['installsharedwowdir'] = 'C:\Program Files (x86)\Microsoft SQL Server'
default['mssql']['instancedir'] = 'C:\Program Files\Microsoft SQL Server'
default['mssql']['sqmreporting'] = 'False'
default['mssql']['sqlsysadminaccounts'] = 'Administrators'
default['mssql']['agtsvcaccount'] = 'NT AUTHORITY\NETWORK SERVICE'
#default['mssql']['agtsvcpassword'] = '!'
default['mssql']['agtsvcstartuptype'] = 'Manual'
default['mssql']['assvcstartuptype'] = 'Automatic'
default['mssql']['ascollation'] = 'Latin1_General_CI_AS'
default['mssql']['asdatadir'] = 'Data'
default['mssql']['aslogdir'] = 'Log'
default['mssql']['asbackupdir'] = 'Backup'
default['mssql']['astempdir'] = 'Temp'
default['mssql']['asconfigdir'] = 'Config'
default['mssql']['asprovidermsolap'] = '1'
default['mssql']['farmadminport'] = '0'
default['mssql']['sqlsvcstartuptype'] = 'Automatic'
default['mssql']['filestreamlevel'] = '0'
default['mssql']['enableranu'] = 'False'
default['mssql']['sqlcollation'] = 'SQL_Latin1_General_CP1_CI_AS'
default['mssql']['sqlsvcaccount'] = 'NT AUTHORITY\SYSTEM'
default['mssql']['sqlsysadminaccounts'] = 'Administrators'
default['mssql']['securitymode'] = 'SQL'
#default['mssql']['sapwd'] = ''
default['mssql']['installsqldatadir'] = 'C:\Data'
default['mssql']['sqluserdblogdir'] = 'C:\Logs'
default['mssql']['sqltempdblogdir'] = 'C:\Logs'
default['mssql']['iacceptsqlserverlicenseterms'] = 'True'
default['mssql']['tcpenabled'] = '1'
default['mssql']['npenabled'] = '1'
default['mssql']['browsersvcstartuptype'] = 'Automatic'
default['mssql']['rssvcstartuptype'] = 'Automatic'

if node['mssql']['instancename'] == 'MSSQLSERVER'
  default['mssql']['service_name'] = node['mssql']['instancename']
else
  default['mssql']['service_name'] = "MSSQL$#{node['mssql']['instancename']}"
end

