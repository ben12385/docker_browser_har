# This file is necessarily, directly putting fluxbox does not seem to work within the xstartup

# fix for clipboard being passed through
# vncconfig -nowin &

# if ls /opt/startup_scripts/*.sh 1> /dev/null 2>&1; then
#   for f in /opt/startup_scripts/*.sh; do
#     bash "$f" -H || (echo "Error with $f: $?" >> /var/log/x11vnc_entrypoint.log)
#   done
# fi
/usr/bin/fluxbox