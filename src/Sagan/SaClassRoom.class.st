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
		'course'
	],
	#category : #'Sagan-UI'
}

{ #category : #specs }
SaClassRoom class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #toolbar height: self toolbarHeight * 1.5;
		add:
			(SpPanedLayout newHorizontal
				position: 15 percent;
				add: #listables;
				add: #preview;
				yourself);
		
		add: #statusbar height: self toolbarHeight * 1.5;
		yourself
]

{ #category : #specs }
SaClassRoom class >> openSaganClassroom [
	SaClassRoom new openWithSpec  title: 'Class room'
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
SaClassRoom >> initializeToolbar [

	toolbar addItemLeft: (self newToolbarButton
			 label: 'Course';
			 icon: (self iconNamed: #open);
			 help: 'Open';
			 action: [ self openCourse ];
			 yourself).

	toolbar addItemLeft: (self newToolbarButton
			 label: 'SSHKey';
			 icon: (self iconNamed: #user);
			 help:
				 'Sagan uses some basic GIT commands to submit the content in the course.';
			 action: [ self registerSSHKey ];
			 yourself).
			
toolbar addItemLeft: (self newToolbarButton
			 label: 'Update Sagan';
			 icon: (self iconNamed: #refresh);
			 help:
				 'Update Sagan!';
			 action: [ self updateSagan ];
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
SaClassRoom >> openCourse [
	| courses selected |
	courses := SaCourse courses.
	selected := UIManager default chooseFrom: courses keys values: courses values lines: #() message: '' title: 'Please choose a course to open from the available courses'.
	selected ifNil: [ ^ self inform: 'Non course choosen. Nothing to open' ].
	self course: selected.
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
SaClassRoom >> setLesson: aLesson [

	aLesson ifNotNil: [ preview lesson: aLesson ]
]

{ #category : #initialization }
SaClassRoom >> updateCourse [
	lessonsTable items: course lessons
]

{ #category : #initialization }
SaClassRoom >> updateSagan [
	
	(IceRepository registry detect: [ :s | s name = 'sagan' ])
		discardChanges;
		pull.
	Metacello new
		baseline: 'Sagan';
		repository: 'github://sbragagnolo/sagan';
		onConflictUseIncoming;
		load
]
