#!/bin/bash
# by qkbeyond

# 提交表单地址 *注意*: 并非 http://rabr.itwit.info/login.php
login_url='http://rabr.itwit.info/login_action.php'

# 冷笑话 网址 @lengxiaohua
lxh_url='http://rabr.itwit.info/user.php?id=lengxiaohua'

# 条数
lines=10

username=pityonline # 用户名密码 自便
passwd=
login_info="username=$username&password=$passwd&remember=0&remember=1"

# # For test
# echo $username  $passwd
# echo login_url: $login_url
# echo lxh_url: $lxh_url
# echo 登录信息：$login_info

# 1.登录.
curl -s -c /tmp/cookie.itwit  -d $login_info $login_url --data-urlencode "commit=Sign In" -o /tmp/itwit_login_url.html
# curl -c /tmp/cookie.itwit  -d $login_info $login_url --data-urlencode "commit=Sign In" # > /dev/null

# 2.取 @lengxiaohua
curl -s -b /tmp/cookie.itwit $lxh_url -o /tmp/lxh_url.html
grep status_word /tmp/lxh_url.html | head -n $lines |\
sed -e 's/<a href[^>]*>//g;s/<\/a>//g' |\
sed -e 's/.*<span class=\"status_word\">//g;s/<span class=\"tweet\">//g;s/<\/span>//g;s/<span class=\"actions\">//g' | sed -e 's/<span class[^>]*>/ /g;s/<p>//;s/<\/p>/:/g' |\
sed -e 's/[ \t]*$//g;s/ //g' |\
sed -e 's/^[ \t]*//g'
