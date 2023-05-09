Class {
	#name : #GtApUserSummaryElement,
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
GtApUserSummaryElement >> actOnElementDetached [
	pictureElement actOnElementDetached
]

{ #category : #'building  - widgets' }
GtApUserSummaryElement >> buildGrayLabel [
	^ BrLabel new
		aptitude: (BrGlamorousLabelAptitude new
			foreground:  Color lightGray)
]

{ #category : #'building  - widgets' }
GtApUserSummaryElement >> buildProfilePictureElement [
	^ pictureElement := GtTwUserPictureElement new
		margin: (BlInsets right: 10)
]

{ #category : #'building  - widgets' }
GtApUserSummaryElement >> buildUserDescriptionElement [
	^ descriptionEditor := BrEditor new
		beReadOnlyWithoutSelection;
		aptitude: BrGlamorousRegularEditorAptitude;
		hMatchParent;
		vFitContent;
		margin: (BlInsets bottom: 5)
]

{ #category : #'building  - widgets' }
GtApUserSummaryElement >> buildUserDetailsElement [
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
GtApUserSummaryElement >> buildUserHeaderElement [
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
GtApUserSummaryElement >> initialize [
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
GtApUserSummaryElement >> updateContent [

	pictureElement user: self user.

	userNameLabel text: self user displayName.
	userHandleLabel text: '@', self user handle.
	
	self updateUserDescription.
	
	"tweetsCountLabel text: self user postCount asString, ' Posts'.
	followingCountLabel text: self user followingCount asString, ' Following'.
	followersCountLabel text: self user followersCount asString, ' Followers'."
]

{ #category : #updating }
GtApUserSummaryElement >> updateUserDescription [
	(self user description 
		ifEmpty: [
			descriptionEditor visibility: BlVisibility gone ] 
		ifNotEmpty:  [
			 descriptionEditor visibility: BlVisibility visible ]).
	descriptionEditor text: self user description.
]

{ #category : #accessing }
GtApUserSummaryElement >> user [

	^ user
]

{ #category : #accessing }
GtApUserSummaryElement >> user: aUser [

	user := aUser.
	
	self updateContent.
]
