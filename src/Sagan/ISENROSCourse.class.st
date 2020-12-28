Class {
	#name : #ISENROSCourse,
	#superclass : #Object,
	#category : #'Sagan-ISENRos'
}

{ #category : #'as yet unclassified' }
ISENROSCourse class >> course [

	^ self new course
]

{ #category : #combining }
ISENROSCourse >> bash [
	^ SaLesson new title: 'Bash'
]

{ #category : #'as yet unclassified' }
ISENROSCourse >> course [

	^ SaCourse new
		  title: 'ROS';
		  addLesson: self test;
		  addLesson: self linux;
		  addLesson: self bash;
		  addLesson: self git;
		  addLesson: self roscommands;
		  addLesson: self nodes;
		  addLesson: self topics;
		  addLesson: self serviceLesson;
		  addLesson: self launchLesson;
		  addLesson: self turtlebot;
		  addLesson: self pathPlanning;
		  addLesson: self summary
]

{ #category : #'command line' }
ISENROSCourse >> git [

	^ SaLesson new title: 'GIT'
]

{ #category : #'as yet unclassified' }
ISENROSCourse >> launchLesson [
	^ SaLesson new title: 'ROS Launch Files'
]

{ #category : #combining }
ISENROSCourse >> linux [
	^ ISENROSLinux new lesson.
]

{ #category : #accessing }
ISENROSCourse >> nodes [

	^ SaLesson new title: 'ROS Nodes'
]

{ #category : #'as yet unclassified' }
ISENROSCourse >> pathPlanning [
	^ SaLesson new title: 'Path Planning'
]

{ #category : #'as yet unclassified' }
ISENROSCourse >> roscommands [
	^ SaLesson new title: 'ROS Commands'
]

{ #category : #'as yet unclassified' }
ISENROSCourse >> serviceLesson [

	^ SaLesson new title: 'ROS Services'
]

{ #category : #accessing }
ISENROSCourse >> summary [

	^ SaLesson new title: 'Summary'
]

{ #category : #'as yet unclassified' }
ISENROSCourse >> test [

	^ ISENROSEntryTest new test
]

{ #category : #'as yet unclassified' }
ISENROSCourse >> topics [
	^ SaLesson new title: 'Topics'
]

{ #category : #'as yet unclassified' }
ISENROSCourse >> turtlebot [

	^ SaLesson new title: 'Introduction to Turtlebot'
]
