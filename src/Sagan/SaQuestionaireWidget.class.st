"
I do put together many assignments. I have a table to show an overview and a viewport to render the widget related to this assingment
"
Class {
	#name : #SaQuestionaireWidget,
	#superclass : #SaPresenter,
	#instVars : [
		'questionare',
		'table',
		'viewport'
	],
	#category : #'Sagan-UI'
}

{ #category : #layout }
SaQuestionaireWidget class >> defaultLayout [

	^ SpBoxLayout newVertical
		  add: #table ;
		  add: #viewport
]

{ #category : #initialization }
SaQuestionaireWidget >> initializeWidgets [ 
	super initializeWidgets .
	table := self newQuestionaireTable. 
	viewport := self newLabel. 
]

{ #category : #initialization }
SaQuestionaireWidget >> installSelectedWidget: item [
	item ifNil: [ ^ self ].
	viewport := item widgetIn: self.
	self update
]

{ #category : #initialization }
SaQuestionaireWidget >> newQuestionaireTable [
	table := self newTable.
	table
		sortingBlock: [ :a :b | a order < b order ];
		addColumn:
			((SpStringTableColumn
				title: '#'
				evaluated: [ :item | table items indexOf: item ])
				beSortable;
				width: 20;
				yourself);
		addColumn:
			((SpStringTableColumn
				title: 'Question'
				evaluated: [ :item | item question ])
				beSortable;
				yourself);
		addColumn:
			((SpStringTableColumn
				title: 'Response'
				evaluated: [ :item | item response ])
				beSortable;
				yourself);
		whenSelectionChangedDo: [ :selection | self installSelectedWidget: selection selectedItem  ];
		beResizable.
	^ table
]

{ #category : #initialization }
SaQuestionaireWidget >> questionaire: aQuestionaire [
	questionare := aQuestionaire.
	table items: questionare questions.
	table selectItem: table items first
]
