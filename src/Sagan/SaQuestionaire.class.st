"
I am a large assignment. I am composed by many other assignents. 
"
Class {
	#name : #SaQuestionaire,
	#superclass : #SaAssignment,
	#instVars : [
		'questions'
	],
	#category : #'Sagan-Model'
}

{ #category : #'as yet unclassified' }
SaQuestionaire >> isSatisfied [

	^ super isSatisfied or: [ 
		  questions allSatisfy: [ :q | q isSatisfied ] ]
]

{ #category : #'as yet unclassified' }
SaQuestionaire >> loadStateFrom: anOtherUnit [
	self species = anOtherUnit species
		ifFalse: [ "Changed the type. I cannot do much " ^ self ].
	anOtherUnit questions
		do: [ :old | 
			questions
				detect: [ :new | new id = old id ]
				ifFound: [ :new | new loadStateFrom: old ] ]
]

{ #category : #'as yet unclassified' }
SaQuestionaire >> questions [
	^ questions
]

{ #category : #'as yet unclassified' }
SaQuestionaire >> questions: someQuestions [
	self
		assert: (someQuestions collect: #id) asSet size = someQuestions size.
	questions := someQuestions
]

{ #category : #'as yet unclassified' }
SaQuestionaire >> state [

	^ questions collect: [ :q | q state ]
]

{ #category : #'as yet unclassified' }
SaQuestionaire >> whatIsMissing [

	^ 'Followin questions are not yet responded: ' , String crlf, (String crlf join:
		   ((questions reject: [ :q | q isSatisfied ]) collect: [ :q | 
			    q question ]))
]

{ #category : #'as yet unclassified' }
SaQuestionaire >> widgetIn: aPresenter [

	| list components |
	list := aPresenter instantiate: SaQuestionaireWidget .
	list questionaire: self. 
	"components := questions collect: [ :q | (q widgetIn: aPresenter ) beShowAllOptions ].
	list items: components."
	^ list
]
