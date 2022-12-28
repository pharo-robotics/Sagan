"
Im a Microdown content unit. 
I have some textual content to be parsed and attached to my correlated widget. 

"
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
SaMarkdownContent >> renderIn: aLessonViewer [

	| text |
	text := aLessonViewer newText.
	aLessonViewer content: text.
	aLessonViewer unitTitle: self title.
	text text: (MicrodownParser convertToRichText: content)
]

{ #category : #accessing }
SaMarkdownContent >> widgetIn: aPresenter [

	| text |
	text := aPresenter newText.
	text text: (MicrodownParser convertToRichText: content).
	^ text
]
