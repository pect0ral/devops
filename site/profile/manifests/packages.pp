package { 'lsof':
  ensure => installed,
}

package { 'git':
  ensure => installed,
}
package {'php':
  ensure => installed,
}

