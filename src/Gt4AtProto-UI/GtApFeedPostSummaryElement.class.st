Class {
	#name : #GtApFeedPostSummaryElement,
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
GtApFeedPostSummaryElement >> buildGrayLabel [
	^ BrLabel new
		aptitude: (BrGlamorousLabelAptitude new
			foreground:  Color lightGray)
]

{ #category : #initialization }
GtApFeedPostSummaryElement >> buildPostContentElement [
	^ (postTextEditor := BrEditor new
		beReadOnlyWithSelection;
		aptitude: BrGlamorousRegularEditorAptitude;
		hMatchParent;
		vFitContent;
		margin: (BlInsets top: 0 left: 0 bottom: 10 right: 0) )
]

{ #category : #'building widgets' }
GtApFeedPostSummaryElement >> buildPostDetailsElement [
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
GtApFeedPostSummaryElement >> buildPostMediaElement [
	^ (mediaContainer := BrHorizontalPane new hMatchParent; vFitContent)
]

{ #category : #accessing }
GtApFeedPostSummaryElement >> buildProfilePictureElement [
	^ pictureElement := GtApFeedUserPictureElement new
		margin: (BlInsets right: 10)
]

{ #category : #'building widgets' }
GtApFeedPostSummaryElement >> buildUserHeaderElement [
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
GtApFeedPostSummaryElement >> initialize [
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
GtApFeedPostSummaryElement >> post [
	^ post
]

{ #category : #accessing }
GtApFeedPostSummaryElement >> post: aTweet [
	post := aTweet.
	
	self updateContent
]

{ #category : #accessing }
GtApFeedPostSummaryElement >> updateAuthorDetails [
	self post author ifNil: [
		authorNameLabel text: '<missing>'.
		authorHandleLabel text: ''.
		^ self ].
	
	authorNameLabel text: self post author atpDisplayName.
	authorHandleLabel text: '@', self post author  atpHandle.
]

{ #category : #accessing }
GtApFeedPostSummaryElement >> updateContent [
	pictureElement user: self post author.
	self updateAuthorDetails.
	postTextEditor text: self post recordText.
	dateLabel text: ' at ', self post createdAtTimestamp printToMinute.
	self updateMedia.
	repliesCountLabel text: self post atpPost atpReplyCount asString , ' Replies'.
	likesCountLabel text: self post atpPost atpLikeCount asString , ' Likes'.
	repostsCountLabel text: self post atpPost atpRepostCount asString , ' Reposts'
]

{ #category : #accessing }
GtApFeedPostSummaryElement >> updateMedia [
	self post hasEmbed
		ifFalse: [ mediaContainer visibility: BlVisibility gone ]
		ifTrue: [ mediaContainer visibility: BlVisibility visible ].

	mediaContainer removeChildren.

	self post hasEmbed
		ifTrue: [ mediaContainer addChild: self post embed asEmbeddedElement ]
]

{ #category : #accessing }
GtApFeedPostSummaryElement >> withShadowAndHighlighting [
	self
		aptitude: BrShadowAptitude
				+ (BrStyleCommonAptitude new
						default: [ :s | s background: Color white ];
						hovered: [ :s | s background: Color veryVeryLightGray ];
						pressed: [ :s | s background: Color veryLightGray ]);
		background: Color white;
		margin: (BlInsets all: 10)
]
