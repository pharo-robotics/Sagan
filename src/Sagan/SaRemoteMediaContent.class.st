"
I am a media content that happen to be remote.
Once the VLC bindings for video are working properly, i am going to render files that are mean to be opened remotely. For VLC this is a different API.

"
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
	self error: 'The remote media content sadly is not yet available.'.
"	vlc := VLCLibrary uniqueInstance createVLCInstance.
	mediaSelector := vlc
		createMediaFromLocation: url asString .
	player := VLCLibrary uniqueInstance mediaPlayerNewFromMedia: mediaSelector.
	^ player"
]

{ #category : #accessing }
SaRemoteMediaContent >> url [

	^ url
]

{ #category : #accessing }
SaRemoteMediaContent >> url: anUrl [
	url := anUrl asZnUrl
]
