Class {
	#name : #SaLessonViewer,
	#superclass : #SaPresenter,
	#instVars : [
		'lesson',
		'previousButton',
		'nextButton',
		'content',
		'ribbon',
		'progress',
		'unitTitleLabel'
	],
	#category : #'Sagan-UI'
}

{ #category : #specs }
SaLessonViewer class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: #unitTitleLabel height: self toolbarHeight;
		  add: #progress height: 10;
		  add: (SpBoxLayout newHorizontal
				   add: #previousButton width: self toolbarHeight;
				   add: #content;
				   add: #nextButton width: self toolbarHeight;
				   yourself);
		  yourself
]

{ #category : #accessing }
SaLessonViewer >> content: aSpRichTextPresenter [ 
	content := aSpRichTextPresenter
]

{ #category : #initialization }
SaLessonViewer >> initializeWidgets [

	super initializeWidgets.
	previousButton := self newButton.
	previousButton label: '<'.
	previousButton action: [ self previous ].

	nextButton := self newButton.
	nextButton label: '>'.
	nextButton action: [ self next ].

	progress := self newProgressBar.
	progress fixedPercentage: 0.
	ribbon := self newProgressBar.
	ribbon fixedPercentage: 0.
	unitTitleLabel := self newTextInput.
	unitTitleLabel enabled: false .
	self updateLesson
]

{ #category : #accessing }
SaLessonViewer >> lesson [
	^ lesson
]

{ #category : #initialization }
SaLessonViewer >> lesson: aLesson [ 
	lesson := aLesson. 
	self updateLesson.
]

{ #category : #'previous ' }
SaLessonViewer >> next [

	lesson ifNil: [ ^ self ].
	[ lesson next ]
		on: Error
		do: [ :e | 
			UIManager default
				alert: e messageText
				title: 'Cannot yet leave this unit'.
			^ self ].
	progress fixedPercentage: lesson completedPct.
	self updateLesson
]

{ #category : #'previous ' }
SaLessonViewer >> previous [

	lesson ifNil: [ ^ self ].
	lesson previous.
	progress fixedPercentage: lesson completedPct.
	self updateLesson
]

{ #category : #'previous ' }
SaLessonViewer >> unitTitle: aTitle [
	unitTitleLabel text: ((MicroDownParser asText: '#**', aTitle, '**') copyReplaceAll: String cr with:'')

]

{ #category : #initialization }
SaLessonViewer >> updateLesson [

	lesson ifNil: [ 
		content := self newLabel.
		content disable.
		content label: ' No lesson set yet '.
		^ self ].

	lesson current renderIn: self.
	self update.
]
