# Kali Linux Rolling with useful tools by Chris Bensch
FROM kalilinux/kali-rolling

ARG DEBIAN_FRONTEND=noninteractive
# Update
RUN apt-get -qq update && apt-get -qqy dist-upgrade

# Install ZSH shell with custom settings and set it as default shell
RUN apt-get -qqy install git zsh wget

RUN wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

COPY config/zshrc /root/.zshrc

# Install Kali Linux "Top 10" metapackage and a few useful tools
RUN apt-get -qqy install vim kali-linux-top10 net-tools whois netcat exploitdb man-db dirb nikto wpscan uniscan python-pip tor proxychains

RUN apt-get -qqy autoremove && apt-get -qqy clean

# Install some useful hardware packages
#RUN apt-get -y install pciutils usbutils 

# Configure proxychains with Tor
COPY config/proxychains.conf /etc/proxychains.conf

ENTRYPOINT ["/bin/zsh"]
