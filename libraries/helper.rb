module EBT
  module Helpers
    include Chef::Mixin::PowershellOut

    def manage_bde_installed?
      cmd = "ls #{ENV['SYSTEMROOT']}\\System32"
      cmd_out = powershell_out!(cmd, {:returns => [0,2]})
      cmd_out.stderr.empty? && (cmd_out.stdout =~ /manage-bde/)
    end
  end
end
