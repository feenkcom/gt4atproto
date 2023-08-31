Trait {
	#name : #TAppBskyFeedDefsFeedViewPost,
	#instVars : [
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
	^ self atpPost atpRecord atpEmbed
]

{ #category : #accessing }
TAppBskyFeedDefsFeedViewPost >> getReplies [
	^ ((self client
		appBskyFeedGetPostThreadUri: self atpPost atpUri
		depth: nil
		parentHeight: nil) at: 'thread') atpReplies
		collect: [ :aReply | aReply client: self client ]
]

{ #category : #accessing }
TAppBskyFeedDefsFeedViewPost >> getRoot [
	self atpReply ifNil: [ ^ self ].

	^ ((self client
		appBskyFeedGetPostThreadUri: self atpReply atpRoot atpUri
		depth: nil
		parentHeight: nil) at: 'thread') client: self client
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
				withShadowAndHighlighting ]
]

{ #category : #accessing }
TAppBskyFeedDefsFeedViewPost >> gtCardsThreadFor: aView [
	<gtView>
	^ aView explicit
		title: 'Thread cards';
		priority: 10;
		stencil: [ BrSimpleTree new
				nodeStencil: [ GtApFeedPostSummaryElement new
						withShadowAndHighlighting ];
				nodeDataBinder: [ :aPostElement :aPost | 
					aPostElement
						post: aPost;
						when: BlClickEvent
							do: [ :e | 
								e consumed: true.
								e target phlow spawnObject: aPostElement post ] ];
				items: {self getRoot} lazy: [ :each | each replies ];
				expandOneLevel ]
]

{ #category : #accessing }
TAppBskyFeedDefsFeedViewPost >> gtCompactThreadFor: aView [
	<gtView>
	^ aView columnedTree
		title: 'Compact thread';
		priority: 9;
		items: [ {self getRoot} ];
		children: [ :each | each replies ];
		column: 'Author' text: [ :each | each author atpDisplayName ];
		column: 'Text' text: [ :each | each atpPost atpRecord atpText ];
		column: 'Created at' text: [ :each | each atpPost atpRecord createdAtTimestamp printToSeconds ]
]

{ #category : #accessing }
TAppBskyFeedDefsFeedViewPost >> gtCreatePostFor: aView [
	<gtView>

	^ aView explicit
		title: 'Reply';
		priority: 20;
		stencil: [ GtApCreatePostForm new
				client: self client;
				post: self;
				actor: (self client appBskyActorGetProfileActor: self client handle) ]
]

{ #category : #accessing }
TAppBskyFeedDefsFeedViewPost >> gtDeleteActionFor: anAction [
	<gtAction>
	^ anAction button
		icon: BrGlamorousVectorIcons close;
		label: 'Delete';
		action: [ self client
				comAtprotoRepoDeleteRecordRepo: self atpPost atpAuthor atpDid
				collection: AppBskyFeedPostMain atpRecordName
				rkey: (#/ split: self atpPost atpUri) last
				swapRecord: nil
				swapCommit: nil ]
]

{ #category : #accessing }
TAppBskyFeedDefsFeedViewPost >> gtDisplayOn: aStream [
	aStream 
		nextPutAll: self author atpDisplayName;
		nextPutAll: ': ';
		nextPutAll: self recordText
]

{ #category : #accessing }
TAppBskyFeedDefsFeedViewPost >> gtPageFor: aView [
	<gtView>
	self hasPage ifFalse: [ ^ aView empty ].

	^ aView forward
		title: 'Page';
		priority: 21;
		object: [ (LeJsonV4 uniqueInstance deserialize: (self embed rawData at: 'record') readStream) asContentUIModel ];
		view: #gtLiveFor:
]

{ #category : #accessing }
TAppBskyFeedDefsFeedViewPost >> hasEmbed [
	^ self embed isNotNil
]

{ #category : #accessing }
TAppBskyFeedDefsFeedViewPost >> hasMedia [
	^ self hasEmbed and: [ self embed hasMedia ]
]

{ #category : #accessing }
TAppBskyFeedDefsFeedViewPost >> hasPage [
	^ self hasEmbed and: [ (self embed rawData at: '$type') = 'com.gtoolkit.embed.lepiterPage' ]
]

{ #category : #accessing }
TAppBskyFeedDefsFeedViewPost >> hasReplies [
	^ self atpPost atpReplyCount > 0
]

{ #category : #accessing }
TAppBskyFeedDefsFeedViewPost >> hasRepliesFromHandle: aHandle [
	^ self replies
		anySatisfy: [ :aPost | aPost author atpHandle = aHandle ]
]

{ #category : #accessing }
TAppBskyFeedDefsFeedViewPost >> hasRepliesFromSameHandle [
	^ self hasRepliesFromHandle: self author atpHandle
]

{ #category : #accessing }
TAppBskyFeedDefsFeedViewPost >> isReply [
	^ self atpReply notNil
]

{ #category : #accessing }
TAppBskyFeedDefsFeedViewPost >> recordText [
	^ self atpPost atpRecord atpText
]

{ #category : #accessing }
TAppBskyFeedDefsFeedViewPost >> replies [
	^ replies ifNil: [ replies := self getReplies ]
]
