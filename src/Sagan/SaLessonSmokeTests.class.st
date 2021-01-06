Class {
	#name : #SaLessonSmokeTests,
	#superclass : #TestCase,
	#instVars : [
		'course'
	],
	#category : #'Sagan-Test'
}

{ #category : #running }
SaLessonSmokeTests >> setUp [

	super setUp.

	course := RNROSCourse course
]

{ #category : #running }
SaLessonSmokeTests >> testRNFactories [
	
	self assert:course lessons isNotEmpty.
	self assert:( course lessons allSatisfy: [ : l | l isKindOf: SaLesson ])
]
