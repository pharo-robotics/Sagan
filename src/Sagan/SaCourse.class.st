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
		'courseFolder'
	],
	#classInstVars : [
		'courses',
		'openedCourses'
	],
	#category : #'Sagan-Model'
}

{ #category : #accessing }
SaCourse class >> courses [
	^ RNROSCourse course
]

{ #category : #'as yet unclassified' }
SaCourse class >> openCourse: aKey [

	^ self openedCourses
		  at: aKey
		  ifAbsentPut: [ (self courses at: aKey) value ]
]

{ #category : #accessing }
SaCourse class >> openedCourses [

	^ openedCourses ifNil: [ openedCourses := Dictionary new ]
]

{ #category : #accessing }
SaCourse >> addLesson: aLesson [
	aLesson order ifNil: [ aLesson order: lessons size ].
	lessons add: aLesson.
	aLesson submitFolder: self courseFolder.
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
SaCourse >> initialize [

	super initialize.
	lessons := OrderedCollection new
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
