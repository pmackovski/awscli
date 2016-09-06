#Provisions a ubuntu environment using the default virtualbox provider.
#Installs AWS CLI and other dependencies.

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "awscli"
  config.vm.post_up_message = "Run 'aws configure' after provisioning this environment for the first time."
  config.vm.provision "shell", inline: <<-SHELL
    apt-get install -y tree apg

    # install pip and AWS CLI
    curl -O https://bootstrap.pypa.io/get-pip.py
    python2.7 get-pip.py
    pip install awscli

    # configure AWS CLI tab completion
    echo complete -C '/usr/local/bin/aws_completer' aws >> /home/vagrant/.bash_profile
  SHELL
end
