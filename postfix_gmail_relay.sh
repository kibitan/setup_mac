#!/usr/bin/env bash
# Macでコマンドラインやプログラムからmailを送る - Qiita
# https://qiita.com/tmsanrinsha/items/75e06fbdd7e12409bb02
set -Ceu -o pipefail

printf "GMAIL account name: "
read -r gmail_account_name

printf "GMAIL app password (via https://security.google.com/settings/security/apppasswords): "
open https://security.google.com/settings/security/apppasswords
read -r -s gmail_app_password

# set -x

if ! grep 'smtp.gmail.com' /etc/postfix/main.cf; then
  cat << EOS | sudo tee -a /etc/postfix/main.cf > /dev/null
## https://qiita.com/tmsanrinsha/items/75e06fbdd7e12409bb02
## fix for GMAIL sending error: The IP you're using to send mail is not authorized to 550-5.7.1
# Posifix Configuratoins
relayhost = smtp.gmail.com:587

# SASL Authentication
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/gmail_passwd
smtp_sasl_security_options = noanonymous
smtp_sasl_mechanism_filter = plain

# TLS Settings
smtp_use_tls = yes
smtp_tls_security_level = encrypt
tls_random_source = dev:/dev/urandom
EOS
fi

sudo cat << EOS | sudo tee /etc/postfix/gmail_passwd > /dev/null
smtp.gmail.com:587 ${gmail_account_name}@gmail.com:${gmail_app_password}
EOS

sudo postmap /etc/postfix/gmail_passwd
sudo rm /etc/postfix/gmail_passwd

printf "\n\n"
printf "sending test email to %s@gmail.com ...\n" "$gmail_account_name"
date | mail -s testtesttest "$gmail_account_name@gmail.com"

sleep 3

printf "check maillog!\n"

printf "\n"
printf "##############\n"
log show --predicate  '(process == "smtpd") || (process == "smtp")' --info --last 1m --color always
# streaming logs: log stream --predicate  '(process == "smtpd") || (process == "smtp")' --info --color always
printf "##############\n"
printf "\n"

printf "please check mailbox in Gmail! \n"
# open https://gmail.com

# set +x
