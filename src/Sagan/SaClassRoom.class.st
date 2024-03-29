"
I am the class room . The main widget. I have the lessons and the lesson viewer. 
"
Class {
	#name : #SaClassRoom,
	#superclass : #SaPresenter,
	#instVars : [
		'listables',
		'preview',
		'toolbar',
		'statusbar',
		'lessonsTable',
		'course',
		'window'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Sagan-UI'
}

{ #category : #layout }
SaClassRoom class >> defaultLayout [

	^ SpBoxLayout newVertical
		  add: #toolbar height: self toolbarHeight * 1.5;
		  add: (SpPanedLayout newHorizontal
				   positionOfSlider: 15 percent;
				   add: #listables;
				   add: #preview;
				   yourself);
		  yourself
]

{ #category : #specs }
SaClassRoom class >> initialize [

	SessionManager default unregisterClassNamed: self name.
	SessionManager default
		registerGuiClassNamed: self name
		atPriority: 100000
]

{ #category : #specs }
SaClassRoom class >> openSaganClassroom [

	instance ifNotNil: [ instance isClosed ifFalse: [ ^ self ] ].
	instance := self new.
	SpWorldPresenter new
		presenter: instance;
		open
]

{ #category : #specs }
SaClassRoom class >> shutDown:  isQuitting [
	isQuitting ifTrue: [self allInstances do: #close.]
	
]

{ #category : #specs }
SaClassRoom class >> startUp: isANewSession [

	isANewSession ifTrue: [ self openSaganClassroom ]
]

{ #category : #specs }
SaClassRoom class >> worldMenuOn: aBuilder [

	<worldMenu>
	(aBuilder item: #'Sagan')
		parent: #Tools;
		action: [ self openSaganClassroom ];
		order: 0;
		help: 'System browser to browse and edit code.';
		iconName: #databaseAdd.
	
]

{ #category : #initialization }
SaClassRoom >> aboutSaganVideo [
	WebBrowser openOn: 'http://rmod-files.lille.inria.fr/Teach/sagan.mp4'
]

{ #category : #adding }
SaClassRoom >> addLesson [
	self notYetImplemented 
]

{ #category : #adding }
SaClassRoom >> addUnit [
	self notYetImplemented 
]

{ #category : #initialization }
SaClassRoom >> course: aCourse [
	course := aCourse. 
	self updateCourse.
]

{ #category : #initialization }
SaClassRoom >> do: aKeyMessage [
	self perform: aKeyMessage	"
	[ self perform: aKeyMessage ]
		on: Error
		do: [ :e | UIManager default alert: e messageText ]"
]

{ #category : #initialization }
SaClassRoom >> initializeToolbar [
	toolbar
		addItemLeft:
			(self newToolbarButton
				label: 'Course';
				icon: (self iconNamed: #open);
				help: 'Open';
				action: [ self do: #openCourse ];
				yourself).

	toolbar
		addItemLeft:
			(self newToolbarButton
				label: 'Update Sagan';
				icon: (self iconNamed: #refresh);
				help: 'Update Sagan!';
				action: [ self do: #updateSagan ];
				yourself).
	toolbar
		addItemLeft:
			(self newToolbarButton
				label: 'Save';
				icon: (self iconNamed: #glamorousSave);
				help: 'Save progress';
				action: [ self do: #save ];
				yourself).
	toolbar
		addItemRight:
			(self newToolbarButton
				label: 'Quit';
				icon: (self iconNamed: #smallQuit);
				help: 'Quit Sagan';
				action: [ self do: #quit ];
				yourself).
	toolbar
		addItemLeft:
			(self newToolbarButton
				label: 'About';
				icon: ((self iconNamed: #question) scaledToSize: 25 @ 25);
				help: 'Video About Sagan';
				action: [ self do: #aboutSaganVideo ];
				yourself)
]

{ #category : #initialization }
SaClassRoom >> initializeWidgets [

	super initializeWidgets.
	
	preview := self newLessonViewer.
	toolbar := self newToolbar.
	statusbar := self newStatusBar.
	self initializeToolbar. 
	lessonsTable := self newLessonEntryTable.
	
	listables := self newNotebook.
	listables addPage:
		(self newNotebookPageWith: lessonsTable and: 'Lessons').
	
	
	
]

{ #category : #initialization }
SaClassRoom >> initializeWindow: aWindow [

	window := aWindow.
	window aboutText: 'Sagan'.
	window title: 'Sagan'.
	
	window askOkToClose: true
]

{ #category : #testing }
SaClassRoom >> isClosed [

	^ window isNil or: [ window isClosed ]
]

{ #category : #initialization }
SaClassRoom >> maximize [

	window maximize
]

{ #category : #initialization }
SaClassRoom >> openCourse [
	| courses selected |
	courses := SaCourse courses.
	selected := UIManager default chooseFrom: courses keys values: courses keys lines: #() message: '' title: 'Please choose a course to open from the available courses'.
	selected ifNil: [ ^ self inform: 'Non course choosen. Nothing to open' ].
	
	self course:( SaCourse openCourse: selected).
]

{ #category : #initialization }
SaClassRoom >> quit [

	Smalltalk
		snapshot: (UIManager default
				 confirm: 'Save progress before quitting?' translated
				 orCancel: [ ^ self ])
		andQuit: true
]

{ #category : #initialization }
SaClassRoom >> registerSSHKey [

	| pub |
	(FileLocator home / '.ssh' / 'id_rsa.pub') exists ifFalse: [ 
		LibC runCommand:
			'ssh-keygen -t rsa -q -f "$HOME/.ssh/id_rsa" -N ""	' ].
	pub := (FileLocator home / '.ssh' / 'id_rsa.pub') readStream upToEnd.
	Clipboard clipboardText: pub.
	UIManager default alert:
		'The SSH Key is in your clipboard. You just need to accept this message, and the github page for adding SSH keys will open. Just paste the content in the Key area, accept and you are done'.
	WebBrowser openOn: 'https://github.com/settings/ssh/new'
]

{ #category : #initialization }
SaClassRoom >> requestWindowClose [
	^ true
]

{ #category : #initialization }
SaClassRoom >> save [
	Smalltalk snapshot: true andQuit: false.
	self inform: 'Progress saved'
]

{ #category : #initialization }
SaClassRoom >> setLesson: aLesson [

	aLesson ifNotNil: [ preview lesson: aLesson ]
]

{ #category : #initialization }
SaClassRoom >> updateCourse [

	lessonsTable items: course lessons.
	lessonsTable selectItem: lessonsTable items first.
	window title: 'Sagan: ' , (course title ifNil: [ '' ])
]

{ #category : #initialization }
SaClassRoom >> updateSagan [
	window close.
	(IceRepository registry detect: [ :s | s name = 'Sagan' ])
		discardChanges;
		pull.
	(IceRepository registry detect: [ :s | s name = 'RobotsDuNordROS' ])
		discardChanges;
		pull.
	Metacello new
		baseline: 'Sagan';
		repository: 'github://sbragagnolo/Sagan';
		onConflictUseIncoming;
		load.
	Metacello new
		baseline: 'RobotsDuNordROS';
		repository: 'github://pharo-robotics/RobotsDuNordROS';
		onConflictUseIncoming;
		load.
	self class openSaganClassroom
]
