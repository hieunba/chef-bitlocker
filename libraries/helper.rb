module EBT
  module Helpers
    include Chef::Mixin::PowershellOut

    def manage_bde_installed?
      cmd = "ls #{ENV['SYSTEMROOT']}\\System32"
      cmd_out = powershell_out!(cmd, {:returns => [0,2]})
      cmd_out.stderr.empty? && (cmd_out.stdout =~ /manage-bde/)
    end
    def bitlocker_encrypted?
      cmd = Mixlib::ShellOut.new("manage-bde -status #{ENV['SYSTEMDRIVE']} | findstr /i Conversion")
      run = cmd.run_command
      run.stderr.empty? && (run.stdout =~ /Encrypted/)
    end
  end
end
