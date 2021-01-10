"
I am an open question assignment. 

"
Class {
	#name : #SaOpenQuestion,
	#superclass : #SaAssignment,
	#instVars : [
		'question'
	],
	#category : #'Sagan-Model'
}

{ #category : #initialization }
SaOpenQuestion >> isSatisfied [

	^ super isSatisfied or: [ self state isEmptyOrNil not  ]
]

{ #category : #initialization }
SaOpenQuestion >> question [

	^ question
]

{ #category : #accessing }
SaOpenQuestion >> question: aString [ 
	question := aString
]

{ #category : #'as yet unclassified' }
SaOpenQuestion >> response [

	^ self state isEmptyOrNil
		  ifTrue: [ 'Not responded' ]
		  ifFalse: [ self state ]
]

{ #category : #initialization }
SaOpenQuestion >> response: aResponse [
 	state := aResponse 
]

{ #category : #'as yet unclassified' }
SaOpenQuestion >> state [
	^ state 
]

{ #category : #initialization }
SaOpenQuestion >> whatIsMissing [
	^ 'question must be responded'
]

{ #category : #initialization }
SaOpenQuestion >> widgetIn: aPresenter [

	^ (aPresenter instantiate: SaOpenQuestionWidget)
		  question: question;
		  answer: state;
		  whenTextChangedDo: [ :text | self response: text ];
		  yourself
]
