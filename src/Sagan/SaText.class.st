Class {
	#name : #SaText,
	#superclass : #SaPresenter,
	#instVars : [
		'text'
	],
	#category : #'Sagan-UI'
}

{ #category : #specs }
SaText class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: #text
]

{ #category : #initialization }
SaText >> initializeWidgets [
	super initializeWidgets.
	text := self newText
]

{ #category : #initialization }
SaText >> text: aText [
	text text: aText
]
