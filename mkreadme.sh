#!/bin/sh

cache_dir=.cache

cd "$(dirname "$0")"

for portfile in $(git ls-files --ignored -x Portfile); do
	port="$(dirname "$portfile")"
	name="$(basename "$port")"
	category="$(dirname "$port")"

	cache="$cache_dir/$port"
	if [ '!' -f "$cache" -o "$portfile" -nt "$cache" ]; then
		mkdir -p "$cache_dir/$category"
#	info="$(port info --name --version --homepage --description "$port")"
		echo "updating $name" >&2
		printf "\n - %s/[%s]: %s\n[%s]: %s\n" \
		  "$category" \
		  "$name" \
		  "$(port info --line --description "$port")" \
		  "$name" \
		  "$(port info --line --homepage "$port")" \
		  > "$cache"
	fi
	cat "$cache"
done
