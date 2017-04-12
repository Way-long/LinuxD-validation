

folder=$1

if [[ ! -d "$folder" ]]; then
	echo "Make folder [$folder]"
	mkdir -p "$folder"
	chmod 777 "$folder"
fi