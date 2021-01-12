"
I am an open question list. 
I almost delegate to questionaire. 
My main duty is to trasnform a collection of strings in open questions
"
Class {
	#name : #SaOpenQuestionList,
	#superclass : #SaAssignment,
	#instVars : [
		'questionaire'
	],
	#category : #'Sagan-Model'
}

{ #category : #accessing }
SaOpenQuestionList >> initialize [
	super initialize.
	questionaire := SaQuestionaire new
]

{ #category : #accessing }
SaOpenQuestionList >> isSatisfied [

	^ super isSatisfied or: [ questionaire isSatisfied ]
]

{ #category : #accessing }
SaOpenQuestionList >> loadStateFrom: anOtherUnit [
	self species = anOtherUnit species
		ifFalse: [ ^ self ].
	questionaire loadStateFrom: anOtherUnit questionaire
]

{ #category : #accessing }
SaOpenQuestionList >> questionaire [
	^ questionaire
]

{ #category : #accessing }
SaOpenQuestionList >> questions: aCollection [
	| qs |
	qs := OrderedCollection new.
	aCollection asDictionary
		keysAndValuesDo: [ :k :v | 
			qs
				add:
					((SaOpenQuestion id: k)
						question: v;
						yourself) ].
	questionaire questions: qs
]

{ #category : #accessing }
SaOpenQuestionList >> state [

	^	questionaire state
]

{ #category : #accessing }
SaOpenQuestionList >> whatIsMissing [
	^ questionaire whatIsMissing
]

{ #category : #accessing }
SaOpenQuestionList >> widgetIn: aPresenter [
	^ questionaire widgetIn: aPresenter
]
