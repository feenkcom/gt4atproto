Class {
	#name : #GtApCreatePostForm,
	#superclass : #BrVerticalPane,
	#instVars : [
		'editorElement',
		'acceptButton',
		'client',
		'actor'
	],
	#category : #'Gt4AtProto-Extensions'
}

{ #category : #accessing }
GtApCreatePostForm >> actor [
	^ actor
]

{ #category : #accessing }
GtApCreatePostForm >> actor: anObject [
	actor := anObject
]

{ #category : #accessing }
GtApCreatePostForm >> client [
	^ client
]

{ #category : #accessing }
GtApCreatePostForm >> client: anObject [
	client := anObject
]

{ #category : #accessing }
GtApCreatePostForm >> createAcceptButton [
	^ acceptButton := BrButton new
			aptitude: BrGlamorousButtonWithIconAptitude;
			icon: BrGlamorousVectorIcons accept;
			label: 'Publish';
			action: [ self phlow spawnObject: (self client
					comAtprotoRepoCreateRecordrepo: self actor atpDid
					collection: AppBskyFeedPostMain atpRecordName
					rkey: nil
					validate: nil
					record: {'$type' -> AppBskyFeedPostMain atpRecordName.
							'createdAt' -> DateAndTime now printString.
							'text' -> editorElement text asString} asDictionary
					swapCommit: nil) ]
]

{ #category : #accessing }
GtApCreatePostForm >> createEditor [
	^ editorElement := BrEditor new matchParent aptitude: BrGlamorousEditorAptitude
]

{ #category : #accessing }
GtApCreatePostForm >> initialize [
	super initialize.

	self matchParent.
	self padding: (BlInsets all: 8).

	self addChild: self createEditor.
	self addChild: self createAcceptButton
]
