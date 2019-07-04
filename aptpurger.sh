#!/bin/bash

# author: phil stadler
# fb: phil zphil
# licensed under Creative Commons - Attribution-NonCommercial-ShareAlike 4.0 International


function generateHelp {

    cat << EOF

usage: aptpurger.sh [-d | -l ][--help]
			
aptpurger.sh lists or deletes all packages whith following status on dpkg:


in : not-installed, but marked as installed !
rc : config-files (only the config files are installed)
iu : unpacked
if : half-configured (configuration failed for some reason)
ih : half-installed (installation failed for some reason)
iw : triggers-awaited (package is waiting for a trigger from another package)
it : triggers-pending (package has been triggered)
u : unknown
r : remove/deinstall
p : purge (remove including config files)
h : hold

-h --help				This brief help
-d --delete				Deletes all defunct packages (DANGEROUS, may remove lots of packages)
-l --list				Lists all defunct packages

EOF
}

# Respond to input
if [ $# -eq 0 ]; then
	generateHelp
	exit 1
fi

for i in "$@"
do
case $i in
    -d|--delete)
		aptitude purge `dpkg --list | egrep -w "^ip|^in|^ic|^rc|^iu|^if|^ih|^iw|^it|^u|^r|^p|^h" | cut --delimiter=' ' --fields=3`
    ;;
    -l|--list)
		dpkg --list | egrep  "^ip|^in|^ic|^iu|^if|^ih|^iw|^it|^u|^r|^p|^h" | cut --delimiter=' ' --fields=3
	;;	
	-h|--help|*)
		generateHelp
	exit 1
    ;;
	*)
	generateHelp
	exit 1
	;;
esac
done
