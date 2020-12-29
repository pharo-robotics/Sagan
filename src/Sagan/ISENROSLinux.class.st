Class {
	#name : #ISENROSLinux,
	#superclass : #ISENROSLesson,
	#category : #'Sagan-ISENRos'
}

{ #category : #accessing }
ISENROSLinux >> filesystem [ 
	^ super filesystem / #linux 
]

{ #category : #accessing }
ISENROSLinux >> lesson [

	^ SaLesson new
		  title: 'Linux';
		  addUnit: self objectives;
		  addUnit: self whatIsLinuxMC;
		  addUnit: self someHistory;
		  addUnit: self linuxQuiz;
		  addUnit: self ubuntu;
		  addUnit: self whatIsLinuxMC;
		  "addUnit: self virtualBox;
		  addUnit: self installUbuntu; 
		  addUnit: self whatIsLinuxMC;
		  addUnit: self gettingOurEnvironmentRunning;"
		  addUnit: self summary;
		  yourself
]

{ #category : #accessing }
ISENROSLinux >> linuxQuiz [

	| questions |
	questions := OrderedCollection new.
	questions add: (SaMultipleChoiceQuestion new
			 question:
				 'Qu''est-ce que ce la difference entre GNU/Linux et Windows, MacOS, etc? ';
			 choices: { 'Système d''exploitation libre'.
				 'La couleur' };
			 yourself).
	questions add: (SaOpenQuestion new
			 question: 'Expliquez COPY-LEFT avec vos mots ';
			 yourself).
	^ SaQuestionaire new
		  title: 'Quiz Linux';
		  questions: questions reverse;
		  yourself
]

{ #category : #accessing }
ISENROSLinux >> objectives [

	^ SaMarkdownContent new
		  title: 'Objectives';
		  content: (self filesystem / 'objectives.md') readStream upToEnd;
		  yourself
]

{ #category : #accessing }
ISENROSLinux >> someHistory [

	^ SaMarkdownContent new
		  title: 'History';
		  content: (self filesystem / 'history.md') readStream upToEnd;
		  yourself
]

{ #category : #accessing }
ISENROSLinux >> summary [

	^ self objectives
]

{ #category : #accessing }
ISENROSLinux >> ubuntu [

	^ SaMarkdownContent new
		  title: 'Ubuntu';
		  content: (self filesystem / 'ubuntu.md') readStream upToEnd;
		  yourself
]

{ #category : #accessing }
ISENROSLinux >> whatIsLinuxMC [

	^ SaMultipleChoiceQuestion new
	     title: 'Quiz #1';
		  question: 'Qu''est-ce que ce Linux? ';
		  choices:
			  { 'Système d''exploitation'. 'Le codename d''un projet DARPA'.
			  'Système de reseaux'. 'Système robotique' };
		  yourself
]
