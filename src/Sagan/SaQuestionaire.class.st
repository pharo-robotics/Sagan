Class {
	#name : #SaQuestionaire,
	#superclass : #SaUnit,
	#instVars : [
		'questions'
	],
	#category : #'Sagan-Model'
}

{ #category : #'as yet unclassified' }
SaQuestionaire >> isSatisfied [

	^ questions allSatisfy: [ :q | q isSatisfied ]
]

{ #category : #'as yet unclassified' }
SaQuestionaire >> questions: someQuestions [

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
	list := aPresenter newComponentList.

	components := questions collect: [ :q | (q widgetIn: aPresenter ) beShowAllOptions ].
	list items: components.
	^ list
]