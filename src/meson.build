sources = [
	'main.vala',
	'account.vala',
	'simpletweet.vala',
	'vatweet.vala',
	'alert.vala',
	'schema.vala',
	'window/alertwindow.vala',
	'window/mainwindow.vala',
	'window/greetingwindow.vala',
]

deps = [
	dependency('glib-2.0', version: '>=2.52'),
	dependency('gtk+-3.0'),
	dependency('rest-0.7'),
	dependency('gee-0.8'),
	dependency('json-glib-1.0'),
]

executable(
	'simpletweet',
	sources,
	resources,
	dependencies: deps,
	vala_args: [
		'--target-glib=2.52',
	],
	install: true,
)
