class motd {
	
	$hostname = $facts['networking']['fqdn']
	$os_name = $facts['os']['name']
	$os_release = $facts['os']['release']
	$ip = $facts['networking']['ip']

	if ($hostname == 'server.localpuppet.com') {	
		file { '/etc/motd':
			path	=> '/etc/motd',
			ensure	=> file,
			content => "\n[Puppet Master ${ip}] ${hostname} ${os_name} ${os_release}\n\n",
		}
	}
	elsif ($hostname == 'node1.localpuppet.com') {
        file { '/etc/motd':
            path    => '/etc/motd',
            ensure  => file,
            content => "\n[Puppet Node1 ${ip}] ${hostname} ${os_name} ${os_release}\n\n",
        }
    }
	else {
		file { '/etc/motd':
            path    => '/etc/motd',
            ensure  => file,
            content => "\n[Puppet Node2 ${ip}] ${hostname} ${os_name} ${os_release}\n\n",
        }
	}
}   
