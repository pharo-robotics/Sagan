"
I represent a unit of content. 
I am an abstract class. 
I have different shapes. I shall know if am or not optional, if my assignment is or not satisfied and to respond what is missing to be satisfied.
Each of my subclasses must know also how to show it self in a classroom. 
"
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
SaUnit >> isFinal [
	^ false
]

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
