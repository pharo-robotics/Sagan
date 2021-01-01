Class {
	#name : #SaVideoContent,
	#superclass : #SaUnit,
	#instVars : [
		'url'
	],
	#category : #'Sagan-Model'
}

{ #category : #accessing }
SaVideoContent >> isSatisfied [ 
	^ true
]

{ #category : #accessing }
SaVideoContent >> url [

	^ url
]

{ #category : #accessing }
SaVideoContent >> url: anUrl [

	url := anUrl
]

{ #category : #'as yet unclassified' }
SaVideoContent >> whatIsMissing [
	^ ''
]

{ #category : #accessing }
SaVideoContent >> widgetIn: aPresenter [

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
