"
I do represent a Course. 
I am composed by a lesson and a title. I work only as a semantic container.
"
Class {
	#name : #SaCourse,
	#superclass : #Object,
	#instVars : [
		'lessons',
		'title',
		'courseFolder',
		'id'
	],
	#classInstVars : [
		'courses',
		'openedCourses'
	],
	#category : #'Sagan-Model'
}

{ #category : #accessing }
SaCourse class >> courses [

	^ RNROSCourse courses
]

{ #category : #'as yet unclassified' }
SaCourse class >> openCourse: aKey [
	| new |
	" This is tricky. In here we always open the course and load the reponses from the last used course "
	new := (self courses at: aKey) value.
	self openedCourses
		at: aKey
		ifPresent: [ :old | new loadStateFrom: old ].
	self openedCourses at: aKey put: new.
	^ new
]

{ #category : #accessing }
SaCourse class >> openedCourses [

	^ openedCourses ifNil: [ openedCourses := Dictionary new ]
]

{ #category : #accessing }
SaCourse >> addLesson: aLesson [
	self assert: (lessons noneSatisfy: [ :u | u id = aLesson id ]).
	aLesson order ifNil: [ aLesson order: lessons size ].
	lessons add: aLesson.
	aLesson submitFolder: self courseFolder
]

{ #category : #accessing }
SaCourse >> addLesson: aLesson id: anId [ 
	aLesson id: anId.
	self addLesson: aLesson.
]

{ #category : #accessing }
SaCourse >> courseFolder [

	^ courseFolder ifNil: [ #default ]
]

{ #category : #accessing }
SaCourse >> courseFolder: aFolderName [

	^ courseFolder := aFolderName
]

{ #category : #accessing }
SaCourse >> id [
	^ id
]

{ #category : #accessing }
SaCourse >> id: anId [
	id := anId
]

{ #category : #accessing }
SaCourse >> initialize [

	super initialize.
	lessons := OrderedCollection new
]

{ #category : #accessing }
SaCourse >> lessons [
	^ lessons
]

{ #category : #accessing }
SaCourse >> loadStateFrom: anOtherCourse [
	anOtherCourse lessons
		do: [ :old | 
			lessons
				detect: [ :new | new id = old id ]
				ifFound: [ :new | new loadStateFrom: old ] ]
]

{ #category : #accessing }
SaCourse >> title [

	^ title
]

{ #category : #accessing }
SaCourse >> title: aTitle [ 
	title := aTitle
]
