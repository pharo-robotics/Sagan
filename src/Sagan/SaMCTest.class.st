Class {
	#name : #SaMCTest,
	#superclass : #TestCase,
	#instVars : [
		'question'
	],
	#category : #'Sagan-Test'
}

{ #category : #running }
SaMCTest >> setUp [

	super setUp.
	question := SaMultipleChoiceQuestion new
		            title: 'Test';
		            choices: { 1. 2. 3 };
		            yourself
]

{ #category : #tests }
SaMCTest >> testManyResponsesAllowed [

	question beMultiple.
	question response: 1.
	question response: 2.
	question response: 3.
	question unsetResponse: 3.
	self assert: question state size equals: 3.
	self assert: (question state values select: #yourself) size equals: 2
]

{ #category : #tests }
SaMCTest >> testManyResponsesNotAllowed [

	question beSingle.
	question response: 1.
	question response: 2.
	question response: 3.
	self assert: question state size equals: 1.
	self assert: (question state values select: #yourself) size equals: 1
]

{ #category : #tests }
SaMCTest >> testNonResponseNotSatisfied [
	self deny: question isSatisfied
]

{ #category : #tests }
SaMCTest >> testOptionalIsSatisfied [

	question beOptional.
	self assert: question isSatisfied
]

{ #category : #tests }
SaMCTest >> testSatisfied [
	question response: 1 . 
	self assert: question isSatisfied
]
