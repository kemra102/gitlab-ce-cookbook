require 'serverspec'

set :backend, :exec

%w(curl policycoreutils openssh-server openssh-clients postfix
   gitlab-ce).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe file('/etc/gitlab/gitlab.rb') do
  it { should be_file }
  it { should be_mode 600 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should contain 'git_data_dir "/var/opt/gitlab/git-data"' }
  it { should contain 'manage_accounts[\'enable\'] = true' }
end

describe port('25') do
  it { should be_listening.on('127.0.0.1').with('tcp') }
  it { should be_listening.on('::1').with('tcp6') }
end

describe port('80') do
  it { should be_listening.on('0.0.0.0').with('tcp') }
end

describe port('8080') do
  it { should be_listening.on('127.0.0.1').with('tcp') }
end
