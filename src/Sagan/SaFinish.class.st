Class {
	#name : #SaFinish,
	#superclass : #SaMarkdownContent,
	#category : #'Sagan-Model'
}

{ #category : #accessing }
SaFinish >> initialize [

	super initialize.
	title := 'Lesson finished'
]

{ #category : #accessing }
SaFinish >> isFinal [
	^ true
]

{ #category : #accessing }
SaFinish >> isSatisfied [
	^ false
]

{ #category : #accessing }
SaFinish >> whatIsMissing [

	^ 'Lesson finished! Export the contents, and continue with the next lesson :) '
]

{ #category : #accessing }
SaFinish >> widgetIn: aPresenter [
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
		label: 'Export Content!';
		action: [ aPresenter lesson export ].
	component layout add: c height: 100.
	c owner: component.
	^ component
]
