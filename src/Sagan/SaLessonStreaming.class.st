Class {
	#name : #SaLessonStreaming,
	#superclass : #TestCase,
	#instVars : [
		'lesson'
	],
	#category : #'Sagan-Test'
}

{ #category : #running }
SaLessonStreaming >> setUp [

	super setUp.

	lesson := SaLesson new
		          title: 'Test';
		          addUnit: (SaMarkdownContent new
				           title: 'Objectives';
				           content: 'content';
				           yourself);
		          addUnit: (SaLessonSummary new
				           title: 'Summary';
				           content: 'summary';
				           yourself)
]

{ #category : #running }
SaLessonStreaming >> testCurrentIsFirst [
	self assert: lesson current species = SaMarkdownContent 
]

{ #category : #running }
SaLessonStreaming >> testCurrentIsNotFinal [
	self deny: lesson current isFinal
]

{ #category : #running }
SaLessonStreaming >> testNextBackToFirstIsFirst [

	lesson
		next;
		backToFirstUnit .
	self deny: lesson current isFinal
]

{ #category : #running }
SaLessonStreaming >> testNextIsLast [
	lesson next.
	self assert: lesson current isFinal 
]

{ #category : #running }
SaLessonStreaming >> testNextNextIsEqualsToNext [
	| next | 
	lesson next.
	next := lesson current. 
	lesson next.
	self assert: next equals: lesson current.
]

{ #category : #running }
SaLessonStreaming >> testNextPreviousIsFirst [

	lesson
		next;
		previous.
	self deny: lesson current isFinal
]

{ #category : #running }
SaLessonStreaming >> testPreviousPreviousIsEqualsToPrevious [
	| prev | 
	lesson previous.
	prev := lesson current. 
	lesson previous.
	self assert: prev equals: lesson current.
]
