Class {
	#name : #GtApUserPictureElement,
	#superclass : #BrFrame,
	#instVars : [
		'pictureElement'
	],
	#category : #'Gt4AtProto-UI'
}

{ #category : #accessing }
GtApUserPictureElement >> actOnElementDetached [
	pictureElement asyncFuture cancelSoft interrupt
]

{ #category : #'building - widgets' }
GtApUserPictureElement >> buildAsyncPictureElement [
	^ pictureElement := (BrAsyncFileWidget new )
		matchParent;
		geometry: (BlCircleGeometry new)
]

{ #category : #'building - widgets' }
GtApUserPictureElement >> buildProfilePictureElement [
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
GtApUserPictureElement >> emptyDefaultForm [
	| defaultForm |
	defaultForm := Form extent: 48@48 depth: 32.
	defaultForm fillColor: (Color veryLightGray).
	^ defaultForm
]

{ #category : #initialization }
GtApUserPictureElement >> initialize [
	super initialize.
	
	self 
		exact: 48@48;
		geometry: (BlCircleGeometry new).
	
	self addChild:  self buildAsyncPictureElement.
	"self addChild:  self buildProfilePictureElement."
]

{ #category : #updating }
GtApUserPictureElement >> updateContentForUser: aUser [
	pictureElement formBlock: [ 
		aUser 
			ifNil: [ self emptyDefaultForm ]
			ifNotNil: [ 
				aUser profilePictureForm
					ifNil: [self emptyDefaultForm] ]  ].
		
	"pictureElement asyncFuture future: [ 
		aUser profilePictureForm asElement
			asScalableElement ] asAsyncFuture."
]

{ #category : #accessing }
GtApUserPictureElement >> user: aUser [ 
	self updateContentForUser:  aUser
]
