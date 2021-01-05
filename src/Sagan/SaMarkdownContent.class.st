Class {
	#name : #SaMarkdownContent,
	#superclass : #SaUnit,
	#instVars : [
		'content'
	],
	#category : #'Sagan-Model'
}

{ #category : #accessing }
SaMarkdownContent >> content: aString [ 
	content := aString
]

{ #category : #testing }
SaMarkdownContent >> isSatisfied [
	^ true
]

{ #category : #accessing }
SaMarkdownContent >> widgetIn: aPresenter [

	| text |
	text := aPresenter instantiate: SaText.
	text text: (MicroDownParser asText: content).
	^ text
]
