# == Class: mirrors
#
# An helper class to create several mirrors in one call
#
# == Parameters
#
# [* mirrors *]
#   (Hash) Mirrors tp create
#
class mirror::mirrors (
  $mirrors = undef,
} (
  create_resource('mirror::mirror', $mirrors)
)
