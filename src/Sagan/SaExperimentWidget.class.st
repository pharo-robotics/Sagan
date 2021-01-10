Class {
	#name : #SaExperimentWidget,
	#superclass : #SaPresenter,
	#instVars : [
		'title',
		'explanation',
		'notes',
		'start',
		'stop',
		'experiment'
	],
	#category : #'Sagan-UI'
}

{ #category : #specs }
SaExperimentWidget class >> defaultSpec [
	^ SpBoxLayout newVertical
		
		add: #explanation;
		add: #title height: self toolbarHeight * 1.5;
		add: #notes;
		add:
			(SpBoxLayout newHorizontal
				add: #start width: 100;
				add: #stop width: 100)
			height: self toolbarHeight * 1.5
]

{ #category : #initialization }
SaExperimentWidget >> experiment: anExperiment [ 
	experiment := anExperiment.
	self updateExperiment. 

]

{ #category : #initialization }
SaExperimentWidget >> initializeWidgets [
	super initializeWidgets.
	start := self newButton.
	start icon: (self iconNamed: #glamorousGo).
	start action: [ self start ].
	stop := self newButton.
	stop icon: (self iconNamed: #protocolPrivate).
	stop action: [ self stop ].
	notes := self newText.
	notes whenTextChangedDo: [ :t | self updateNotes: t ].
	explanation := self newText.
	title := self newLabel.
	title label: 'Take notes in this second text area'.
]

{ #category : #initialization }
SaExperimentWidget >> start [
	experiment ifNotNil: [ experiment play ]
]

{ #category : #initialization }
SaExperimentWidget >> stop [
	experiment ifNotNil: [ experiment stop ]
]

{ #category : #initialization }
SaExperimentWidget >> updateExperiment [
	experiment ifNil: [ ^ self ].
	notes text: experiment response.
	explanation text: (MicroDownParser asText: experiment description).
	
]

{ #category : #initialization }
SaExperimentWidget >> updateNotes: aText [
	experiment ifNil: [ ^ self ].
	experiment response: aText asString
]
