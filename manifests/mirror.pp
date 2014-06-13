# == Define: mirror
#
#  The actual mirror to create
#
# == Parameters
#
# [* path *]
#   (string) Path in the filesystem where to install the files
#
# [* source *]
#   (string) rsync url where to get the source files
#
# [* http_enable *]
#   (boolean) Whether to enable HTTP access to the mirror or not
#   Defaults: true
#
# [* ftp_enable *]
#   (boolean) Whether to enable FTP access to the mirror or not
#   Defaults: true
#
# [* ftp_path *]
#   (string) Path to the directory served by ftp
#   Defaults: /var/ftp
#
# [* rynsc_enable *]
#   (boolean) Whether to enable RSYNC access to the mirror or not
#   Defaults: false
#
# [* http_hostname *]
#   (string) Apache servername the mirror will be bound to or not
#
define mirror::mirror (
  $path,
  $source,
  $http_enable     = true,
  $ftp_enable      = true,
  $ftp_path        = '/var/ftp',
  $rsync_enable    = false,
  $http_hostname   = undef,
) {

  include mirror

  file { [$path, "${path}/${name}"]:
    ensure => directory,
  }

  rsync::get { "${path}/${name}":
    path    => "${path}/${name}",
    source  => $source,
    purge   => true,
    timeout => 0,
    require => File[$path],
  }

  if $rsync_enable {
    rsync::server::module {$name :
      path => "${path}/${name}",
    }
  }

  if $http_enable {
    apache::vhost {$http_hostname :
      docroot => "${path}/${name}",
    }
  }

  if $ftp_enable {
    file {"${ftp_path}/${name}":
      ensure  => directory,
      require => [Class['vsftpd'], Rsync::Get["${path}/${name}"]],
    } ->
    mount { "${ftp_path}/${name}":
      ensure  => mounted,
      device  => "${path}/${name}",
      fstype  => 'none',
      options => 'rw,bind',
      atboot  => true,
    }
  }

}

