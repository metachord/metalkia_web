all: site

site-delete:
	rm -rf site

site/%:
	mkdir -p $@

log:
	mkdir -p $@

site: site/static site/templates
	cp -av "deps/nitrogen_core/www" "site/static/nitrogen"
	cp -av "deps/metalkia_web_site/www/static" "site/static/metalkia"
	cp -av "deps/metalkia_web_site/www/templates" "site/templates/metalkia"

site-refresh: site-delete site log

run: site-refresh
	ERL_LIBS=deps erl -args_file rel/metalkia_web/etc/vm.args -config rel/metalkia_web/etc/app.config -boot start_sasl -s mtws_app
