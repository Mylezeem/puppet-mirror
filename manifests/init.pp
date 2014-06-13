# == Class: mirror
#
# A puppet module to create repositories mirrors
#
# === Parameters

# === Examples
#
#  include mirror
#
# === Authors
#
# Yanis Guenane <yguenane@gmail.com>
#
# === Copyright
#
# Copyright 2014 Yanis Guenane
#
class mirror {
  include ::rsync::server
  include ::apache
  include ::vsftpd
}
