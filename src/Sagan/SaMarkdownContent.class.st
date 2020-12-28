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

	^ aPresenter newText
		  text: (MicroDownParser asText: content);
		  yourself
]
