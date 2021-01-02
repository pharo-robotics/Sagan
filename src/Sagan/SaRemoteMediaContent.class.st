Class {
	#name : #SaRemoteMediaContent,
	#superclass : #SaMediaContent,
	#instVars : [
		'url'
	],
	#category : #'Sagan-Model'
}

{ #category : #'as yet unclassified' }
SaRemoteMediaContent >> openMedia [
	| vlc mediaSelector player |
	vlc := VLCLibrary uniqueInstance createVLCInstance.
	mediaSelector := vlc
		createMediaFromLocation: url asString .
	player := VLCLibrary uniqueInstance mediaPlayerNewFromMedia: mediaSelector.
	^ player
]

{ #category : #accessing }
SaRemoteMediaContent >> url [

	^ url
]

{ #category : #accessing }
SaRemoteMediaContent >> url: anUrl [
	url := anUrl asZnUrl
]
