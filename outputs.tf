# Display summary of Connnection Information
output "Connection_Information" {
  value = <<EOF

----------------------------------------------------------------------------------------------
Connection Details for ${module.tzg_www.www_name}:
----------------------------------------------------------------------------------------------
Private IP : ${module.tzg_www.pri_ip}
Public IP  : ${module.tzg_www.pub_ip}

SSH via    : ssh -i "${module.tzg_ssh_keys.ssh_key_path}/${module.tzg_ssh_keys.ssh_key_name}.pri" ${module.tzg_ssh_keys.ssh_key_user}@${module.tzg_www.pub_dns}
Ansible    : ansible-playbook -i '${module.tzg_www.pub_ip},' --private-key=${module.tzg_ssh_keys.ssh_key_path}/${module.tzg_ssh_keys.ssh_key_name}.pri -u centos ${var.ansible_playbook} -e system_role=${var.www_ansible_role}

----------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------
Connection Details for ${module.tzg_db.db_name}:
----------------------------------------------------------------------------------------------
Private IP : ${module.tzg_db.pri_ip}
Public IP  : ${module.tzg_db.pub_ip}

SSH via    : ssh -i "${module.tzg_ssh_keys.ssh_key_path}/${module.tzg_ssh_keys.ssh_key_name}.pri" ${module.tzg_ssh_keys.ssh_key_user}@${module.tzg_db.pub_dns}
Ansible    : ansible-playbook -i '${module.tzg_db.pub_ip},' --private-key=${module.tzg_ssh_keys.ssh_key_path}/${module.tzg_ssh_keys.ssh_key_name}.pri -u centos ${var.ansible_playbook} -e system_role=${var.db_ansible_role}

----------------------------------------------------------------------------------------------

EOF
}

