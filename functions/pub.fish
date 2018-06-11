function pub
	chmod 755 "$argv[1]"
    scp "$argv[1]" teemperor.de:~/pub/
    echo "https://teemperor.de/pub/$argv[1]"
end
