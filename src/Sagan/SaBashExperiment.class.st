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
	LibC runCommand: command, ' &'. 
]
