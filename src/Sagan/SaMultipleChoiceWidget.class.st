Class {
	#name : #SaMultipleChoiceWidget,
	#superclass : #SaPresenter,
	#instVars : [
		'multipleChoiceQuestion',
		'questionLabel',
		'choicesList'
	],
	#category : #'Sagan-UI'
}

{ #category : #specs }
SaMultipleChoiceWidget class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: #questionLabel height: self toolbarHeight * 2 ;
		  add: #choicesList.

]

{ #category : #initialization }
SaMultipleChoiceWidget >> includesResponse: aResponse [
	
	^ multipleChoiceQuestion includesResponse: aResponse
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
SaMultipleChoiceWidget >> unsetResponse: aResponse [

	^ multipleChoiceQuestion unsetResponse: aResponse

]
