# Let's kill a process
exec { 'kill_killmenow_process':
  command     => 'pkill killmenow',
  refreshonly => true,
  logoutput   => true,
}
