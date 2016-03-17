name 'gitlab-ce'
maintainer 'Danny Roberts'
maintainer_email 'danny@thefallenphoenix.net'
license 'BSD-2-Clause'
description 'Installs/Configures GitLab CE (Community Edition).'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.0.0'

%w(centos oracle redhat scientific).each do |os|
  supports os, '>= 6.0'
end

source_url 'https://github.com/kemra102/gitlab-ce-cookbook' if
  respond_to?(:source_url)
issues_url 'https://github.com/kemra102/gitlab-ce-cookbook/issues' if
  respond_to?(:issues_url)

depends 'yum-gitlab-ce', '>= 0.1.1'
