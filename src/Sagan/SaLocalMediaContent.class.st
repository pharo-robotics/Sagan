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
