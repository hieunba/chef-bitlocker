#
# Cookbook:: bitlocker
# Recipe:: default
#
# Copyright:: 2018, Nghiem Ba Hieu, All Rights Reserved.
if node['platform_family'] == 'windows'
  if node['kernel']['name'] =~ /Windows 7 Professional/
    log 'Bitlocker supports' do
      level :warn
      message 'Windows 7 Professional does not support Bitlocker'
    end
    return
  end

  ::Chef::Recipe.send(:include, EBT::Helpers)

  include_recipe 'bitlocker::install' unless manage_bde_installed?

  node.normal['bitlocker_encrypted'] = if bitlocker_encrypted?
                                         true
                                       else
                                         false
                                       end
end
