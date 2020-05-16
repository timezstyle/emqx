install:
	brew install erlang
	brew install rebar3

dev:
	docker run --rm -d --name emqx \
	  -p 1883:1883 -p 8083:8083 -p 8883:8883 -p 8084:8084 -p 18083:18083 \
	  -v ${CURDIR}/data/scripts:/opt/emqx/data/scripts \
	  -v ${CURDIR}/emqx-lua-hook/_build/default/lib/emqx_lua_hook/ebin:/opt/emqx/lib/emqx_lua_hook-4.1-rc.1/ebin \
	  -v ${CURDIR}/etc/emqx.conf:/opt/emqx/etc/emqx.conf.back \
	  emqx/emqx

kill:
	docker rm -f emqx

load:
	docker exec -it emqx ./bin/emqx_ctl plugins load emqx_lua_hook

reload:
	docker exec -it emqx ./bin/emqx_ctl luahook reload test.lua

logs:
	docker logs emqx

sh:
	docker exec -it emqx sh

compile:
	$(MAKE) -C emqx-lua-hook all