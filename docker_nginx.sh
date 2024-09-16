#!/bin/bash
if docker run -v $(pwd)/data:/data/www/ -v $(pwd)/conf:/etc/nginx/ --name nginx --rm -d -p 80:80 nginx 2>&1 | grep -c "Error" >/dev/null; then
	docker stop nginx>/dev/null
	echo "Nginx stopped"
else
	echo "Nginx started"
	docker ps | head -n 1
	docker ps | grep "nginx$"
fi
