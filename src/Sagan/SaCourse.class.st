Class {
	#name : #SaCourse,
	#superclass : #Object,
	#instVars : [
		'lessons',
		'title'
	],
	#category : #'Sagan-Model'
}

{ #category : #'as yet unclassified' }
SaCourse class >> course [

	^ SaCourse new
		  title: 'ROS';
		  addLesson: self test;
		  addLesson: self unix;
		  addLesson: self git;
		  addLesson: self roscommands;
		  addLesson: self nodes;
		  addLesson: self topics;
		  addLesson: self serviceLesson;
		  addLesson: self launchLesson;
		  addLesson: self turtlebot;
		  addLesson: self pathPlanning;
		  addLesson: self summary. 
]

{ #category : #'command line' }
SaCourse class >> git [
^ SaLesson new title: 'GIT'
]

{ #category : #'as yet unclassified' }
SaCourse class >> launchLesson [
	^ SaLesson new title: 'ROS Launch Files'
]

{ #category : #accessing }
SaCourse class >> nodes [

	^ SaLesson new title: 'ROS Nodes'
]

{ #category : #'as yet unclassified' }
SaCourse class >> pathPlanning [
	^ SaLesson new title: 'Path Planning'
]

{ #category : #'as yet unclassified' }
SaCourse class >> roscommands [
	^ SaLesson new title: 'ROS Commands'
]

{ #category : #'as yet unclassified' }
SaCourse class >> serviceLesson [

	^ SaLesson new title: 'ROS Services'
]

{ #category : #accessing }
SaCourse class >> summary [

	^ SaLesson new title: 'Summary'
]

{ #category : #'as yet unclassified' }
SaCourse class >> test [

	^ SaEntryTestFactory new test
]

{ #category : #'as yet unclassified' }
SaCourse class >> topics [
	^ SaLesson new title: 'Topics'
]

{ #category : #'as yet unclassified' }
SaCourse class >> turtlebot [

	^ SaLesson new title: 'Introduction to Turtlebot'
]

{ #category : #combining }
SaCourse class >> unix [
	^ SaLesson new title: 'Unix'
]

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
