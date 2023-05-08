Class {
	#name : #GtApPostSummaryElement,
	#superclass : #BrVerticalPane,
	#instVars : [
		'likesCountLabel',
		'tweetDateLabel',
		'authorNameLabel',
		'authorHandleLabel',
		'pictureElement',
		'mediaContainer',
		'post',
		'postTextEditor',
		'repostsCountLabel'
	],
	#category : #'Gt4AtProto-UI'
}

{ #category : #'building widgets' }
GtApPostSummaryElement >> buildGrayLabel [
	^ BrLabel new
		aptitude: (BrGlamorousLabelAptitude new
			foreground:  Color lightGray)
]

{ #category : #initialization }
GtApPostSummaryElement >> buildPostContentElement [
	^ (postTextEditor := BrEditor new
		beReadOnlyWithoutSelection;
		aptitude: BrGlamorousRegularEditorAptitude;
		hMatchParent;
		vFitContent;
		margin: (BlInsets bottom: 10) )
]

{ #category : #'building widgets' }
GtApPostSummaryElement >> buildPostDetailsElement [
	| detailsElement|
	
	detailsElement := BrHorizontalPane new
		hMatchParent;
		vFitContent.
	
	detailsElement 
		addChild: (repostsCountLabel := self buildGrayLabel);
		addChild: (likesCountLabel := self buildGrayLabel)";
		addChild: (tweetDateLabel := self buildGrayLabel)".
		
	repostsCountLabel margin: (BlInsets right: 10).
	
	^ detailsElement
]

{ #category : #'building widgets' }
GtApPostSummaryElement >> buildPostMediaElement [
	^ (mediaContainer := BrHorizontalPane new hMatchParent; vExact: 200)
]

{ #category : #accessing }
GtApPostSummaryElement >> buildProfilePictureElement [
	^ pictureElement := GtApUserPictureElement new
		margin: (BlInsets right: 10)
]

{ #category : #'building widgets' }
GtApPostSummaryElement >> buildUserHeaderElement [
	| headerElement|
	
	headerElement := BrHorizontalPane new
		hMatchParent;
		vFitContent.
	
	headerElement 
		addChild: (authorNameLabel := (BrLabel new 
			aptitude: BrGlamorousLabelAptitude new));
		addChild: (authorHandleLabel := self buildGrayLabel).
	
	^ headerElement
]

{ #category : #initialization }
GtApPostSummaryElement >> initialize [
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
	
	contentContainer addChild: self buildUserHeaderElement.
	contentContainer addChild: self buildPostContentElement.
	contentContainer addChild: self buildPostMediaElement.
	contentContainer addChild: self buildPostDetailsElement.
	
	mainContainer addChild: contentContainer.
	self addChild:  mainContainer.
]

{ #category : #accessing }
GtApPostSummaryElement >> post [
	^ post
]

{ #category : #accessing }
GtApPostSummaryElement >> post: aTweet [
	post := aTweet.
	
	self updateContent
]

{ #category : #accessing }
GtApPostSummaryElement >> updateAuthorDetails [
	self post author ifNil: [
		authorNameLabel text: '<missing>'.
		authorHandleLabel text: ''.
		^ self ].
	
	authorNameLabel text: self post author displayName.
	authorHandleLabel text: '@', self post author  handle.
]

{ #category : #accessing }
GtApPostSummaryElement >> updateContent [
	pictureElement user: self post author.
	self updateAuthorDetails.
	postTextEditor text: self post recordText.
	self updateMedia.
	likesCountLabel text: self post likesCount asString , ' Likes'.
	repostsCountLabel text: self post repostsCount asString , ' RT'
]

{ #category : #accessing }
GtApPostSummaryElement >> updateMedia [
	self post hasPhotos
		ifFalse: [ mediaContainer visibility: BlVisibility gone ]
		ifTrue: [ mediaContainer visibility: BlVisibility visible ].
	mediaContainer removeChildren.
	(self post mediaItems select: #isPhoto)
		do: [ :each | mediaContainer addChild: each asElement ]
]