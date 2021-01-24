# Not really required if brew is already in $PATH, like /usr/local
if [[ -f /opt/homebrew/bin/brew ]]; then
	export PATH="/opt/homebrew/bin:$PATH"
else
	export PATH="/usr/local/bin:$PATH"
fi
