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
		'repostsCountLabel',
		'dateLabel',
		'repliesCountLabel'
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
		margin: (BlInsets top: 0 left: 0 bottom: 10 right: 0) )
]

{ #category : #'building widgets' }
GtApPostSummaryElement >> buildPostDetailsElement [
	| detailsElement|
	
	detailsElement := BrHorizontalPane new
		hMatchParent;
		vFitContent;
		margin: (BlInsets left: 3).
	
	detailsElement 
		addChild: (repliesCountLabel := self buildGrayLabel);
		addChild: (repostsCountLabel := self buildGrayLabel);
		addChild: (likesCountLabel := self buildGrayLabel).
		
	repostsCountLabel margin: (BlInsets left: 10 right: 10).
	
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
	dateLabel text: ' at ', self post createdAt printToMinute.
	self updateMedia.
	repliesCountLabel text: self post repliesCount asString , ' Replies'.
	likesCountLabel text: self post likesCount asString , ' Likes'.
	repostsCountLabel text: self post repostsCount asString , ' Reposts'
]

{ #category : #accessing }
GtApPostSummaryElement >> updateMedia [
	self post hasPhotos
		ifFalse: [ mediaContainer visibility: BlVisibility gone ]
		ifTrue: [ mediaContainer visibility: BlVisibility visible ].

	mediaContainer removeChildren.

	self post photos
		do: [ :each | 
			mediaContainer
				addChild: (BrAsyncFileWidget new url: (each at: 'fullsize')) matchParent ]
]
