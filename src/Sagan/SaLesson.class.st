"
#Lesson
I represent a lesson on-going. 
I hold the units but i mix the behaviour of passing by the lesson . Not sure is the best strategy, but is simple and so far good enough. 

I track the date when i have been started. 
I have an order to be prioritized by the course (lesson 1, 2, 3 etc)

I understand the messages next, previous and backToFirstUnit that allow to handle where is the student .

Finally, I have a title :) 
"
Class {
	#name : #SaLesson,
	#superclass : #Object,
	#instVars : [
		'order',
		'units',
		'title',
		'current',
		'startedDate',
		'finishedDate',
		'submitFolder',
		'id'
	],
	#category : #'Sagan-Model'
}

{ #category : #adding }
SaLesson >> addUnit: aSaMarkdownContent [
	self
		assert: (units noneSatisfy: [ :u | u id = aSaMarkdownContent id ]).
	aSaMarkdownContent order: units size.
	units add: aSaMarkdownContent
]

{ #category : #adding }
SaLesson >> addUnit: aUnit id: anId [
	aUnit id: anId.
	self addUnit: aUnit
]

{ #category : #accessing }
SaLesson >> backToFirstUnit [
	current := 1.
]

{ #category : #accessing }
SaLesson >> completedPct [

	^ 100 * (current - 1) / (units size max: 1)
]

{ #category : #accessing }
SaLesson >> current [

	^ current > units size
		  ifTrue: [ SaLessonSummary new ]
		  ifFalse: [ units at: current ]
]

{ #category : #accessing }
SaLesson >> ensureGitRepo [

	| dir username |
	dir := FileLocator home / '.sagan'.
	dir ensureCreateDirectory.
	(dir / '.git') exists ifTrue: [ ^ self ].
	username := UIManager default
		            request: 'Please enter your github account USER NAME'
		            initialAnswer: (Author fullNamePerSe ifNil: [ '' ]).
	username ifNil: [ 
		UIManager default alert: 'Imposible to submit without Username'.
		^ self ].
	LibC runCommand:
		('cd {1}; git clone git@github.com:isen-ros/{2}.git .' format: { 
				 dir fullName.
				 username })
]

{ #category : #'as yet unclassified' }
SaLesson >> export [

	| dir |
	dir := UIManager default
		       chooseDirectory: 'Choose a path for exporting'
		       path: FileLocator home asFileReference.
	dir ifNil: [ ^ self inform: 'Exporting cancelled' ].
	self export: dir
]

{ #category : #'as yet unclassified' }
SaLesson >> export: dir [

	| file stream |
	file := dir / (title , '.lesson.' , order asString) , 'ston'.
	file exists ifTrue: [ file delete ].
	stream := file writeStream.
	STON put: self onStream: stream.
	stream
		flush;
		close
]

{ #category : #accessing }
SaLesson >> finish [
	finishedDate ifNotNil: [ finishedDate := DateAndTime now ].
	^ SaLessonSummary new
]

{ #category : #'as yet unclassified' }
SaLesson >> githubSubmit [

	| dir |
	self ensureGitRepo.
	dir := FileLocator home / '.sagan' / self submitFolder .
	dir ensureCreateDirectory.
	self export: dir.
	self inform: (LibC resultOfCommand:
			 ('cd {1}; git add . ; git commit -m "Submitting {2}" ; git pull ; git push  ' 
				  format: { 
						  dir fullName.
						  title }))
]

{ #category : #'as yet unclassified' }
SaLesson >> id [
	^ id
]

{ #category : #accessing }
SaLesson >> id: anId [
	id := anId
]

{ #category : #accessing }
SaLesson >> initialize [

	super initialize.
	units := OrderedCollection new.
	current := 1.
]

{ #category : #'as yet unclassified' }
SaLesson >> loadStateFrom: anOtherLesson [
	anOtherLesson units
		do: [ :old | 
			units
				detect: [ :new | new id = old id ]
				ifFound: [ :new | new loadStateFrom: old ] ]
]

{ #category : #accessing }
SaLesson >> next [
	self start.
	self current isFinal
		ifTrue: [ ^ self ].
	self current isSatisfied
		ifFalse: [ ^ self error: self current whatIsMissing ].
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

{ #category : #'as yet unclassified' }
SaLesson >> review [
	| room |
	room := SaClassRoom new.
	room
		course:
			(SaCourse new
				addLesson: self;
				yourself).
	room openWithSpec
]

{ #category : #'as yet unclassified' }
SaLesson >> reviewStudent: aStudentName [
	| room |
	title := title , ' (' , aStudentName , ')'.
	room := SaClassRoom new.
	room
		course:
			(SaCourse new
				addLesson: self;
				yourself).
	room openWithSpec
]

{ #category : #accessing }
SaLesson >> start [

	startedDate ifNotNil: [ startedDate := DateAndTime now ]
]

{ #category : #'as yet unclassified' }
SaLesson >> submit [
	self export ."
	(OSPlatform current isUnix or: [ OSPlatform current isMacOS ])
		ifTrue: [ self githubSubmit ]
		ifFalse: [ 
			UIManager default alert:
				'Meanwhile working on windows, Sagan cannot connect directly to github. 
We are going to proceed to export the assignement. 
For finishing the submition you have to manually upload the file to your assigned repository, in the folder ' , submitFolder .
					self export ]"
]

{ #category : #'as yet unclassified' }
SaLesson >> submitFolder [
	^ submitFolder ifNil: [ #default ]
]

{ #category : #'as yet unclassified' }
SaLesson >> submitFolder: aFolderName [
	submitFolder := aFolderName
]

{ #category : #accessing }
SaLesson >> title [

	^ title
]

{ #category : #accessing }
SaLesson >> title: aTitle [	
	title := aTitle 
]

{ #category : #'as yet unclassified' }
SaLesson >> units [
	^ units
]
