Class {
	#name : #SaCourse,
	#superclass : #Object,
	#instVars : [
		'lessons',
		'title'
	],
	#category : #'Sagan-Model'
}

{ #category : #accessing }
SaCourse >> addLesson: aLesson [

	aLesson order ifNil: [ aLesson order: lessons size ].
	lessons add: aLesson
]

{ #category : #accessing }
SaCourse >> initialize [

	super initialize.
	lessons := SortedCollection sortBlock: [ :l :l2 | l order < l2 order ]
]

{ #category : #accessing }
SaCourse >> lessons [
	^ lessons
]

{ #category : #accessing }
SaCourse >> title [

	^ title
]

{ #category : #accessing }
SaCourse >> title: aTitle [ 
	title := aTitle
]
