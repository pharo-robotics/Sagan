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
SaOpenQuestionList >> questions: aCollection [
	questionaire
		questions:
			(aCollection
				collect: [ :q | 
					SaOpenQuestion new
						question: q;
						yourself ])
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
