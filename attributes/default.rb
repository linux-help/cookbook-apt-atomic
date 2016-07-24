#
# Cookbook Name:: apt-atomic
# Attributes:: default
#

# Debian-ish platform support for this cookbook and the Atomic repository.
# Designed to be a private attribute however it can be overridden in the case
# OSSEC supports additional platforms and this cookbook has not been updated
# yet.
#
# The hash key is the codename of the OS/version.  If the hash value evaluates
# to true, the OS/version is considered supported.

default['apt-atomic']['debian']['supported-codenames'] = {
    wheezy:	true,	# Debian 7.x
    jessie:	true,	# Debian 8.x
    stretch:	true,	# Debian 9.x
    sid:	true    # Debian Devel
}
default['apt-atomic']['ubuntu']['supported-codenames'] = {
    precise:	true,	# Ubuntu 12.04
    trusty:	true,	# Ubuntu 14.04
    xenial:	true    # Ubuntu 16.06
}

codename = node['lsb']['codename']

default['apt-atomic']['repos'].tap do |repo|
    repo['atomic'].tap do |value|
        # Does this cookbook manage the install of the repo?
        value['managed'] = true
        # Set the repo name
        value['repo_name'] = 'atomic'
        # URI of Repo
        value['uri'] = "http://ossec.wazuh.com/repos/apt/debian"
        # Package distribution of repo
        value['distribution'] = codename
        # Repo Package Groupings
        value['components'] = ['main']
        # Cookbook File For Signing Key
        value['key'] = 'http://ossec.wazuh.com/repos/apt/conf/ossec-key.gpg.key'
	# Whether or not to include the repo source repo
	value['deb-src'] = false
    end
end

