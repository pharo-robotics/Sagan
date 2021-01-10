Extension { #name : #PRRichTextComposer }

{ #category : #'*Sagan' }
PRRichTextComposer >> visitExternalLink: aLink [
	| attribute target url |
	target := aLink reference.
	url := target asUrl.
	attribute := nil.
	(#(http https) includes: url scheme )
		ifTrue: [ attribute := "PRExternalLinkTextAction url: target"
			 	TextAction new actOnClickBlock: [WebBrowser openOn: target asString]].
	url scheme = #browse
		ifTrue:
			[ attribute := TextAction new actOnClickBlock: [ self class browse: target ] ].
	attribute
		ifNotNil:
			[ canvas includeAttribute: attribute in: [ self visitLink: aLink ] ]
		ifNil: [ self visitLink: aLink ]
]

{ #category : #'*Sagan' }
PRRichTextComposer >> visitFigure: aFigure [
	| anchoredImage image   |
	"Try to read a png file (only one supported right now), else use alt text"
	
	"for now I cancel the catching of all exceptions because it is a blackhole."
	"[" 
		
	image := (self cachedImageFromUrl: aFigure reference).
	aFigure parameters at: #size ifPresent: [ : s |
			image := image scaledToSize: s asNumber @ s asNumber ].

	
	anchoredImage := (String value: 1) asText
		addAttribute: (TextAnchor new anchoredMorph: image).
		canvas << anchoredImage 
		"] 
		on: Exception  
		do: [self visitAll: aFigure children]."
]
