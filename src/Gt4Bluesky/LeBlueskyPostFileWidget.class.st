Class {
	#name : #LeBlueskyPostFileWidget,
	#superclass : #BrAsyncFileWidget,
	#instVars : [
		'isDeletable',
		'file',
		'onDeletion'
	],
	#category : #'Gt4Bluesky-Snippet'
}

{ #category : #accessing }
LeBlueskyPostFileWidget >> buildDeleter [
	^ BrButton new beTinySize
		aptitude: BrGlamorousButtonWithIconCircularAptitude;
		icon: BrGlamorousVectorIcons cancel;
		label: 'Remove file';
		action: [ self onDeletion value: self file ];
		constraintsDo: [ :c | 
			c ignoreByLayout.
			c ignored horizontal alignRight.
			c ignored vertical alignTop ];
		margin: (BlInsets top: -8 right: -14)
]

{ #category : #accessing }
LeBlueskyPostFileWidget >> defaultPostAction [
	^ [ :anElement | self isDeletable ifTrue: [ anElement addChild: self buildDeleter ] ]
]

{ #category : #accessing }
LeBlueskyPostFileWidget >> file [
	^ file
]

{ #category : #accessing }
LeBlueskyPostFileWidget >> file: aFile [
	file := aFile.
	super file: aFile
]

{ #category : #accessing }
LeBlueskyPostFileWidget >> initialize [
	super initialize.
	self clipChildren: false.
	isDeletable := true.

	self postAction: self defaultPostAction
]

{ #category : #accessing }
LeBlueskyPostFileWidget >> isDeletable [
	^ isDeletable
]

{ #category : #accessing }
LeBlueskyPostFileWidget >> isDeletable: anObject [
	isDeletable := anObject
]

{ #category : #accessing }
LeBlueskyPostFileWidget >> onDeletion [
	^ onDeletion
]

{ #category : #accessing }
LeBlueskyPostFileWidget >> onDeletion: anObject [
	onDeletion := anObject
]
