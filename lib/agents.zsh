# Some variables to always export.
export SSH_AGENT_PID
export SSH_AUTH_SOCK
export GPG_AGENT_INFO

# Make sure everyone knows where gpg files are:
export GNUPGHOME=$HOME/keys/gpg
export GPG_TTY=`tty`
export SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"
