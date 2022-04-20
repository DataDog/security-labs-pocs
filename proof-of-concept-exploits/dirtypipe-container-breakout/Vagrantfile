# -*- mode: ruby -*-
# vi: set ft=ruby :

# Environment variables:
#
# SKIP_BCC_BUILD: Set to skip the building bcc from source

$ubuntu_deps = <<EOF
apt-get -qq update
apt-get -qq install docker.io
apt-get -qq install --no-install-recommends pkg-config
EOF

Vagrant.configure("2") do |config|
  boxes = {
    'ubuntu-21.04'     => {
      'image'          => 'ubuntu/impish64',
      'scripts'        => [ $ubuntu_deps, ],
      'fix_console'    => 0,
    }
  }

  boxes.each do | name, params |
    config.vm.define name do |box|
      box.vm.box = params['image']
      box.vm.provider "virtualbox" do |v|
        v.memory = 4096
        v.cpus = 2
        if params['fix_console'] == 1
          v.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
          v.customize ["modifyvm", :id, "--uartmode1", "file", "./#{name}_ttyS0.log"]
        end
      end
      (params['scripts'] || []).each do |script|
        box.vm.provision :shell, inline: script
      end
      config.vm.post_up_message = <<-HEREDOC
#######
Ready to go!
#######
      HEREDOC
    end
  end
end

