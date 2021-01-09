"
I am a desesperated and failed attempt to have full text composition with microdown when generating widgets on the fly.
"
Class {
	#name : #SaText,
	#superclass : #SaPresenter,
	#instVars : [
		'text',
		'textContent'
	],
	#classInstVars : [
		'aText',
		'textContent'
	],
	#category : #'Sagan-UI'
}

{ #category : #specs }
SaText class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: #text
]

{ #category : #initialization }
SaText >> finishRendering [
	text text: (textContent ifNil: [ '' ])
]

{ #category : #initialization }
SaText >> initializeWidgets [

	super initializeWidgets.
	text := self newText
		        beNotEditable;
		        yourself
]

{ #category : #initialization }
SaText >> text: aText [
	textContent := aText.
	text text: aText
	
]
