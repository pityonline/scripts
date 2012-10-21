#!/bin/bash
# 用来获取 @Android_cn 的新闻更新。

curl -s http://twitter.com/android_cn -o /tmp/android_cn.html
grep entry-content /tmp/android_cn.html | head -n 5 |\
sed -e 's/<a href[^>]*>//g;s/<\/a>//g' |\
sed -e 's/.*<span class=\"status_word\">//g;s/<span class=\"tweet\">//g;s/<\/span>//g;s/<span class=\"actions\">//g' | sed -e 's/<span class[^>]*>/ /g;s/<p>//;s/<\/p>/:/g' |\
sed -e 's/[ \t]*$//g;s/ //g' |\
sed -e 's/^[ \t]*//g' |\
sed 's/\http/\n&/g'
