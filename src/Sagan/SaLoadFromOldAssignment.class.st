Class {
	#name : #SaLoadFromOldAssignment,
	#superclass : #ParametrizedTestCase,
	#instVars : [
		'new',
		'old',
		'classToUse'
	],
	#category : #'Sagan-Test'
}

{ #category : #'building suites' }
SaLoadFromOldAssignment class >> testParameters [
	| matrix |
	matrix := super testParameters.
	(SaAssignment allSubclasses
		remove: SaOpenQuestionList;
		remove: SaQuestionaire;
		yourself) do: [ :s | matrix addCase: {(#classToUse -> s)} ].
	^ matrix
]

{ #category : #running }
SaLoadFromOldAssignment >> classToUse: aClassToUse [
	classToUse := aClassToUse
]

{ #category : #running }
SaLoadFromOldAssignment >> setUp [
	super setUp.
	new := classToUse new.
	old := classToUse new.
	(classToUse slotNamed: #state) write: self testingValue to: old
]

{ #category : #running }
SaLoadFromOldAssignment >> testValueIsTransmited [
	new loadStateFrom: old.
	self assert: new state equals: old state
]

{ #category : #running }
SaLoadFromOldAssignment >> testingValue [
	^ {(#some -> #value)} asDictionary
]
