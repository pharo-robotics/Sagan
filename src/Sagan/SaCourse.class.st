Class {
	#name : #SaCourse,
	#superclass : #Object,
	#instVars : [
		'lessons',
		'title'
	],
	#classInstVars : [
		'courses'
	],
	#category : #'Sagan-Model'
}

{ #category : #accessing }
SaCourse class >> courses [
	^ {(#'ROS 1 @ ISEN' -> ISENROSCourse course)} asDictionary	"courses
		ifNil: [ courses := "	" ]"
]

{ #category : #accessing }
SaCourse >> addLesson: aLesson [

	aLesson order ifNil: [ aLesson order: lessons size ].
	lessons add: aLesson
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
