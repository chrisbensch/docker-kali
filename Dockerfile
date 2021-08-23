FROM kalilinux/kali-bleeding-edge

LABEL maintainer="chris.bensch@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

# Update
#RUN echo "deb https://kali.download/kali kali-rolling main contrib non-free" > /etc/apt/sources.list
RUN apt update && apt -y dist-upgrade
RUN apt -y install metasploit-framework python3-pip zsh zsh-autosuggestions zsh-common zsh-syntax-highlighting amass binwalk bulk-extractor cewl commix crackmapexec dirb dnsenum dnsrecon enum4linux exploitdb gpp-decrypt hash-identifier hashid hydra impacket-scripts john masscan mimikatz nbtscan ncrack netdiscover nfs-common nikto nmap onesixtyone passing-the-hash patator pdf-parser pdfid powershell-empire powersploit python3-impacket python3-scapy responder smbmap snmpcheck sqlmap unix-privesc-check wafw00f webshells weevely wfuzz whatweb windows-binaries winexe wordlists wpscan apache2 cifs-utils dos2unix git hashdeep p7zip-full php php-mysql samba screen python2 seclists curl enum4linux feroxbuster impacket-scripts nbtscan nikto nmap onesixtyone oscanner redis-tools smbclient smbmap snmp sslscan sipvicious tnscmd10g whatweb wkhtmltopdf

RUN service postgresql start && msfdb reinit

RUN git clone --branch beta https://github.com/Tib3rius/AutoRecon /opt/autorecon \
  && cd /opt/autorecon \
  && python3 -m pip install -r requirements.txt

RUN git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git /opt/peass

WORKDIR /root

ENTRYPOINT ["/bin/zsh"]
