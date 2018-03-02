#!/usr/bin/env bash

date=`date +"%Y-%m-%d"`
ts=`date +"%Y-%m-%d %H:%M:%S -0800"`

# parse args
if test $# -eq 0; then
  help_msg="sh new_post.sh title [use_template]"
  echo $help_msg
  exit 1
fi
title=$1
shift
use_template=$1

# default configs
dft_category=thoughts
template=_post/empty_template
empty_post="--- \nlayout: post \ntitle:  \"${title//-/ }\" \ndate:   $ts \ncategories: $dft_category \n---"
echo $empty_post
# init post
new_post=_posts/${date}-${title}.markdown
if test -n "$1"; then
  template=_post/template
  cat $template > $new_post
else
  echo -en $empty_post > $new_post
fi

vim $new_post

