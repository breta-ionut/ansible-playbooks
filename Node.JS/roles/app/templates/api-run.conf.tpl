description "Configures the system to run a specified Node.JS application at startup under the node user."

# Start up when the system hits any normal runlevel, and 
# shuts down when the system goes to shutdown or reboot.
start on filesystem or runlevel [2345]
stop on runlevel [06]

# IMPORTANT: You will want to use this with Forever. It
# tells Upstart that forever is going to fork after it
# starts.
expect fork

# This monitors Forever, which seems gratuitous.
# TIP: Comment these out while debugging your script.
respawn
respawn limit 5 30

# Send error messages to the console. Useful for debugging.
console output

# Configure the app to run under the node user.
setuid node

# The user's home directory
env HOME=/home/node

# Now we run Forever, telling it to write its logs to /tmp.
script
    cd $HOME
    exec forever start -a -l /tmp/forever.log -o /tmp/forever.stdout.log -e /tmp/forever.stderr.log {{ api.doc_root}}/{{ api.index_file }}
end script
