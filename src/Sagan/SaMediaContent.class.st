Class {
	#name : #SaMediaContent,
	#superclass : #SaUnit,
	#instVars : [
		'media'
	],
	#category : #'Sagan-Model'
}

{ #category : #accessing }
SaMediaContent >> isSatisfied [ 
	^ true
]

{ #category : #'as yet unclassified' }
SaMediaContent >> media [
	^ media ifNil: [ media := self openMedia ]
]

{ #category : #'as yet unclassified' }
SaMediaContent >> openMedia [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
SaMediaContent >> play [
	self media play
]

{ #category : #'as yet unclassified' }
SaMediaContent >> stop [
	self media stop
]

{ #category : #'as yet unclassified' }
SaMediaContent >> whatIsMissing [
	^ ''
]

{ #category : #accessing }
SaMediaContent >> widgetIn: aPresenter [

	| component c |
	component := aPresenter instantiate: SpDynamicPresenter.
	component layout: SpBoxLayout newVertical.
	c := aPresenter newLabel label:
		     'This is a video lesson. Please click on the button to access to the content.'.

	component layout add: c.
	c owner: component.
	c := aPresenter newButton
		     label: 'Play video';
		     action: [ self play ].
	component layout add: c.
	c owner: component.


	^ component
]
