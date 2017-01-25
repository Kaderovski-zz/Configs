
#!/bin/sh
# Dev par f00b4rch

clear
echo -e "
  __  ___   ___  _    _  _            _       _____  _             
 / _|/ _ \ / _ \| |  | || |          | |     |  __ \(_)            
| |_| | | | | | | |__| || |_ _ __ ___| |__   | |  | |_  __ _  __ _ 
|  _| | | | | | | '_ \__   _| '__/ __| '_ \  | |  | | |/ _\` |/ _\` |
| | | |_| | |_| | |_) | | | | | | (__| | | | | |__| | | (_| | (_| |
|_|  \___/ \___/|_.__/  |_| |_|  \___|_| |_| |_____/|_|\__,_|\__, |
                                                              __/ |
                                                             |___/ "
echo -e '\nNoraj de mon scriptage...'
echo -e '\n'

read -p "Host/IP : " ip

OUTPUT=$(host $ip | grep -Eo '[1-9]{1,3}\.([0-9]{1,3}\.){2}[0-9]{1,3}')
echo -e '\n'
echo -e '\n'
echo "IP : ${OUTPUT}" 
echo -e '\n'
echo -e '--------------------\nVérification ICMP\n--------------------'
ping -i 0.2 -c 5 $ip
echo -e '\n\n--------------------\nScan via Nmap\n--------------------'
echo '[...]'
nmap $ip -Pn
echo -e '\n'
echo -e '----------\nDNS => A\n----------'
dig $ip +short
echo -e '\n'
echo -e '-------------------------\nRécupération serveurs NS\n-------------------------'
echo '[...]'
sleep 1
ns=$(whois metal-cunt.com | grep -i "name server" | grep -Eo "([a-zA-Z0-9]+\.){1,}[a-zA-Z0-9]+\.[a-z]{2,}")
echo $ns
echo -e '\n'
echo -e '-------------------------\nDig sur les serveurs NS\n-------------------------'
echo -e '\n'
for i in $(echo $ns) ; do echo 'dig' $ip '@'$i ; dig $ip @$i ; done

exit
