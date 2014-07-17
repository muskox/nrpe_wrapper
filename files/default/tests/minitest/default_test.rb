require File.expand_path('../support/helpers', __FILE__)

describe_recipe 'nrpe_wrapper::default' do

  include Helpers::CommunityTests

  it "creates nrpe config file" do
    file("/etc/nagios/nrpe.cfg").must_exist
    file("/etc/nagios/nrpe.cfg").must_exist.with(:owner,"nagios")
    file("/etc/nagios/nrpe.cfg").must_exist.with(:group,"nagios")
    file("/etc/nagios/nrpe.cfg").must_exist.with(:mode,"644")
  end

  it "creates nrpe config directory" do
    directory("/etc/nagios/nrpe.d").must_exist
    directory("/etc/nagios/nrpe.d").must_exist.with(:owner,"nagios")
    directory("/etc/nagios/nrpe.d").must_exist.with(:group,"nagios")
    directory("/etc/nagios/nrpe.d").must_exist.with(:mode,"755")
  end

  it "creates my custom nrpe config file" do
    file("/etc/nagios/nrpe.d/my_custom_nrpe.cfg").must_exist
    file("/etc/nagios/nrpe.d/my_custom_nrpe.cfg").must_exist.with(:owner,"nagios")
    file("/etc/nagios/nrpe.d/my_custom_nrpe.cfg").must_exist.with(:group,"nagios")
    file("/etc/nagios/nrpe.d/my_custom_nrpe.cfg").must_exist.with(:mode,"644")
  end

  it "the nrpe service must be running" do
    service("nrpe").must_be_running
  end

end
