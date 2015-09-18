include_recipe './resource.rb'
include_recipe 'nodebrew::common'

# load setting
NODEBREW_USER = (node['nodebrew']['user'] || 'vagrant')
NODEBREW_USER_HOME = "/home/#{NODEBREW_USER}"
NODEBREW_ROOT = "#{NODEBREW_USER_HOME}/.nodebrew"
NODEBREW_PROFILE_PATH = "#{NODEBREW_USER_HOME}/.bash_profile"

# install nodebrew
nodebrew_install NODEBREW_ROOT do
  user NODEBREW_USER
  profile_path NODEBREW_PROFILE_PATH
end

# install nodejs and npm
(node['nodebrew']['versions'] || {}).each do |node_version, npms|
  node_install node_version do
    user NODEBREW_USER
    profile_path NODEBREW_PROFILE_PATH
  end
  npms.each do |npm|
    if npm.kind_of?(Hash)
      npm_install npm['name'] do
        self.node_version node_version
        version npm['version'] if npm['version']
        user NODEBREW_USER
        profile_path NODEBREW_PROFILE_PATH
      end
    else
      npm_install npm do
        self.node_version node_version
        user NODEBREW_USER
        profile_path NODEBREW_PROFILE_PATH
      end
    end
  end
end

# set use version
if node['nodebrew']['use']
  execute "nodebrew use #{node['nodebrew']['use']}" do
    command ". #{NODEBREW_PROFILE_PATH} && nodebrew alias default #{node['nodebrew']['use']} && nodebrew use default"
    user NODEBREW_USER
  end
end
