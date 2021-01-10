"
Experiment list is a first try to get commands on bash to be interactive. This is kind of dirty, i should refactor the model but it will take time to be compatible with former state or to migrate states also. To be enhanced after ISEN 2021.
"
Class {
	#name : #SaExperiment,
	#superclass : #SaAssignment,
	#instVars : [
		'description',
		'played'
	],
	#category : #'Sagan-Model'
}

{ #category : #'as yet unclassified' }
SaExperiment >> description [
	^ description
]

{ #category : #'as yet unclassified' }
SaExperiment >> description: aString [
	description := aString 
]

{ #category : #'as yet unclassified' }
SaExperiment >> isSatisfied [

	^ super isSatisfied or: [ played = true ]
]

{ #category : #'as yet unclassified' }
SaExperiment >> play [
	played := true. 
]

{ #category : #'as yet unclassified' }
SaExperiment >> response [
	^ self state
]

{ #category : #'as yet unclassified' }
SaExperiment >> response: aString [
	state := aString
]

{ #category : #'as yet unclassified' }
SaExperiment >> state [
	^ state ifNil: [ '' ]
]

{ #category : #'as yet unclassified' }
SaExperiment >> state: aString [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
SaExperiment >> stop [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
SaExperiment >> whatIsMissing [
	^ 'Experiment must be played at least once'
]

{ #category : #accessing }
SaExperiment >> widgetIn: aPresenter [
	^ (aPresenter instantiate: SaExperimentWidget)
		experiment: self;
		yourself
]
