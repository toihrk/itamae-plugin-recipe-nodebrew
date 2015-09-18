require 'spec_helper'

describe command('. /home/vagrant/.bash_profile; which nodebrew') do
  let(:disable_sudo) { true }
  its(:stdout) { should match '/home/vagrant/.nodebrew/current/bin/nodebrew' }
end

%w[io@v3.3.0 v4.0.0].each do |node_version|
  describe command(". /home/vagrant/.bash_profile; nodebrew ls | grep '#{node_version}'") do
    let(:disable_sudo) { true }
    its(:stdout) { should match /#{Regexp.escape(node_version)}/ }
  end
end

describe command(". /home/vagrant/.bash_profile; nodebrew use io@v3.3.0 && npm ls -g coffee-script") do
  let(:disable_sudo) { false }
  its(:stdout) { should match /1\.9\.3/ }
end

describe command(". /home/vagrant/.bash_profile; nodebrew use v4.0.0 && npm ls -g gulp") do
  let(:disable_sudo) { false }
  its(:stdout) { should match /gulp/ }
end

describe command(". /home/vagrant/.bash_profile; node -v") do
  let(:disable_sudo) { true }
  its(:stdout) { should match /v4\.0\.0/ }
end
