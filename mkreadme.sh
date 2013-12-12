#!/bin/sh

cd "$(dirname "$0")"

for portfile in $(git ls-files --ignored -x Portfile); do
	port="$(dirname "$portfile")"
	name="$(basename "$port")"
	category="$(dirname "$port")"

	info="$(port info --name --version --homepage --description "$port")"

	printf "\n - %s/[%s]: %s\n[%s]: %s\n" \
		"$category" \
		"$name" \
		"$(port info --line --description "$port")" \
		"$name" \
		"$(port info --line --homepage "$port")"
done
