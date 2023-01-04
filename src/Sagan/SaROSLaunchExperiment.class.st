Class {
	#name : #SaROSLaunchExperiment,
	#superclass : #SaBashExperiment,
	#category : #'Sagan-Model'
}

{ #category : #'as yet unclassified' }
SaROSLaunchExperiment >> play [

	played := true.
	LibC runCommand:
		('env -i `export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libharfbuzz.so.0; cd ~ ; source ~/.bashrc ; {1}` &' 
			 format: { command })
]

{ #category : #'as yet unclassified' }
SaROSLaunchExperiment >> stop [
	 LibC runCommand: 'killall roslaunch'
]
