$script = <<SCRIPT
useradd usuario
usermod -aG wheel usuario
mkdir /home/usuario/.ssh/
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCy5aV5gJnowKYMfEJSUbPqjT6jds7hu4YD5YG3PEIRxt5uIumiY1iCu6UcX+6pgDp9y9yZbcCc6y8i+6UK1f9MIqBDQEv1tP2OUqu52YcC3VDWM0AWpje912dWtV4NInG6inQKoDeU9jjGQyOY7Ma83Yh+MO7cw7e8inDImva4+c6IBBJ+qaFAPvCKD+E1kfaYeY5gqIZkZhD955aqoM0ritPR02vjMsBpxEGLDvkPmRtP47kf0lOnrZJeG9RylOAZ91O6z8GlNQ8nf6ERUOLZIdby668NhJu7O20wMhkthnV6hxz7Sd5HdkKp96LUFX/lWAf10ZdekmSmb0FaHx5f usuario@ops.lab.com" >/home/usuario/.ssh/authorized_keys
chown -R usuario:usuario /home/usuario/.ssh/
chmod 700 /home/usuario/.ssh
chmod 640 /home/usuario/.ssh/authorized_keys
SCRIPT

Vagrant.configure(2) do |config|
  config.ssh.insert_key = false
  config.vm.synced_folder ".","/vagrant", disabled:true

  config.vm.define :ops do |ops1|
    ops1.vm.box = "geerlingguy/centos7"
    ops1.vm.hostname = 'ops.lab.com'
    ops1.vm.network :private_network, ip: "192.168.1.2"
    ops1.vm.provision "file", source: "~/superintento2/superintento", destination: "/tmp/llave"
    ops1.vm.provision "shell", path: "installansible.sh"
  end

  config.vm.define :jenkins do |jenkins1|
    jenkins1.vm.box = "geerlingguy/centos7"
    jenkins1.vm.hostname = 'jenkins.lab.com'
    jenkins1.vm.network :private_network, ip: "192.168.1.3"
    jenkins1.vm.provision "shell", path: "installjenkins.sh"
    jenkins1.vm.provision "shell", inline: $script
  end
  config.vm.define :prod do |prod1|
    prod1.vm.box = "geerlingguy/centos7"
    prod1.vm.hostname = 'prod.lab.com'
    prod1.vm.network :private_network, ip: "192.168.1.4"
    prod1.vm.provision "shell", inline: $script
  end
end
