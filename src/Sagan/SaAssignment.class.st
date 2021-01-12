"
I am an assignment.
Im meant to hold a value (the reponse of the student).
I am ment to be or not optional
"
Class {
	#name : #SaAssignment,
	#superclass : #SaUnit,
	#instVars : [
		'state',
		'optional'
	],
	#category : #'Sagan-Model'
}

{ #category : #initialization }
SaAssignment >> beCompulsory [

	optional := false
]

{ #category : #initialization }
SaAssignment >> beOptional [

	optional := true
]

{ #category : #initialization }
SaAssignment >> initialize [

	super initialize.
	optional := false
]

{ #category : #accessing }
SaAssignment >> isSatisfied [ 
	^ optional
]

{ #category : #accessing }
SaAssignment >> loadStateFrom: anOtherUnit [
	state := anOtherUnit state.
]

{ #category : #accessing }
SaAssignment >> state [

	^ state ifNil: [ state := Dictionary new ]
]
