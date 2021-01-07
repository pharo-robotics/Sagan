"
I am one of those boring degree of agreement marketing poll questions .
"
Class {
	#name : #SaSatisfactionQuestionTable,
	#superclass : #SaAssignment,
	#instVars : [
		'responses',
		'questions'
	],
	#category : #'Sagan-Model'
}

{ #category : #testing }
SaSatisfactionQuestionTable >> isSatisfied [

	^ super isSatisfied or: [ 
		  self state allSatisfy: [ :e | e anySatisfy: [ :v | v ] ] ]
]

{ #category : #'as yet unclassified' }
SaSatisfactionQuestionTable >> possibleResponses: aCollection [ 
	responses := aCollection 
]

{ #category : #accessing }
SaSatisfactionQuestionTable >> questions: aCollection [ 
	questions := aCollection
]

{ #category : #'accessing structure variables' }
SaSatisfactionQuestionTable >> state [

	^ state ifNil: [ 
		  state := questions collect: [ :q | 
			           | d |
			           d := Dictionary new.
			           d at: #Question put: q.
						  d at: responses first put: true.
			           responses allButFirst  do: [ :r | d at: r put: false ].
			           d ].
		  state ]
]

{ #category : #'as yet unclassified' }
SaSatisfactionQuestionTable >> whatIsMissing [

	^ 'The following questions are not responded: ' , String crlf
	  , (String crlf join:
			   ((self state select: [ :q | q noneSatisfy: [ :a | a ] ]) 
				    collect: [ :d | d at: #Question ]))
]

{ #category : #accessing }
SaSatisfactionQuestionTable >> widgetIn: aPresenter [

	| table |
	table := aPresenter newTable
		         sortingBlock: [ :a :b | 
			         (a at: #Question) < (a at: #Question) ];
		         addColumn: ((SpStringTableColumn
				           title: ' '
				           evaluated: [ :item | item at: #Question ])
				          width: 100;
				          beSortable;
				          yourself);
		         yourself.
	responses do: [ :r | 
		table addColumn: ((SpCheckBoxTableColumn
				  title: r
				  evaluated: [ :item | item value at: r ifAbsent: [ false ] ])
				 onActivation: [ :item | 
					 item keys do: [ :k | 
							 k = #Question ifFalse: [ item value at: k put: false ] ].
					 table selectItem: nil.
					 table selectItem: item.
					 item at: r put: true ];
				 onDeactivation: [ :item | item at: r put: false ];
				 yourself) ].
	table items: self state.
	^ table
]
