#!/bin/bash
# 用于检查 Gmail 收件箱未读邮件数目；不能用于 Google 2-step verfication 用户。
# (c) 来源于网络

gmail_login=username
gmail_password=password

dane="$(wget --secure-protocol=TLSv1 --timeout=3 -t 1 -q -O - \
https://${gmail_login}:${gmail_password}@mail.google.com/mail/feed/atom \
--no-check-certificate | grep 'fullcount' \
| sed -e 's/.*<fullcount>//;s/<\/fullcount>.*//' 2>/dev/null)"

if [ -z "$dane" ]; then
echo "Error"
else
echo "$dane"
fi
