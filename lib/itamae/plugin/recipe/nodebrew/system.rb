include_recipe './resource.rb'
include_recipe 'nodebrew::common'

# load setting
NODEBREW_ROOT = '/usr/local/nodebrew'
NODEBREW_PROFILE_PATH = '/etc/profile.d/nodebrew.sh'

# install nodebrew
nodebrew_install NODEBREW_ROOT do
  profile_path NODEBREW_PROFILE_PATH
end



# install nodejs and npm
(node['nodebrew']['versions'] || {}).each do |node_version, npms|
  node_install node_version do
    profile_path NODEBREW_PROFILE_PATH
  end
  npms.each do |npm|
    if npm.kind_of?(Hash)
      npm_install npm['name'] do
        self.node_version node_version
        version npm['version'] if npm['version']
        profile_path NODEBREW_PROFILE_PATH
      end
    else
      npm_install npm do
        self.node_version node_version
        profile_path NODEBREW_PROFILE_PATH
      end
    end
  end
end

# set use version
if node['nodebrew']['use']
  execute "nodebrew use #{node['nodebrew']['use']}" do
    command ". #{NODEBREW_PROFILE_PATH} && nodebrew alias default #{node['nodebrew']['use']} && nodebrew use default"
  end
end
