Class {
	#name : #RNROSCourse,
	#superclass : #Object,
	#category : #'Sagan-RobotsDuNordROS'
}

{ #category : #'as yet unclassified' }
RNROSCourse class >> course [

	^ self new course
]

{ #category : #combining }
RNROSCourse >> bash [
	^ RNROSBash new lesson.
]

{ #category : #'as yet unclassified' }
RNROSCourse >> course [

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
RNROSCourse >> git [

	^ RNROSGit new lesson
]

{ #category : #'as yet unclassified' }
RNROSCourse >> launchLesson [
	^ SaLesson new title: 'ROS Launch Files'
]

{ #category : #combining }
RNROSCourse >> linux [
	^ RNROSLinux new lesson.
]

{ #category : #accessing }
RNROSCourse >> nodes [

	^ SaLesson new title: 'ROS Nodes'
]

{ #category : #'as yet unclassified' }
RNROSCourse >> pathPlanning [
	^ SaLesson new title: 'Path Planning'
]

{ #category : #'as yet unclassified' }
RNROSCourse >> roscommands [
	^ SaLesson new title: 'ROS Commands'
]

{ #category : #'as yet unclassified' }
RNROSCourse >> serviceLesson [

	^ SaLesson new title: 'ROS Services'
]

{ #category : #accessing }
RNROSCourse >> summary [

	^ SaLesson new title: 'Summary'
]

{ #category : #'as yet unclassified' }
RNROSCourse >> test [

	^ RNROSEntryTest new test
]

{ #category : #'as yet unclassified' }
RNROSCourse >> topics [
	^ SaLesson new title: 'Topics'
]

{ #category : #'as yet unclassified' }
RNROSCourse >> turtlebot [

	^ SaLesson new title: 'Introduction to Turtlebot'
]
