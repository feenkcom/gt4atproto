Trait {
	#name : #TAppBskyFeedDefsFeedViewPost,
	#instVars : [
		'',
		'replies'
	],
	#category : #'Gt4AtProto-Extensions-Traits'
}

{ #category : #accessing }
TAppBskyFeedDefsFeedViewPost >> author [
	^ self atpPost atpAuthor
]

{ #category : #accessing }
TAppBskyFeedDefsFeedViewPost >> createdAt [
	^ self atpPost atpRecord atpCreatedAt
]

{ #category : #accessing }
TAppBskyFeedDefsFeedViewPost >> createdAtTimestamp [
	^ DateAndTime fromString: self createdAt
]

{ #category : #accessing }
TAppBskyFeedDefsFeedViewPost >> embed [
	^ self atpPost atpEmbed
]

{ #category : #accessing }
TAppBskyFeedDefsFeedViewPost >> getReplies [
	^ (((self client appBskyFeedGetPostThreaduri: self atpPost atpUri depth: nil)
		at: 'thread') at: 'replies')
		collect: [ :aDictionary | (GtApModelEntity findForRequest: aDictionary) client: self client ]
]

{ #category : #accessing }
TAppBskyFeedDefsFeedViewPost >> getRoot [
	^ (self client appBskyFeedGetPostThreaduri: self atpReply atpRoot atpUri depth: nil)
		collect: [ :aDictionary | (GtApModelEntity findForRequest: aDictionary) client: self client ]
]

{ #category : #accessing }
TAppBskyFeedDefsFeedViewPost >> gtCardFor: aView [
	<gtView>
	
	^ aView explicit
		title: 'Card';
		priority: 1;
		stencil: [ 
			GtApFeedPostSummaryElement new
				post: self;
				addAptitude: BrShadowAptitude;
				background: Color white;
				margin: (BlInsets all: 10) ]
]

{ #category : #accessing }
TAppBskyFeedDefsFeedViewPost >> gtThreadFor: aView [
	<gtView>
	^ aView tree
		title: 'Thread';
		priority: 0;
		items: [ self getRoot ];
		children: #replies;
		stencil: [ :aPost | GtApFeedPostSummaryElement new post: aPost ];
		expandOneLevel
]

{ #category : #accessing }
TAppBskyFeedDefsFeedViewPost >> hasEmbed [
	^ self embed isNotNil
]

{ #category : #accessing }
TAppBskyFeedDefsFeedViewPost >> recordText [
	^ self atpPost atpRecord atpText
]

{ #category : #accessing }
TAppBskyFeedDefsFeedViewPost >> replies [
	^ replies ifNil: [ replies := self getReplies ]
]
