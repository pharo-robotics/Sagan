Class {
	#name : #ISENROSLesson,
	#superclass : #Object,
	#category : #'Sagan-ISENRos'
}

{ #category : #'as yet unclassified' }
ISENROSLesson >> filesystem [

	^ 'pharo-local/iceberg/sbragagnolo/sagan/contents' asFileReference
]

{ #category : #accessing }
ISENROSLesson >> lesson [ 
	self subclassResponsibility 
]
