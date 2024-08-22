# Create the holberton user if it does not exist
user { 'holberton':
  ensure     => 'present',
  managehome => true,
  home       => '/home/holberton',
  shell      => '/bin/bash',
}

# Ensure the home directory has the correct permissions
file { '/home/holberton':
  ensure  => 'directory',
  owner   => 'holberton',
  group   => 'holberton',
  mode    => '0755',
}

# Ensure the holberton user can open a specific file
file { '/path/to/your/file':
  ensure  => 'file',
  owner   => 'holberton',
  group   => 'holberton',
  mode    => '0644',
}

# Ensure holberton user has the right permissions to open files in a directory
file { '/path/to/your/directory':
  ensure  => 'directory',
  owner   => 'holberton',
  group   => 'holberton',
  mode    => '0755',
  recurse => true,
}
