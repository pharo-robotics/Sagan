Class {
	#name : #BaselineOfSagan,
	#superclass : #BaselineOf,
	#category : #BaselineOfSagan
}

{ #category : #baselines }
BaselineOfSagan >> baseline: spec [

	<baseline>
	spec for: #'pharo8.x' do: [ self pharo8: spec ].
	spec for: #'pharo9.x' do: [ self pharo9: spec ]
]

{ #category : #baselines }
BaselineOfSagan >> pharo8: spec [

	spec
		baseline: 'VLC'
		with: [ spec repository: 'github://badetitou/Pharo-LibVLC' ].
	spec
		baseline: 'Spec2'
		with: [ spec repository: 'github://pharo-spec/Spec' ].
	spec
		baseline: 'MicrodownDev'
		with: [ spec repository: 'github://pillar-markup/MicroDown:dev' ].
	spec
		package: 'Microdown-RichTextComposer'
		with: [ spec repository: 'github://pillar-markup/MicroDown' ].
	spec
		package: 'RobotsDuNordROS'
		with: [ spec repository: 'github://pharo-robotics/RobotsDuNordROS' ].
	spec
		package: 'Sagan'
		with: [ 
		spec requires: #( Spec2 MicrodownDev 'Microdown-RichTextComposer' RobotsDuNordROS) ]
]

{ #category : #baselines }
BaselineOfSagan >> pharo9: spec [

	spec
		package: 'RobotsDuNordROS'
		with: [ spec repository: 'github://pharo-robotics/RobotsDuNordROS' ].
	spec package: 'Sagan' with: [ spec requires: #( RobotsDuNordROS ) ]
]
