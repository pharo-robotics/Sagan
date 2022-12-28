Class {
	#name : #BaselineOfSagan,
	#superclass : #BaselineOf,
	#category : #BaselineOfSagan
}

{ #category : #baselines }
BaselineOfSagan >> baseline: spec [

	<baseline>
	spec
		package: 'RobotsDuNordROS'
		with: [ spec repository: 'github://pharo-robotics/RobotsDuNordROS' ].
	spec package: 'Sagan' with: [ spec requires: #( RobotsDuNordROS ) ]
]
