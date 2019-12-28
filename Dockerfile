FROM kalilinux/kali-rolling

LABEL maintainer="chris.bensch@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive
# Update
RUN apt-get -qq update && apt-get -qqy dist-upgrade \
&& apt-get -qqy install git zsh wget \
&& wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh \
&& apt-get -qqy install vim kali-linux-top10 net-tools whois netcat exploitdb man-db dirb nikto wpscan uniscan python-pip tor proxychains openjdk-8-jdk \
&& apt-get -qqy autoremove && apt-get -qqy clean 

COPY config/zshrc /root/.zshrc
COPY config/proxychains.conf /etc/proxychains.conf

ENTRYPOINT ["/bin/zsh"]
