### ZEN Terraform
-----

Simple Terraform project to create a VPC, Routes, ACLs, and a Web node. Web node updates itself, and installs a few essential packages for now. At this time the Web node deployment is not flushed out, and lots of other tidying needs to be completed.


#### Run the project:
-----
Make 'ssh_keys' folder:

```
mkdir ssh_keys
```

Generate SSH keys:

```
ssh-keygen -t rsa
```
...save to the 'ssh_keys' folder created above. Default keys are setup to be tzg.pub and tzg.pri. These values can be edited in [code]www/variables.tf[/code]


Finally run the project via Terraform:

```
terraform apply
```

#### GitLab Project:
[ZEN - Terraform](https://git.thezengarden.net/zen/zen-tf)

#### Maintainers:
[Chris H. \<chris@thezengarden.net\>](mailto:chris@thezengarden.net)

