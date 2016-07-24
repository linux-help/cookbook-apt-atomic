name             'apt-atomic'
maintainer       'Eric Renfro'
maintainer_email 'psi-jack@linux-help.org'
license          'Apache 2.0'
description      'Installs and configures the NUX Community Desktop Yum Repository'
long_description ''
version          '0.1.1'
issues_url       'https://git.linux-help.org/Linux-Help/cookbook-apt-atomic/issues'
source_url       'https://git.linux-help.org/Linux-Help/cookbook-apt-stomic'

%w{ debian }.each do |os|
	supports os, '>= 5.0'
end
%w{ ubuntu }.each do |os|
	supports os, '>= 12.04'
end

depends 'apt', '>= 3.0'

