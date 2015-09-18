NODEBREW_DEFAULT_PROFILE_PATH = '/etc/profile.d/nodebrew.sh'

define :nodebrew_install, user: nil, profile_path: NODEBREW_DEFAULT_PROFILE_PATH do
  params = self.params

  execute "#{params[:name]}" do
    command "export NODEBREW_ROOT=#{params[:name]} && curl -L git.io/nodebrew | perl - setup"
    user params[:user] if params[:user]
  end

  setting = <<-EOS
export NODEBREW_ROOT=#{params[:name]}
export PATH=$NODEBREW_ROOT/current/bin:$PATH
EOS
  execute 'add nodebrew settings' do
    command "echo '#{setting}' >> #{params[:profile_path]}"
    user params[:user] if params[:user]
    not_if "test `touch #{params[:profile_path]} && cat #{params[:profile_path]} | grep 'nodebrew' -c` != 0"
  end
end

define :node_install, user: nil, profile_path: NODEBREW_DEFAULT_PROFILE_PATH do
  params = self.params

  execute "node install #{params[:name]}" do
    command ". #{params[:profile_path]} && nodebrew install-binary #{params[:name]}"
    user params[:user] if params[:user]
    not_if "test `. #{params[:profile_path]} && nodebrew ls | grep '#{params[:name]}' -c` != 0"
  end
end

define :npm_install, version: nil, node_version: nil, user: nil, profile_path: NODEBREW_DEFAULT_PROFILE_PATH do
  params = self.params

  execute "npm install #{params[:name]}" do
    command ". #{params[:profile_path]} && nodebrew use #{params[:node_version]} && npm install -g #{params[:name]}#{params[:version] ? "@#{params[:version]}" : ''}"
    user params[:user] if params[:user]
  end
end
