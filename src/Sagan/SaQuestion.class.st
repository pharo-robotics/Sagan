Class {
	#name : #SaQuestion,
	#superclass : #SaPresenter,
	#instVars : [
		'questionLabel',
		'answerLabel'
	],
	#category : #'Sagan-UI'
}

{ #category : #specs }
SaQuestion class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: #questionLabel height: self toolbarHeight * 1.5;
		  add: #answerLabel height: self toolbarHeight * 5
]

{ #category : #initialization }
SaQuestion >> answer [

	^ answerLabel text asString
]

{ #category : #initialization }
SaQuestion >> answer: aValue [ 
	answerLabel text: aValue
]

{ #category : #initialization }
SaQuestion >> initializeWidgets [
	super initializeWidgets.
	questionLabel := self newLabel.
	answerLabel := self newText.
	answerLabel autoAccept: true.
]

{ #category : #initialization }
SaQuestion >> question: aQuestion [
	^ questionLabel label: aQuestion
]

{ #category : #initialization }
SaQuestion >> whenSubmitDo: aBlock [
	answerLabel whenSubmitDo: aBlock
]

{ #category : #enumerating }
SaQuestion >> whenTextChangedDo: aFullBlockClosure [ 
	answerLabel whenTextChangedDo: aFullBlockClosure 
]
