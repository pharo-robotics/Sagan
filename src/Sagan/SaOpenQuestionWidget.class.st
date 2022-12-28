"
I am here to draw open questions
"
Class {
	#name : #SaOpenQuestionWidget,
	#superclass : #SaPresenter,
	#instVars : [
		'questionLabel',
		'answerLabel'
	],
	#category : #'Sagan-UI'
}

{ #category : #layout }
SaOpenQuestionWidget class >> defaultLayout [

	^ SpBoxLayout newVertical
		  add: #questionLabel height: self toolbarHeight * 1.5;
		  add: #answerLabel 
]

{ #category : #initialization }
SaOpenQuestionWidget >> answer [

	^ answerLabel text asString
]

{ #category : #initialization }
SaOpenQuestionWidget >> answer: aValue [ 
	answerLabel text: (aValue ifNil:[''])
]

{ #category : #initialization }
SaOpenQuestionWidget >> initializeWidgets [
	super initializeWidgets.
	questionLabel := self newLabel.
	answerLabel := self newText.
	answerLabel autoAccept: true.
]

{ #category : #initialization }
SaOpenQuestionWidget >> question: aQuestion [
	^ questionLabel label: aQuestion
]

{ #category : #initialization }
SaOpenQuestionWidget >> whenSubmitDo: aBlock [
	answerLabel whenSubmitDo: aBlock
]

{ #category : #enumerating }
SaOpenQuestionWidget >> whenTextChangedDo: aFullBlockClosure [ 
	answerLabel whenTextChangedDo: aFullBlockClosure 
]
