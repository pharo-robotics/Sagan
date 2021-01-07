"
I can manage a lesson by using the controls of next, previous 
"
Class {
	#name : #SaLessonViewer,
	#superclass : #SaPresenter,
	#instVars : [
		'lesson',
		'previousButton',
		'nextButton',
		'content',
		'progress',
		'unitTitleLabel'
	],
	#category : #'Sagan-UI'
}

{ #category : #specs }
SaLessonViewer class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #unitTitleLabel height:60;
		add: #content;
		add:
			(SpBoxLayout newHorizontal
				add: #previousButton width: 150 ;
				add: #progress;
				add: #nextButton width: 150;
				yourself)
		height: 50;
		
		yourself
]

{ #category : #accessing }
SaLessonViewer >> content: aSpRichTextPresenter [ 
	content := aSpRichTextPresenter.
	self update.
	content finishRendering.
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
	lesson backToFirstUnit.
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

	unitTitleLabel text:
		((MicroDownParser asText: '**' , aTitle , '**')
			 copyReplaceAll: String cr
			 with: '')
]

{ #category : #initialization }
SaLessonViewer >> updateLesson [

	lesson ifNil: [ 
		content := self newLabel.
		content disable.
		content label: ' No lesson set yet '.
		^ self ].

	lesson current renderIn: self.
	progress fixedPercentage: lesson completedPct.
	
]
