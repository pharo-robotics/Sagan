Class {
	#name : #ISENROSGit,
	#superclass : #ISENROSLesson,
	#category : #'Sagan-ISENRos'
}

{ #category : #'as yet unclassified' }
ISENROSGit >> filesystem [ 
	^ super filesystem / #bash 
]

{ #category : #'as yet unclassified' }
ISENROSGit >> lesson [
	^ SaLesson new
		title: 'Bash';
		addUnit: self objectives;
		addUnit: self whatIsGit;
		addUnit: self gitHistory;
		addUnit: self gitQuiz;
		addUnit: self gitTutorial;
		addUnit: self gitExercises;
		addUnit: self summary;
		yourself
]
