DockerMenuHandler:
	; ��鵱ǰ���а��Ƿ񴿽࣬Ʃ�粻Ҫ����10���֣�����Ҫ��������з���
	Clipboard := StrReplace(Clipboard, "`r`n")
	Var := A_ThisMenuItem
	if (StrLen(Clipboard) < 15) {
		Var := StrReplace(A_ThisMenuItem, "<container>", Clipboard)
	}
	SendRaw, % Var
return

!g::
	Menu, DockerMenu, Add, docker ps, DockerMenuHandler
	Menu, DockerMenu, Add, docker ps -a, DockerMenuHandler
	Menu, DockerMenu, Add, docker start <container>, DockerMenuHandler
	Menu, DockerMenu, Add, docker stop <container>, DockerMenuHandler
	Menu, DockerMenu, Add, docker stop <container> && docker rm <container>, DockerMenuHandler
	Menu, DockerMenu, Add, docker images, DockerMenuHandler
	Menu, DockerMenu, Add, docker rmi <IMAGE>, DockerMenuHandler
	Menu, DockerMenu, Add  ; ���ӷָ���.
	Menu, DockerMenu, Add  ; ���ӷָ���.
	Menu, DockerMenu, Add  ; ���ӷָ���.
	Menu, DockerMenu, Add  ; ���ӷָ���.
	Menu, DockerMenu, Add, docker cp /root/php/www/index.html ca798fee7920:/var/www/, DockerMenuHandler
	Menu, DockerMenu, Add, docker cp ca798fee7920:/var/www/ /root/php/, DockerMenuHandler
	Menu, DockerMenu, Add  ; ���ӷָ���.
	Menu, DockerMenu, Add  ; ���ӷָ���.
	Menu, DockerMenu, Add  ; ���ӷָ���.
	Menu, DockerMenu, Add  ; ���ӷָ���.
	Menu, DockerMenu, Add, docker exec -i -t <container> /bin/bash, DockerMenuHandler
	Menu, DockerMenu, Add, docker exec <container> echo 123, DockerMenuHandler
	Menu, DockerMenu, Add, docker run --privileged -d -p 8080:80 --name myhttpd -v /root/myweb:/var/www/html centos:httpd /usr/sbin/init, DockerMenuHandler
	Menu, DockerMenu, Add, docker run --name mynginx --privileged -p 9090:80 -v /root/nginx/conf/nginx.conf:/etc/nginx/nginx.conf -v /root/nginx/www/:/usr/share/nginx/html/ -d centos:nginx, DockerMenuHandler
	Menu, DockerMenu, Show
	Menu, DockerMenu, DeleteAll ; ����ظ���Ⱦ�ķָ��ߵ�bug
return
