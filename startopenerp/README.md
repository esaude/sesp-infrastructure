# Automatically run script at boot time
# Following are simple instructions
# Make /etc/rc.d/rc.local executable, by using this command:
  chmod +x /etc/rc.d/rc.local
# Edit the file /etc/rc.local and to the bottom of it simply add the line pointing to your shell script:
  /path/MyShScript.sh
# And then to make it executable, run:
  chmod +x /path/MyShScript.sh
# DONE!


