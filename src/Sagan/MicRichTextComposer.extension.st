Extension { #name : #MicRichTextComposer }

{ #category : #'*Sagan' }
MicRichTextComposer >> visitExternalLink: aLink [
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
