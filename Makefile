
build:
	docker build -t elixir-inotify ./

dev:
	docker run -ti -p 80:80 -v ${PWD}:/opt/kv elixir-inotify /bin/bash
