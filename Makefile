all: compile

compile:
	rebar compile

log:
	mkdir -p $@

site-refresh: log

run:
	cp config/app.config rel/metalkia_web/etc/app.config
	ERL_LIBS=deps erl -args_file rel/metalkia_web/etc/vm.args -config rel/metalkia_web/etc/app.config -boot start_sasl -s mtws_app
