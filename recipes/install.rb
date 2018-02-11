#
# Cookbook:: bitlocker
# Recipe:: install
#
# Copyright:: 2018, Nghiem Ba Hieu, All Rights Reserved
powershell_script 'enables Bitlocker' do
  code <<-EOH
    Install-WindowsFeature -Name BitLocker,BitLocker-NetworkUnlock,EnhancedStorage -IncludeAllSubFeature -IncludeManagementTools
  EOH
  notifies :reboot_now, 'reboot[bitlocker feature reboot]', :immediately
end

reboot 'bitlocker feature reboot' do
  action :nothing
  only_if { reboot_pending? }
end
