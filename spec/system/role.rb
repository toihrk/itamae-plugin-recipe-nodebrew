execute 'apt-get update -y' if node[:platform] =~ /ubuntu/
include_recipe 'nodebrew::system'
