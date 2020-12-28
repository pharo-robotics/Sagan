Class {
	#name : #SaFinish,
	#superclass : #SaUnit,
	#category : #'Sagan-Model'
}

{ #category : #accessing }
SaFinish >> initialize [

	super initialize.
	title := 'Lesson finished'
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

	| component c |
	component := aPresenter instantiate: SpDynamicPresenter.
	component layout: SpBoxLayout newVertical.
	c := aPresenter newLabel label: 
		     'Lesson finished! 
				Export the contents, 
				send it to the teacher by email,  and continue with the next lesson :)'.
				
	component layout add: c.
	c owner: component.
	c := aPresenter newButton label: 'Export Content!'; action: [ aPresenter lesson export] .
	component layout add: c.
	c owner: component.


	^ component
]
