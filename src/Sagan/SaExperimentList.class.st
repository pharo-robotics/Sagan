"
Experiment list is a first try to get commands on bash to be interactive. This is kind of dirty, i should refactor the model but it will take time to be compatible with former state or to migrate states also. To be enhanced after ISEN 2021.
"
Class {
	#name : #SaExperimentList,
	#superclass : #SaAssignment,
	#instVars : [
		'entries'
	],
	#category : #'Sagan-Model'
}

{ #category : #'as yet unclassified' }
SaExperimentList >> whatIsMissing [
	^ ''
]

{ #category : #accessing }
SaExperimentList >> widgetIn: aPresenter [

	
]
