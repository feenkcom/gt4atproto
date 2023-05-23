Class {
	#name : #GtApFeedUserSummaryElement,
	#superclass : #BrFrame,
	#instVars : [
		'userNameLabel',
		'userHandleLabel',
		'descriptionEditor',
		'followingCountLabel',
		'followersCountLabel',
		'user',
		'tweetsCountLabel',
		'pictureElement'
	],
	#category : #'Gt4AtProto-UI'
}

{ #category : #callbacks }
GtApFeedUserSummaryElement >> actOnElementDetached [
	pictureElement actOnElementDetached
]

{ #category : #'building  - widgets' }
GtApFeedUserSummaryElement >> buildGrayLabel [
	^ BrLabel new
		aptitude: (BrGlamorousLabelAptitude new
			foreground:  Color lightGray)
]

{ #category : #'building  - widgets' }
GtApFeedUserSummaryElement >> buildProfilePictureElement [
	^ pictureElement := GtApFeedUserPictureElement new
		margin: (BlInsets right: 10)
]

{ #category : #'building  - widgets' }
GtApFeedUserSummaryElement >> buildUserDescriptionElement [
	^ descriptionEditor := BrEditor new
		beReadOnlyWithoutSelection;
		aptitude: BrGlamorousRegularEditorAptitude;
		hMatchParent;
		vFitContent;
		margin: (BlInsets bottom: 5)
]

{ #category : #'building  - widgets' }
GtApFeedUserSummaryElement >> buildUserDetailsElement [
	| detailsElement |
	
	detailsElement := BrHorizontalPane new
		hMatchParent;
		vFitContent.
	
	detailsElement 
		addChild: (tweetsCountLabel := self buildGrayLabel);
		addChild: (followingCountLabel := self buildGrayLabel);
		addChild: (followersCountLabel := self buildGrayLabel).
	
	tweetsCountLabel margin: (BlInsets right: 10).
	followingCountLabel margin: (BlInsets right: 10).
	
	^ detailsElement
]

{ #category : #'building  - widgets' }
GtApFeedUserSummaryElement >> buildUserHeaderElement [
	| headerElement|
	
	headerElement := BrHorizontalPane new
		hMatchParent;
		vFitContent.
	
	headerElement 
		addChild: (userNameLabel := (BrLabel new 
			aptitude: BrGlamorousLabelAptitude new));
		addChild: (userHandleLabel := self buildGrayLabel).
	
	^ headerElement
]

{ #category : #initialization }
GtApFeedUserSummaryElement >> initialize [
	| mainContainer contentContainer |
	super initialize.
	
	self 
		hExact: 400;
		vFitContent;
		padding: (BlInsets all: 10).
	
	mainContainer  := BrHorizontalPane new
		hMatchParent;
		vFitContent.
		
	mainContainer addChild:  self buildProfilePictureElement.
	
	contentContainer := BrVerticalPane new
		hMatchParent;
		vFitContent.
	
	contentContainer addChild:  self buildUserHeaderElement.
	contentContainer addChild:  self buildUserDescriptionElement.	
	"contentContainer addChild:  self buildUserDetailsElement."
	
	mainContainer addChild: contentContainer.
	
	self addChild: mainContainer
]

{ #category : #updating }
GtApFeedUserSummaryElement >> updateContent [
	pictureElement user: self user.

	userNameLabel text: (self user atpDisplayName ifNil: [ '' ]).
	userHandleLabel text: '@' , self user atpHandle.

	self updateUserDescription	"tweetsCountLabel text: self user postCount asString, ' Posts'.
	followingCountLabel text: self user followingCount asString, ' Following'.
	followersCountLabel text: self user followersCount asString, ' Followers'."
]

{ #category : #updating }
GtApFeedUserSummaryElement >> updateUserDescription [
	self user atpDescription isEmptyOrNil
		ifTrue: [ descriptionEditor visibility: BlVisibility gone ]
		ifFalse: [ descriptionEditor visibility: BlVisibility visible ].
	descriptionEditor text: self user atpDescription
]

{ #category : #accessing }
GtApFeedUserSummaryElement >> user [

	^ user
]

{ #category : #accessing }
GtApFeedUserSummaryElement >> user: aUser [

	user := aUser.
	
	self updateContent.
]
