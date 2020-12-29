Class {
	#name : #SaMultipleChoiceWidget,
	#superclass : #SaPresenter,
	#instVars : [
		'multipleChoiceQuestion',
		'questionLabel',
		'choicesList',
		'showAllOptions'
	],
	#category : #'Sagan-UI'
}

{ #category : #specs }
SaMultipleChoiceWidget class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: #questionLabel height: self toolbarHeight;
		  add: #choicesList.
]

{ #category : #initialization }
SaMultipleChoiceWidget >> beShowAllOptions [

	showAllOptions := true
]

{ #category : #initialization }
SaMultipleChoiceWidget >> buildWithSpecLayout: aLayout [
	showAllOptions ifTrue: [
	(((aLayout class allSlots detect: [ :s | s name = #children ]) read:
		  aLayout) at: #choicesList) height:
		choicesList items size * self class toolbarHeight.].
	^ super buildWithSpecLayout: aLayout
]

{ #category : #initialization }
SaMultipleChoiceWidget >> includesResponse: aResponse [
	
	^ multipleChoiceQuestion includesResponse: aResponse
]

{ #category : #initialization }
SaMultipleChoiceWidget >> initialize [

	super initialize.
	showAllOptions := false
]

{ #category : #initialization }
SaMultipleChoiceWidget >> initializeWidgets [

	super initializeWidgets.
	questionLabel := self newLabel.
	choicesList := self newTable
		               addColumn:
			               ((SpStringTableColumn
				                 title: 'Option'
				                 evaluated: [ :item | item ])
				                width: 100;
				                beSortable;
				                yourself);
		               addColumn: ((SpCheckBoxTableColumn
				                 title: ''
				                 evaluated: [ :item | self includesResponse: item ])
				                onActivation: [ :item | 
					                self setResponse: item.
					                choicesList selectItem: nil.
					                choicesList selectItem: item ];
				                onDeactivation: [ :item | 
					                self unsetResponse: item ];
				                yourself)
]

{ #category : #initialization }
SaMultipleChoiceWidget >> multipleChoiceQuestion: aQuestion [

	multipleChoiceQuestion := aQuestion.
	questionLabel label: aQuestion question. 
	choicesList items: aQuestion choices
]

{ #category : #initialization }
SaMultipleChoiceWidget >> setResponse: aResponse [
	
	^ multipleChoiceQuestion setResponse: aResponse
]

{ #category : #initialization }
SaMultipleChoiceWidget >> stabilize [
	(((self layout class allSlots detect:[ : s | s name = #children ]) read: self layout) at: #choicesList) height: 
	choicesList items size * self class toolbarHeight 
]

{ #category : #initialization }
SaMultipleChoiceWidget >> unsetResponse: aResponse [

	^ multipleChoiceQuestion unsetResponse: aResponse

]
