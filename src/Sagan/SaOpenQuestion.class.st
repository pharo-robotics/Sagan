Class {
	#name : #SaOpenQuestion,
	#superclass : #SaUnit,
	#instVars : [
		'question',
		'state'
	],
	#category : #'Sagan-Model'
}

{ #category : #initialization }
SaOpenQuestion >> initialize [

	super initialize.
	state := ''
]

{ #category : #initialization }
SaOpenQuestion >> isSatisfied [

	^ state isNotEmpty
]

{ #category : #initialization }
SaOpenQuestion >> question [

	^ question
]

{ #category : #accessing }
SaOpenQuestion >> question: aString [ 
	question := aString
]

{ #category : #initialization }
SaOpenQuestion >> state: aResponse [
 	state := aResponse 
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
		  whenTextChangedDo: [ :text | self state: text ];
		  yourself
]
