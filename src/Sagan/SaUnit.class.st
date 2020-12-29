Class {
	#name : #SaUnit,
	#superclass : #Object,
	#instVars : [
		'order',
		'title'
	],
	#category : #'Sagan-Model'
}

{ #category : #accessing }
SaUnit >> isSatisfied [ 
	self subclassResponsibility 
]

{ #category : #accessing }
SaUnit >> order [

	^ order ifNil: [ 1 ]
]

{ #category : #accessing }
SaUnit >> order: aNumber [

	^ order := aNumber
]

{ #category : #accessing }
SaUnit >> renderIn: aLessonViewer [

	aLessonViewer content: (self widgetIn: aLessonViewer).
	aLessonViewer unitTitle: self title
]

{ #category : #accessing }
SaUnit >> title [

	^ title
]

{ #category : #accessing }
SaUnit >> title: aTitle [	
	title := aTitle 
]

{ #category : #'as yet unclassified' }
SaUnit >> whatIsMissing [
	self subclassResponsibility 
]

{ #category : #accessing }
SaUnit >> widgetIn: aPresenter [

	self subclassResponsibility	
]
