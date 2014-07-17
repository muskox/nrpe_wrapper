#
# Author:: Scott Pustay <scott.psutay@gmail.com>
# Cookbook Name:: nrpe_wrapper
# Recipe:: default
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "apt" # this runs apt-get update which gets the latest nagios-nrpe-server package

include_recipe "nrpe"

template "#{node['nrpe']['conf_dir']}/nrpe.d/my_custom_nrpe.cfg" do
  source "my_custom_nrpe.cfg.erb"
  owner node['nrpe']['user']
  group node['nrpe']['group']
  mode 00644
  variables(
    :mon_host => node["nrpe"]["allowed_hosts"],
    :nrpe_directory => "#{node['nrpe']['conf_dir']}/nrpe.d"
  )
  notifies :restart, "service[#{node['nrpe']['service_name']}]"
end

if platform?("debian", "ubuntu")

  cookbook_file "/usr/lib/nagios/plugins/check_nfs.sh" do
	source "plugins/check_nfs.sh"
	action :create_if_missing
	mode	0755
  end

end

service node['nrpe']['service_name'] do
  action [:start, :enable]
  supports :restart => true, :reload => true, :status => true
end   


