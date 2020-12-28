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
				position: 20 percent;
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
			 label: 'Lesson';
			 icon: (self iconNamed: #add);
			 help: 'New Lesson';
			 action: [ self addLesson ];
			 yourself).


	toolbar addItemLeft: (self newToolbarButton
			 label: 'Unit';
			 icon: (self iconNamed: #add);
			 help: 'New Unit';
			 action: [ self addUnit ];
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
	
	self course: ISENROSCourse course.
	
]

{ #category : #initialization }
SaClassRoom >> setLesson: aLesson [

	aLesson ifNotNil: [ preview lesson: aLesson ]
]

{ #category : #initialization }
SaClassRoom >> updateCourse [
	lessonsTable items: course lessons
]
