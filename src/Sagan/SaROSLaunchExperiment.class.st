Class {
	#name : #SaROSLaunchExperiment,
	#superclass : #SaBashExperiment,
	#category : #'Sagan-Model'
}

{ #category : #'as yet unclassified' }
SaROSLaunchExperiment >> stop [
	 LibC runCommand: 'killall roslaunch'
]
