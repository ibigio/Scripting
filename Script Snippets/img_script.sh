#! /bin/bash
count=${1}
shift
query="$@"
[ -z $query ] && exit 1  # insufficient arguments
imagelink=$(wget --user-agent 'Mozilla/5.0' -qO - | "www.google.be/search?q=${query}\&tbm=isch" | sed 's/</\n</g' | grep '<img' | head -n"$count" | tail -n1 | sed 's/.*src="\([^"]*\)".*/\1/')
wget -qO google_image $imagelink
