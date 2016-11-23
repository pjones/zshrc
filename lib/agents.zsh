# Make sure everyone knows where gpg files are:
export GNUPGHOME=$HOME/keys/gpg
export GPG_TTY=`tty`
export SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"

# Update gpg-agent environment.
gpg-connect-agent updatestartuptty /bye >/dev/null
