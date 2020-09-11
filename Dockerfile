FROM kalilinux/kali-rolling

LABEL maintainer="chris.bensch@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive
# Update
WORKDIR /opt
RUN apt-get -y update && apt-get -y dist-upgrade \
&& apt-get -y install git zsh wget \
&& wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh \
&& apt-get -y install vim net-tools whois netcat exploitdb man-db dirb nikto wpscan uniscan python-pip python3-pip tor proxychains \
&& apt-get -y autoremove && apt-get -y clean \
&& git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git /opt/peass \
&& git clone https://github.com/ohpe/juicy-potato.git /opt/juicy-potato \
&& git clone https://github.com/Tib3rius/AutoRecon.git /opt/autorecon

COPY config/zshrc /root/.zshrc
COPY config/proxychains.conf /etc/proxychains.conf

ENTRYPOINT ["/bin/zsh"]
