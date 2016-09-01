# Class: createuser
# ===========================
#
# Full description of class createuser here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'createuser':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class createuser ( 
   $localuser='localuser',
   $localgroup='skillbuilder',
){

# create a new windows group

group { $localgroup :
   ensure   => present,
}

# create a local user and add it to the newly created group.
user { $localuser :
  ensure   => present,
  comment  => 'A local user for the skillbuilder exercise',
  groups   => $localgroup,
  require  => Group[$localgroup],
  }
 
# Adding the $localgroup to 'Log on as a service' list

local_security_policy { 'Log on as a service' :
 ensure        => present,
 policy_value  => '*S-1-5-21-0,*S-1-5-21-640554070-2674357121-2619698584-1000',
 } 

}

