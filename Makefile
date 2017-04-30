
build:
	docker build -t elixir-inotify ./

dev:
	docker run -ti -v ${PWD}:/opt/kv elixir-inotify /bin/bash
