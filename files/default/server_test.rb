require File.expand_path('../helpers.rb', __FILE__)
include Helpers::Mssql


  describe_recipe "mssql::server" do

    describe "packages" do
            # = Checking for package install =
#        it "installs SQL Server" do
           #package(node['mssql']['server']['package_name']).must_be_installed
#           package("Microsoft SQL Server 2008 R2 (64-bit)").must_be_installed
#        end
        
    end 


    describe 'files' do
      it "creates the data directory" do
        directory(node['mssql']['config_ini']['installsqldatadir']).must_exist
      end
      it "creates the log directory" do
        directory(node['mssql']['config_ini']['sqluserdblogdir']).must_exist
      end
      it "creates the instance directory" do
        directory(node['mssql']['config_ini']['instancedir']).must_exist
      end
    end

    describe 'services' do


      it "should be running as a service" do
        service(node['mssql']['service_name']).must_be_running
      end
      #it "boots on startup" do
        #service(service_name).must_be_enabled
      #end
      #it "should be running as a service" do
        #service(node['mssql']['config_ini']['instance_name']).must_be_running
      #end
      #it "boots on startup" do
        #service(node['mssql']['config_ini']['instance_name']).must_be_enabled
      #end

          it "should be running" do
                  service("SQLWriter").must_be_running
          end
          #it "makes sure sql agent service is running" do
                  #not service("SQLSERVERAGENT").must_be_running
          #end
          #it "makes sure sql browser service is running" do
                  #not service("SQLBrowser").must_be_running
          #end
    end

end


