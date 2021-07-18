#!/bin/sh

HOST="$1"; HOST=${HOST:="127.0.0.1"}
USERNAME="$2"; USERNAME=${USERNAME:="admin@setup"}
PASSWORD="$3"; PASSWORD=${PASSWORD:="password"}
PIN="$4"; PIN=${PIN:="123456"}
SECRET="$5"; SECRET=${SECRET:="testing123"}
PORT="$6"; PORT=${PORT:="1812"}
# if [[ -z "$1" ]]; then
#     read -p "HostName: " HOST;
# fi
# if [[ -z "$3" && -z "$4" ]]; then
#     read -s -p "Password: " PASSWORD; echo ""
#     read -p "Pin: "      PIN;
# fi
cat > "/tmp/peap-gtc.conf" << EOT
network={
        key_mgmt=WPA-EAP
        eap=PEAP
        identity="$USERNAME"
        phase2="auth=GTC"
        password="$PASSWORD$PIN"
    #ca_cert="/etc/raddb/certs/ca.der"
}
EOT
eapol_test -a "$HOST" -c "/tmp/peap-gtc.conf" -s "$SECRET" -p "$PORT" #  | tail -1
rm /tmp/peap-gtc.conf