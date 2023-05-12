Class {
	#name : #GtApFeedEmbeddedPostSummaryElement,
	#superclass : #BrVerticalPane,
	#instVars : [
		'tweetDateLabel',
		'authorNameLabel',
		'authorHandleLabel',
		'pictureElement',
		'mediaContainer',
		'post',
		'postTextEditor',
		'dateLabel'
	],
	#category : #'Gt4AtProto-UI'
}

{ #category : #'building widgets' }
GtApFeedEmbeddedPostSummaryElement >> buildGrayLabel [
	^ BrLabel new
		aptitude: (BrGlamorousLabelAptitude new
			foreground:  Color lightGray)
]

{ #category : #initialization }
GtApFeedEmbeddedPostSummaryElement >> buildPostContentElement [
	^ (postTextEditor := BrEditor new
		beReadOnlyWithoutSelection;
		aptitude: BrGlamorousRegularEditorAptitude;
		hMatchParent;
		vFitContent;
		margin: (BlInsets top: 0 left: 0 bottom: 10 right: 0) )
]

{ #category : #'building widgets' }
GtApFeedEmbeddedPostSummaryElement >> buildPostMediaElement [
	^ (mediaContainer := BrHorizontalPane new hMatchParent vFitContent)
]

{ #category : #accessing }
GtApFeedEmbeddedPostSummaryElement >> buildProfilePictureElement [
	^ pictureElement := GtApFeedUserPictureElement new
		margin: (BlInsets right: 10)
]

{ #category : #'building widgets' }
GtApFeedEmbeddedPostSummaryElement >> buildUserHeaderElement [
	| headerElement|
	
	headerElement := BrHorizontalPane new
		hMatchParent;
		vFitContent;
		margin: (BlInsets left: 3).
	
	headerElement 
		addChild: (authorNameLabel := (BrLabel new 
			aptitude: BrGlamorousLabelAptitude new));
		addChild: (authorHandleLabel := self buildGrayLabel);
		addChild: (dateLabel := self buildGrayLabel).
	
	^ headerElement
]

{ #category : #initialization }
GtApFeedEmbeddedPostSummaryElement >> initialize [
	| mainContainer contentContainer |
	
	super initialize.
	
	self 
		hMatchParent;
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
	
	mainContainer addChild: contentContainer.
	self addChild:  mainContainer.
]

{ #category : #accessing }
GtApFeedEmbeddedPostSummaryElement >> post [
	^ post
]

{ #category : #accessing }
GtApFeedEmbeddedPostSummaryElement >> post: aTweet [
	post := aTweet.
	
	self updateContent
]

{ #category : #accessing }
GtApFeedEmbeddedPostSummaryElement >> updateAuthorDetails [
	self post author ifNil: [
		authorNameLabel text: '<missing>'.
		authorHandleLabel text: ''.
		^ self ].
	
	authorNameLabel text: self post author atpDisplayName.
	authorHandleLabel text: '@', self post author  atpHandle.
]

{ #category : #accessing }
GtApFeedEmbeddedPostSummaryElement >> updateContent [
	pictureElement user: self post author.
	self updateAuthorDetails.
	postTextEditor text: self post recordText.
	dateLabel text: ' at ', self post createdAtTimestamp printToMinute.
	self updateMedia
]

{ #category : #accessing }
GtApFeedEmbeddedPostSummaryElement >> updateMedia [
	self post hasPhotos
		ifFalse: [ mediaContainer visibility: BlVisibility gone ]
		ifTrue: [ mediaContainer visibility: BlVisibility visible ].

	mediaContainer removeChildren.

	"self post photos
		do: [ :each | 
			mediaContainer
				addChild: (BrAsyncFileWidget new url: (each at: 'fullsize')) matchParent ]"
]
