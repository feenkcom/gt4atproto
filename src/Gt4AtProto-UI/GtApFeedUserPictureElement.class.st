Class {
	#name : #GtApFeedUserPictureElement,
	#superclass : #BrFrame,
	#instVars : [
		'pictureElement'
	],
	#category : #'Gt4AtProto-UI'
}

{ #category : #accessing }
GtApFeedUserPictureElement >> actOnElementDetached [
	pictureElement asyncFuture cancelSoft interrupt
]

{ #category : #'building - widgets' }
GtApFeedUserPictureElement >> buildAsyncPictureElement [
	^ pictureElement := (BrAsyncFileWidget new )
		matchParent;
		geometry: (BlCircleGeometry new)
]

{ #category : #'building - widgets' }
GtApFeedUserPictureElement >> buildProfilePictureElement [
	^ pictureElement := BrFrame new 
		matchParent;
		geometry: (BlCircleGeometry new);
		margin: (BlInsets right: 10);
		withAsyncFutureDo: [ :anElementFuture | 
			anElementFuture
				whenPending: [ :theContainer | 
					theContainer
						removeChildren ];
				whenError: [ :theContainer :anError | 
					theContainer
						removeChildren;
						addChild:  anError asDebuggableElement matchParent;
						constraintsDo: [ :c | 
							c frame horizontal alignCenter.
							c frame vertical alignCenter ] ];
				whenSuccess: [ :theContainer :theElement | 
					theContainer removeChildren.
					theContainer addChild: theElement ] ]
]

{ #category : #updating }
GtApFeedUserPictureElement >> emptyDefaultForm [
	| defaultForm |
	defaultForm := Form extent: 48@48 depth: 32.
	defaultForm fillColor: (Color veryLightGray).
	^ defaultForm
]

{ #category : #initialization }
GtApFeedUserPictureElement >> initialize [
	super initialize.
	
	self 
		exact: 48@48;
		geometry: (BlCircleGeometry new).
	
	self addChild:  self buildAsyncPictureElement
]

{ #category : #updating }
GtApFeedUserPictureElement >> updateContentForUser: aUser [
	pictureElement
		url: aUser atpAvatar.

	self
		removeEventHandlersSuchThat: [ :aHandler | aHandler wantsEvent: BlClickEvent new ].

	self when: BlClickEvent do: [ self phlow spawnObject: aUser ]
]

{ #category : #accessing }
GtApFeedUserPictureElement >> user: aUser [ 
	self updateContentForUser:  aUser
]
