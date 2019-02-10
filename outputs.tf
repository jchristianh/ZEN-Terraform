# display quick summary of ip and connnection information
output "Connection Information" {
  value = <<EOF


----------------------------------------------------------------------------------------------
Connection Details for ${module.tzg_www.www_name}:
----------------------------------------------------------------------------------------------
Private IP : ${module.tzg_www.pri_ip}
Public IP  : ${module.tzg_www.pub_ip}

SSH via    : ssh -i "${module.tzg_www.ssh_key_path}/${module.tzg_www.ssh_key_name}.pri" ${module.tzg_www.ssh_user}@${module.tzg_www.pub_dns}
Ansible    : ansible-playbook -i '${module.tzg_www.pub_ip},' --private-key=${module.tzg_www.ssh_key_name}.pri -u centos provision_all.yml

Installed  : ${module.tzg_www.install_pkgs}

----------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------
Connection Details for ${module.tzg_db.db_name}:
----------------------------------------------------------------------------------------------
Private IP : ${module.tzg_db.pri_ip}
Public IP  : ${module.tzg_db.pub_ip}

SSH via    : ssh -i "${module.tzg_db.ssh_key_path}/${module.tzg_db.ssh_key_name}.pri" ${module.tzg_db.ssh_user}@${module.tzg_db.pub_dns}
Ansible    : ansible-playbook -i '${module.tzg_db.pub_ip},' --private-key=${module.tzg_db.ssh_key_name}.pri -u centos provision_all.yml

Installed  : ${module.tzg_db.install_pkgs}

----------------------------------------------------------------------------------------------

EOF
}
