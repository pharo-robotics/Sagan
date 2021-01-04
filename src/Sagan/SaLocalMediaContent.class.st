Class {
	#name : #SaLocalMediaContent,
	#superclass : #SaMediaContent,
	#instVars : [
		'file',
		'playing'
	],
	#category : #'Sagan-Model'
}

{ #category : #'as yet unclassified' }
SaLocalMediaContent >> command [
	OSPlatform current isMacOS
		ifTrue: [ ^ '/Applications/VLC.app/Contents/MacOS/VLC' ].
	^ 'vlc '
]

{ #category : #accessing }
SaLocalMediaContent >> file: aFile [
	file := aFile asFileReference 
]

{ #category : #'as yet unclassified' }
SaLocalMediaContent >> openMedia [
	| vlc mediaSelector player |
	self error: 'This method is not really working as VLC binding. since we are having sigsegv issues. We are using simply LibC system'.
	vlc := VLCLibrary uniqueInstance createVLCInstance.
	mediaSelector := vlc createMediaFromPath: file fullNameWithIndicator.
	player := VLCLibrary uniqueInstance mediaPlayerNewFromMedia: mediaSelector.
	^ player
]

{ #category : #'as yet unclassified' }
SaLocalMediaContent >> play [
	LibC
		runCommand:
			('{1} {2} &'
				format:
					{self command.
					file fullName})
]
