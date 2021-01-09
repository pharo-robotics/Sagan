"
I am a finishing unit. 

Im never satisfied (to avoid the passage to ""next but unexisting lesson"") 
Normally i am in charge of holding the summary of the lesson. This is why i am subclass of markdowncontent
"
Class {
	#name : #SaLessonSummary,
	#superclass : #SaMarkdownContent,
	#category : #'Sagan-Model'
}

{ #category : #accessing }
SaLessonSummary >> initialize [

	super initialize.
	title := 'Lesson finished'
]

{ #category : #accessing }
SaLessonSummary >> isFinal [
	^ true
]

{ #category : #accessing }
SaLessonSummary >> isSatisfied [
	^ false
]

{ #category : #accessing }
SaLessonSummary >> whatIsMissing [

	^ 'Lesson finished! Export the contents, and continue with the next lesson :) '
]

{ #category : #accessing }
SaLessonSummary >> widgetIn: aPresenter [
	| component c text |
	component := aPresenter instantiate: SpDynamicPresenter.
	component layout: SpBoxLayout newVertical.
	c := aPresenter newLabel
		label:
			'Lesson finished! 
				Export the contents, 
				send it to the teacher by email,  and continue with the next lesson :)'.
	content isEmptyOrNil
		ifTrue: [ component layout add: c ]
		ifFalse: [ component layout add: c height: 100 ].
	c owner: component.
	content isEmptyOrNil
		ifFalse: [ text := super widgetIn: component.
			component layout add: text ].
	c := aPresenter newButton
		label: 'Submit exercise';
		action: [ aPresenter lesson submit ].
	component layout add: c height: 100.
	c owner: component.
	^ component
]
