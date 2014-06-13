#puppet-mirror

[![Build Status](https://travis-ci.org/Mylezeem/puppet-mirror.svg?branch=master)](https://travis-ci.org/Mylezeem/puppet-mirror)

##Overview
A puppet module that configure the system to offer repositories mirrros

##Module Description
This module aims to configure your system to offer public/private repositories mirrors.

Using this module, one can offer the mirrors using three differents protocol :

  * HTTP
  * FTP
  * RSync

##Usage

```puppet
mirror::mirror { 'puppetlabs' :
  path          => '/srv/mirrors/',
  source        => 'yum.puppetlabs.com::packages/yum/',
  http_enable   => true,
  ftp_enable    => true,
  ftp_path      => '/var/ftp',
  rsync_enable  => true,
  http_hostname => 'puppetlabs.mirror.mylezeem.com',
}
```

##Parameters

####`path`

Path in the filesystem where to install the files

####`source`

rsync url where to get the source files.

**Note** : It only works with RSync at the moment.

####`http_enable`

Whether to enable HTTP access to the mirror or not

####`ftp_enable`

Whether to enable FTP access to the mirror or not

####`ftp_path`

Path to the directory served by ftp

####`rsync_enable`

Whether to enable RSync access to the mirror or not

####`http_hostname`

The Apache servername to deliver the files
