#! /bin/sh
echo -n "Enter username: "
read NAME
if ! [ -f ~/.ssh/id_rsa.pub ]; then
    ssh-keygen
    cat ~/.ssh/id_rsa.pub | ssh straylight.cuboniks.work "cat >> ~/.ssh/authorized_keys"
    echo "RSA keys generated. Public key copied to server."
    echo "Ready to connect"
fi
echo "Connecting to straylight..."
ssh -t $NAME@straylight.cuboniks.work /usr/local/bin/chat
