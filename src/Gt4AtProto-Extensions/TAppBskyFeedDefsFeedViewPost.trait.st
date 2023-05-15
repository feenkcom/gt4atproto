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
	^ self atpPost atpEmbed
]

{ #category : #accessing }
TAppBskyFeedDefsFeedViewPost >> getReplies [
	^ ((self client appBskyFeedGetPostThreaduri: self atpPost atpUri depth: nil)
		at: 'thread') atpReplies collect: [ :aReply | aReply client: self client ]
]

{ #category : #accessing }
TAppBskyFeedDefsFeedViewPost >> getRoot [
	self atpReply ifNil: [ ^ self ].

	^ ((self client
		appBskyFeedGetPostThreaduri: self atpReply atpRoot atpUri
		depth: nil) at: 'thread') client: self client
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
		priority: 0;
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
		priority: 0;
		items: [ {self getRoot} ];
		children: [ :each | each replies ];
		column: 'Author' text: [ :each | each author atpDisplayName ];
		column: 'Text' text: [ :each | each atpPost atpRecord atpText ];
		column: 'Created at' text: [ :each | each atpPost atpRecord createdAtTimestamp ]
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
