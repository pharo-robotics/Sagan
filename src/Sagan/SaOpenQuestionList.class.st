Class {
	#name : #SaOpenQuestionList,
	#superclass : #SaUnit,
	#instVars : [
		'questions',
		'state'
	],
	#category : #'Sagan-Model'
}

{ #category : #accessing }
SaOpenQuestionList >> isSatisfied [

	^ questions allSatisfy: [ :q | 
		  (self state at: q ifAbsent: [ '' ]) isNotEmpty ]
]

{ #category : #accessing }
SaOpenQuestionList >> questions: aCollection [ 
	questions := aCollection 
]

{ #category : #accessing }
SaOpenQuestionList >> state [

	^ state ifNil: [ state := Dictionary new ]
]

{ #category : #accessing }
SaOpenQuestionList >> whatIsMissing [
	^ 'The following questions are not responded: ' , String crlf
	  , (String crlf join:
			   (questions select: [ :q | 
				    (self state at: q ifAbsent: '') isEmpty ]))
]

{ #category : #accessing }
SaOpenQuestionList >> widgetIn: aPresenter [

	| list components |
	list := aPresenter newComponentList.

	components := OrderedCollection new.
	questions do: [ :q | 
		| questionWidget |
		questionWidget := SaQuestion new.
		questionWidget question: q.
		questionWidget answer: (self state at: q ifAbsent: [ '' ]).
		questionWidget whenTextChangedDo: [ : s | 
			self state at: q put: questionWidget answer 
		].
		components add: questionWidget ].
	list items: components.
	^ list
]
