Class {
	#name : #BaselineOfSagan,
	#superclass : #BaselineOf,
	#category : #BaselineOfSagan
}

{ #category : #baselines }
BaselineOfSagan >> baseline: spec [
	<baseline>
	spec
		for: #'pharo8.x'
		do: [ spec
				baseline: 'VLC'
				with: [ spec repository: 'github://badetitou/Pharo-LibVLC' ].
			spec
				baseline: 'Spec'
				with: [ spec repository: 'github://pharo-spec/Spec' ].
			spec
				baseline: 'MicrodownDev'
				with: [ spec repository: 'github://pillar-markup/MicroDown:dev' ].
			spec
				package: 'Microdown-RichTextComposer'
				with: [ spec repository: 'github://pillar-markup/MicroDown' ].
			spec
				package: 'Sagan'
				with: [ spec requires: #(VLC Spec MicrodownDev 'Microdown-RichTextComposer') ] ]
]
