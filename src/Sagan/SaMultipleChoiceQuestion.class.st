Class {
	#name : #SaMultipleChoiceQuestion,
	#superclass : #SaUnit,
	#instVars : [
		'question',
		'choices',
		'state',
		'singleReponse'
	],
	#category : #'Sagan-Model'
}

{ #category : #accessing }
SaMultipleChoiceQuestion >> choices [
	^ choices
]

{ #category : #'as yet unclassified' }
SaMultipleChoiceQuestion >> choices: aChoiceCollection [	
	choices := aChoiceCollection 
]

{ #category : #accessing }
SaMultipleChoiceQuestion >> includesResponse: aResponse [

	^ self state at: aResponse ifAbsent: false
]

{ #category : #accessing }
SaMultipleChoiceQuestion >> initialize [ 
	super initialize.
	singleReponse := true. 
]

{ #category : #accessing }
SaMultipleChoiceQuestion >> isSatisfied [

	^ self state anySatisfy: [ :a | a ]
]

{ #category : #accessing }
SaMultipleChoiceQuestion >> isSingleResponse [
	^ singleReponse 
]

{ #category : #accessing }
SaMultipleChoiceQuestion >> question [
	^ question
]

{ #category : #'as yet unclassified' }
SaMultipleChoiceQuestion >> question: aQuestion [ 
	question := aQuestion.
	
]

{ #category : #accessing }
SaMultipleChoiceQuestion >> setResponse: aResponse [

	self assert: (choices includes: aResponse).
	self isSingleResponse ifTrue: [ self state removeAll ].
	self state at: aResponse put: true.
]

{ #category : #accessing }
SaMultipleChoiceQuestion >> singleResponse: aBool [

	singleReponse := aBool
]

{ #category : #accessing }
SaMultipleChoiceQuestion >> state [

	^ state ifNil: [ state := Dictionary new ]
]

{ #category : #accessing }
SaMultipleChoiceQuestion >> unsetResponse: aResponse [
	self assert: (choices includes: aResponse).
	self state at: aResponse put: false
]

{ #category : #accessing }
SaMultipleChoiceQuestion >> whatIsMissing [

	^ 'You must choose an option'
]

{ #category : #accessing }
SaMultipleChoiceQuestion >> widgetIn: aPresenter [	
	| mc | 
	mc := aPresenter instantiate: SaMultipleChoiceWidget. 
	mc multipleChoiceQuestion: self. 
	^ mc 
]
