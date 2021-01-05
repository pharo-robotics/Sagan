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

{ #category : #accessing }
ISENROSLesson >> objectives [

	^ SaMarkdownContent new
		  title: 'Objectives';
		  content: (self filesystem / 'objectives.md') readStream upToEnd;
		  yourself
]

{ #category : #accessing }
ISENROSLesson >> summary [
	^ SaFinish new
		title: 'Summary';
		content: (self filesystem / 'summary.md') readStream upToEnd;
		yourself
]
