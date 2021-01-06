"
I am a failed attempt to draw videos in athens / cairo canvas 
"
Class {
	#name : #SaVideoPresenter,
	#superclass : #Object,
	#instVars : [
		'file',
		'window',
		'renderer',
		'texture',
		'width',
		'height',
		'mediaPlayer',
		'mutex'
	],
	#pools : [
		'SDL2Constants',
		'SDL2Types'
	],
	#category : #'Sagan-UI'
}

{ #category : #'as yet unclassified' }
SaVideoPresenter >> display: data id: id [
	self halt.
	" what do we do here?"

"	renderer
		drawColorR: 0
		g: 80
		b: 0
		a: 255.
	renderer clear.
	renderer copy: texture.
	renderer present"
	^ nil
]

{ #category : #'as yet unclassified' }
SaVideoPresenter >> initialize [
	super initialize.
	width := 1024.
	height := 480
]

{ #category : #'as yet unclassified' }
SaVideoPresenter >> lock: data andPixels: ppixel [
	self halt.
	"SDL2 lockMutex: data mutex.
	texture lockPixels: ppixel pitch: nil."
	^ nil.
]

{ #category : #'as yet unclassified' }
SaVideoPresenter >> playVideo: aFileReference [
	| ctx vlc media |
	ctx := VLCSDLContext externalNew.
	mutex := SDL2 createMutex.
	ctx mutex: mutex pointer.
	SDL2 initVideo.
	"window := SDL2 createWindow: 'Test Window'
					x: SDL_WINDOWPOS_UNDEFINED
					y: SDL_WINDOWPOS_UNDEFINED
					width: width
					height: height
					flags: SDL_WINDOW_SHOWN.
	renderer:= window createDefaultRenderer.
	texture := renderer createTextureFormat: SDL_PIXELFORMAT_BGR565
						access: SDL_TEXTUREACCESS_STREAMING width:  width height: height.

	
	ctx renderer: renderer pointer.
	ctx texture: texture pointer. 
	"
	vlc := VLCLibrary uniqueInstance createVLCInstance.
	media := vlc
		createMediaFromPath: aFileReference fullNameWithIndicator.
	mediaPlayer := VLCLibrary uniqueInstance
		mediaPlayerNewFromMedia: media.
	mediaPlayer play.
	VLCLibrary uniqueInstance
		videoSetCallbacksMediaPlayer: mediaPlayer
		lockCallback: VLCSDLLock defaultOn" (VLCSDLLock on: [ :data :ppixel | self lock: data andPixels: ppixel ])"
		unlockCallback: VLCSDLUnlock defaultOn 
			"(VLCSDLUnlock
				on: [ :data :id :ppixel | self unlock: data id: id andPixels: ppixel ])"
		displayCallback: VLCSDLDisplay defaultOn  "(VLCSDLDisplay on: [ :data :id | self display: data id: id ])"
		opaque: ctx .
	VLCLibrary uniqueInstance
		videoSetFormatMediaPlayer: mediaPlayer
		chroma: 'RV16'
		width: width
		height: height
		pitch: width * 2.
	2 seconds sleep.
	mediaPlayer stop
]

{ #category : #'as yet unclassified' }
SaVideoPresenter >> stop [
	mediaPlayer
		ifNotNil: [ mediaPlayer stop.
			mediaPlayer := nil ]
]

{ #category : #'as yet unclassified' }
SaVideoPresenter >> unlock: data id: id andPixels: ppixel [
	self halt.
	"SDL2 lockMutex: data mutex.
	texture unlock"
	^ nil
]
