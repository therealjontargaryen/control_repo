class minecraft {
  file { '/etc/environment':
    content => inline_template("export https_proxy=http://www-proxy-hqdc.us.oracle.com:80")
  }
  file { '/etc/environment':
    content => inline_template("export HTTPS_PROXY=http://www-proxy-hqdc.us.oracle.com:80")
  }
  file {'/opt/minecraft':
    ensure => directory
  }
  file {'/opt/minecraft/minecraft_server.jar':
    ensure => file
    source => 'https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar'
  }
  package {'java':
    ensure => present
  }
  file {'/opt/minecraft/eula.txt':
    ensure => file,
    content => 'eula=true'
  }
  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    source => 'puppet:///modules/minecraft/minecraft.service',
  }
  service {'minecraft':
    ensure => running,
    enable => true,
  }
}
