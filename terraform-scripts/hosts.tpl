[cassandra]
%{ for index,ip in launch_ec2_instances ~}
${format("cs%d", index + 1)}  ansible_host=${ip}  ansible_ssh_private_key_file=../../../pem-keys/${pemkey}.pem ansible_user=${usr}
%{ endfor ~}

