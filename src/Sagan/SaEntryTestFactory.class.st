"
Ce test est un test 'État de lieu'. 

Ne commence pas cet test sans avoir lu tout ce texte. C'est tres important pour vous sauver du temps.

Il faut sûr tout pas se stresser. Le bout de cet examen est tout simplement comprendre le niveau de base avec le quelle on vas travailler.

Ce test en les parties suivantes:

- Information demographique (relation des experiences prescedentes) 
- Concepts genereaux du development logiciel
- Concepts genereaux des systemes d'exploitation
- Concepts genereaux des langages de development. 
- Concepts genereaux des Version control system. 
- Concepts genereaux des Reseaux. 
- Concepts genereaux des Mathematique de base.

Une fois que vous avez finis l'examen il vas vous apparaitre un bouton ""Export Content!"". Ce button va faire l'export des votres reponses.
Il faudrait apres les envoyer par courriel a votre professeur. 
Ne ferme pas la fenetre du capsule d'avant vous assurer de avoir bien envoyé le fichier. 
Vous risquez de perdre vos reponses.

"
Class {
	#name : #SaEntryTestFactory,
	#superclass : #Object,
	#category : #'Sagan-Model'
}

{ #category : #'as yet unclassified' }
SaEntryTestFactory >> concepts [

	^ SaOpenQuestionList new
		  title: 'Concepts';
		  questions:
			  { 'Qu''est-ce que ce un program?'. 'Quels paradigme développement logiciel est-ce que vous connaissez?'.
			  'Quels paradigme vous avez utilisé? '.
			  'Qu''est-ce que vous comprenez par polymorphisme?'.
			  'Qu''est-ce que vous comprenez par héritage?'.
			  'Qu''est-ce que vous comprenez par déclarativité?'.
			  'Qu''est-ce que vous comprenez par Test Driven Development (TDD)?' };
		  yourself
]

{ #category : #'as yet unclassified' }
SaEntryTestFactory >> demographicQuestions [

	^ SaSatisfactionQuestionTable new
		  title: 'Questions generaux';
		  possibleResponses:
			  #( 'Quoi?' 'Non' '1 Mois' ' 1 An' ' Plus d''un an' );
		  questions:
			  { 'avez vous utilisé ROS?'. 'avez vous utilisé Linux?'.
			  'avez vous utilisé Ubuntu?'. 'avez vous utilisé Bash?'.
			  'avez vous utilisé C?'. 'avez vous utilisé C++?'.
			  'avez vous utilisé Python?'. 'avez vous utilisé Makefile/CMake?'.
			  'avez vous utilisé Git?'. 'avez vous utilisé ROS?'.
			  'avez vous experience en travaille en equipe? ' };
		  yourself
]

{ #category : #'as yet unclassified' }
SaEntryTestFactory >> explanation [

	^ SaMarkdownContent new
		  title: 'État de lieux';
		  content: self testExplanation;
		  yourself
]

{ #category : #'as yet unclassified' }
SaEntryTestFactory >> test [

	^ SaLesson new
		  title: 'Intro Test';
		  addUnit: self explanation;
		  addUnit: self demographicQuestions;
		  addUnit: self concepts;
		  yourself
]

{ #category : #tests }
SaEntryTestFactory >> testExplanation [
	^ self class comment
]
