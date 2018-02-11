#
# Cookbook:: bitlocker
# Recipe:: default
#
# Copyright:: 2018, Nghiem Ba Hieu, All Rights Reserved.
::Chef::Recipe.send(:include, EBT::Helpers)

include_recipe 'bitlocker::install' unless manage_bde_installed?
