source "https://supermarket.chef.io"

metadata

cookbook 'kibana', git: 'https://github.com/realityforge/chef-kibana.git'
group :vagrant do
    cookbook 'apt'
    cookbook 'apache2'
    cookbook 'nginx'
    cookbook 'java'
    cookbook 'elasticsearch'
end
