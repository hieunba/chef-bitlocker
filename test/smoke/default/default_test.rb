# # encoding: utf-8

# Inspec test for recipe bitlocker::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

if os.windows?
  describe windows_feature('bitlocker') do
    it { should be_installed }
  end
end
