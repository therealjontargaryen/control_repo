class profile::ssh_server {
  package {'openssh-server':
    ensure => present,
  }
  service { 'sshd':
    ensure => 'running',
    enable => 'true',
  }
  ssh_authorized_key { 'root@master.puppet.vm':
    ensure => present,
    user   => 'root',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDOrG7wfkumTwiG6RHz6a3TOOHQ5YsSqaYNp/GUw5T7US7ZYRsiQtPPN/YzqO4MZN3I6YfmeI+eqQWdFz2i/eKmfqpyxVd08k0F+XhT/USDly00EEBoRYPoQqLZlmIVbKsHpuoNwWYmFFGZdhuIn/nB+92+pzoCrmXyONn4Aknj9UXB7FKn4TZlx8/xBeEa3Ti/bmZsJ7f7JSOdL/DXI0gPopnubMpHqnFjXv7YG0tZ9u4CjLRYlvG3G7s3A0/915QR884pMqcF/WnWD/s3fQ5CTlFZA1IREnogBrxZAgudCahtyLoNWWlPKMRD9MIvyDxuv3HumxTdZ3Ey+zvljDrl',
  }
}
