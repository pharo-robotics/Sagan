Class {
	#name : #SaLesson,
	#superclass : #Object,
	#instVars : [
		'order',
		'units',
		'title',
		'current',
		'startedDate',
		'finishedDate'
	],
	#category : #'Sagan-Model'
}

{ #category : #adding }
SaLesson >> addUnit: aSaMarkdownContent [ 
	aSaMarkdownContent order: units size.
	units add: aSaMarkdownContent .
	
]

{ #category : #accessing }
SaLesson >> completedPct [

	^ 100 * current / units size
]

{ #category : #accessing }
SaLesson >> current [

	^ current > units size
		  ifTrue: [ SaFinish new ]
		  ifFalse: [ units at: current ]
]

{ #category : #'as yet unclassified' }
SaLesson >> export [

	| dir file stream |
	dir := UIManager default
		       chooseDirectory: 'Choose a path for exporting'
		       path: FileLocator home asFileReference.
	dir ifNil: [ ^ self inform: 'Exporting cancelled' ].
	file := dir / (title , '.lesson.' , order asString) , 'ston'.
	file exists ifTrue: [ 
		UIManager default alert:
			'The file already exist. (' , file fullname , ')' ].
	stream := file writeStream.

	STON put: self onStream: stream.
	stream
		flush;
		close
]

{ #category : #accessing }
SaLesson >> finish [
	finishedDate ifNotNil: [ finishedDate := DateAndTime now ].
	^ SaFinish new
]

{ #category : #accessing }
SaLesson >> initialize [

	super initialize.
	units := SortedCollection sortBlock: [ :l :l2 | l order < l2 order ].
	current := 1.
]

{ #category : #accessing }
SaLesson >> next [
	self start.
	self current isSatisfied ifFalse: [ 
		^ self error: self current whatIsMissing ].
	current := current + 1.
	^ current > units size
		  ifTrue: [ self finish ]
		  ifFalse: [ units at: current ]
]

{ #category : #accessing }
SaLesson >> order [

	^ order
]

{ #category : #accessing }
SaLesson >> order: aNumber [

	^ order := aNumber
]

{ #category : #accessing }
SaLesson >> previous [

	current := current - 1 max: 1.
	^ units at: current
]

{ #category : #accessing }
SaLesson >> reset [
	current := 1 .
]

{ #category : #accessing }
SaLesson >> start [

	startedDate ifNotNil: [ startedDate := DateAndTime now ]
]

{ #category : #accessing }
SaLesson >> title [

	^ title
]

{ #category : #accessing }
SaLesson >> title: aTitle [	
	title := aTitle 
]
