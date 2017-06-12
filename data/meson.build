gnome = import('gnome')

resources = gnome.compile_resources(
	'simpletweet_resources',
	'simpletweet.gresource.xml',
)

install_data(
	'org.deikatsuo.simpletweet.gschema.xml',
	install_dir: '/usr/share/glib-2.0/schemas',
)

gnome.compile_schemas()

