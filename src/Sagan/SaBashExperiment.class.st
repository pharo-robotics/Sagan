Class {
	#name : #SaBashExperiment,
	#superclass : #SaExperiment,
	#instVars : [
		'command',
		'pid'
	],
	#category : #'Sagan-Model'
}

{ #category : #'as yet unclassified' }
SaBashExperiment >> command: aCommandLine [
	command := aCommandLine
]

{ #category : #'as yet unclassified' }
SaBashExperiment >> play [
	super play. 
	LibC runCommand: command , ' &'. 
]

{ #category : #'as yet unclassified' }
SaBashExperiment >> stop [
	self error: 'must implement'
]
