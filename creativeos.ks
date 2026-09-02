lang en_US.UTF-8
keyboard us
timezone UTC
auth --enableshadow --passalgo=sha512
selinux --disabled
firewall --enabled --service=mdns
repo --name="fedora" --mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=fedora-$releasever&arch=$basearch
repo --name="updates" --mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=updates-released-$releasever&arch=$basearch

%packages
@base-x
@xfce-desktop
kernel
grub2-efi-x64
grub2-pc
glibc-all-langpacks
git
curl
wget
vim
neovim
zsh
tmux
htop
python3
nodejs
npm
gcc
gcc-c++
make
podman
xfce4-terminal
chromium
openssh-server
ripgrep
fd-find
unzip
xz
figlet
fastfetch
%end

%post
echo "CreativeOS" > /etc/hostname
git clone https://github.com/NvChad/NvChad /etc/skel/.config/nvim --depth 1
git clone https://github.com/flutter/flutter.git /opt/flutter -b stable --depth 1
npm install -g pm2
cat << 'ZSH' >> /etc/skel/.zshrc
export PATH="/opt/flutter/bin:$PATH"
alias docker="podman"
alias ll="ls -la"
figlet -f ansi-shadow "Creative OS"
fastfetch
ZSH
systemctl enable sshd
%end
