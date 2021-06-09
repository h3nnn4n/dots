GPG_TTY=$(tty)
export GPG_TTY
gpgconf --launch gpg-agent
gpgconf --kill gpg-agent
