sources = [
	'main.vala',
	'simpletweet.vala',
	'vatweet.vala',
	'window/mainwindow.vala',
]

deps = [
	dependency('glib-2.0', version: '>=2.52'),
	dependency('gtk+-3.0'),
	dependency('rest-0.7'),
]

executable(
	'simpletweet',
	resources,
	sources,
	dependencies: deps,
	vala_args: [
		'--target-glib=2.52',
	],
)
