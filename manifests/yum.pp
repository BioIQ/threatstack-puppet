# Setup yum repo and install the threatstack agent
#
# == Authors
#
# Pete Cheslock
#
class threatstack::yum {

  # only support Centos 6 and higher  
  if(versioncmp($::operatingsystemmajrelease, 6) >= 0) {
    $ensure_package = $threatstack::ensure
    $repo_enabled = 1
  }
  else {
    $ensure_package = 'absent'
    $repo_enabled = 0
  }

  yumrepo { 'threatstack':
    descr    => 'Threat Stack Package Repository',
    enabled  => $repo_enabled,
    baseurl  => $threatstack::repo_url,
    gpgcheck => 1,
    gpgkey   => $threatstack::gpg_key
  }

  package { $threatstack::ts_package:
    ensure  => $ensure_package,
    require => [ Yumrepo['threatstack'] ]
  }
}
