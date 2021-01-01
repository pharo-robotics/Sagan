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
ISENROSLinux >> installUbuntu [

	^ SaVideoContent new
		  title: 'Installer Ubuntu';
		  url: 'https://www.youtube.com/watch?v=H-QLRYSVCYo';
		  yourself
]

{ #category : #accessing }
ISENROSLinux >> lesson [

	^ SaLesson new
		  title: 'Linux';
		  addUnit: self installUbuntu;
		  addUnit: self objectives;
		  addUnit: self whatIsLinuxMC;
		  addUnit: self someHistory;
		  addUnit: self linuxQuiz;
		  addUnit: self ubuntu;
		  addUnit: self ubuntuQuiz;
		  addUnit: self virtualBox;
		  addUnit: self vboxQuiz;
		  addUnit: self installUbuntu;
		  "addUnit: self whatIsLinuxMC;
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
		  title: 'Quiz #2: GNU/Linux';
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

	^ SaMarkdownContent new
		  title: 'Summary';
		  content: (self filesystem / 'summary.md') readStream upToEnd;
		  yourself
]

{ #category : #accessing }
ISENROSLinux >> ubuntu [

	^ SaMarkdownContent new
		  title: 'Ubuntu';
		  content: (self filesystem / 'ubuntu.md') readStream upToEnd;
		  yourself
]

{ #category : #accessing }
ISENROSLinux >> ubuntuQuiz [

	| questions |
	questions := OrderedCollection new.
	questions add: (SaMultipleChoiceQuestion new
			 question:
				 'Pour quoi est-ce qu''on a decide utiliser Ubuntu?  ';
			 choices: { 'ROS est largement testé en Ubuntu '.
				 'On aime bien l''orange'.  'Ubuntu le meilleure linux'. };
			 yourself).
	questions add: (SaOpenQuestion new
			 question: 'Argumenter la reponse de la question prescedent ';
			 yourself).
	^ SaQuestionaire new
		  title: 'Quiz #3: Ubuntu';
		  questions: questions reverse;
		  yourself
]

{ #category : #accessing }
ISENROSLinux >> vboxQuiz [

	| questions |
	questions := OrderedCollection new.
	questions add: (SaMultipleChoiceQuestion new
			 question: 'A quoi ça serve la virtualization?';
			 singleResponse: false;
			 choices:
				 { 'Maximizer l''utilization des resources computationelles'.
				 'Minimizer le gaspillage d''electricité'.
				 'Faciliter la modularization des systemes' };
			 yourself).
				questions add: (SaMultipleChoiceQuestion new
			 question: 'Qu''est-ce qu''on trouve en common entre Linux et Virtualbox?';
			 choices:
				 { 'Ils sont partie de la famille GNU'.
				 'Ils sont developpe que pour travailler avec les architectures  x86 et AMD64/Intel64'.
				 'Apartiens a Oracle' };
			 yourself).
	questions add: (SaOpenQuestion new
			 question: 'Expliquez avec vos mot pour quoi est-ce que vous pensez que c''est important l''utilization de virtual box dans notre cours';
			 yourself).
	^ SaQuestionaire new
		  title: 'Quiz #4: Virtualization';
		  questions: questions reverse;
		  yourself
]

{ #category : #accessing }
ISENROSLinux >> virtualBox [

	^ SaMarkdownContent new
		  title: 'Virtualization';
		  content: (self filesystem / 'virtualbox.md') readStream upToEnd;
		  yourself
]

{ #category : #accessing }
ISENROSLinux >> whatIsLinuxMC [

	^ SaMultipleChoiceQuestion new
	     title: 'Quiz #1: Linux';
		  question: 'Qu''est-ce que ce Linux? ';
		  choices:
			  { 'Système d''exploitation'. 'Le codename d''un projet DARPA'.
			  'Système de reseaux'. 'Système robotique' };
		  yourself
]
