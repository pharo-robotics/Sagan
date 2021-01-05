Class {
	#name : #SaOpenQuestionList,
	#superclass : #SaUnit,
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
	^ true "
	^ questions allSatisfy: [ :q | 
		  (self state at: q ifAbsent: [ '' ]) isNotEmpty ]"
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
