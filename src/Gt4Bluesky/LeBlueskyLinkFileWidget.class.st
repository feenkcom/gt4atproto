Class {
	#name : #LeBlueskyLinkFileWidget,
	#superclass : #BrAsyncFileWidget,
	#instVars : [
		'isDeletable',
		'file',
		'onDeletion'
	],
	#category : #'Gt4Bluesky-Snippet'
}

{ #category : #accessing }
LeBlueskyLinkFileWidget >> buildDeleter [
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
LeBlueskyLinkFileWidget >> defaultPostAction [
	^ [ :anElement | self isDeletable ifTrue: [ anElement addChild: self buildDeleter ] ]
]

{ #category : #accessing }
LeBlueskyLinkFileWidget >> file [
	^ file
]

{ #category : #accessing }
LeBlueskyLinkFileWidget >> file: aFile [
	file := aFile.
	super file: aFile
]

{ #category : #accessing }
LeBlueskyLinkFileWidget >> initialize [
	super initialize.
	self clipChildren: false.
	isDeletable := true.

	self postAction: self defaultPostAction
]

{ #category : #accessing }
LeBlueskyLinkFileWidget >> isDeletable [
	^ isDeletable
]

{ #category : #accessing }
LeBlueskyLinkFileWidget >> isDeletable: anObject [
	isDeletable := anObject
]

{ #category : #accessing }
LeBlueskyLinkFileWidget >> onDeletion [
	^ onDeletion
]

{ #category : #accessing }
LeBlueskyLinkFileWidget >> onDeletion: anObject [
	onDeletion := anObject
]
