if which text-aid-too; then
    echo "Found text-aid-server, skip install"
else
    sudo npm install -g coffee-script
    sudo npm install -g text-aid-too
fi

export TEXT_AID_TOO_SECRET="a-secret-key"
export TEXT_AID_TOO_EDITOR="gvim -f --role popup_editor"

# Use the default port (9293)...
text-aid-too
# Or...
#text-aid-server --port 9294
