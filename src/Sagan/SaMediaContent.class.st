"
I am some kind of media content. 
I hold some markdown content that describes the content of the video / audio. 
I am not markdowncontent subclass because the rendering and management of the content is radically different. 

I should consider to unify my self with markdowncontent.
"
Class {
	#name : #SaMediaContent,
	#superclass : #SaUnit,
	#instVars : [
		'media',
		'overview'
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
SaMediaContent >> overview: aContent [
	overview := aContent
]

{ #category : #'as yet unclassified' }
SaMediaContent >> play [
	self media play
]

{ #category : #'as yet unclassified' }
SaMediaContent >> stop [
	self media stop
]

{ #category : #accessing }
SaMediaContent >> videoOverview [
	^ overview
		ifNil:
			[ '#This is a video lesson. Please click on the button to access to the content.' ]
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
	c := (aPresenter instantiate: SpTextPresenter) text:
		     (MicrodownParser convertToRichText: self videoOverview).
	component layout add: c.
	c owner: component.
	c := aPresenter newButton
		     label: 'Play video';
		     action: [ self play ].
	component layout add: c height: 50.
	c owner: component.
	^ component
]
