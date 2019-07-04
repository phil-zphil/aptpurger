# aptpurger
Little script to clean out dpkg from different types of defunct packages.

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
