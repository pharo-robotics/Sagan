Class {
	#name : #SaLocalMediaContent,
	#superclass : #SaMediaContent,
	#instVars : [
		'file'
	],
	#category : #'Sagan-Model'
}

{ #category : #accessing }
SaLocalMediaContent >> file: aFile [
	file := aFile asFileReference 
]

{ #category : #'as yet unclassified' }
SaLocalMediaContent >> openMedia [
	| vlc mediaSelector player |
	vlc := VLCLibrary uniqueInstance createVLCInstance.
	mediaSelector := vlc createMediaFromPath: file fullNameWithIndicator.
	player := VLCLibrary uniqueInstance mediaPlayerNewFromMedia: mediaSelector.
	^ player
]

{ #category : #'as yet unclassified' }
SaLocalMediaContent >> play [  
file fullName inspect.
	^ self inform: (LibC resultOfCommand: ('/Applications/VLC.app/Contents/MacOS/VLC {1}' format: { file fullName }))
]
