Trait {
	#name : #TAppBskyFeedDefsThreadViewPost,
	#instVars : [
		'replies'
	],
	#category : #'Gt4AtProto-Extensions-Traits'
}

{ #category : #accessing }
TAppBskyFeedDefsThreadViewPost >> author [
	^ self atpPost atpAuthor
]

{ #category : #accessing }
TAppBskyFeedDefsThreadViewPost >> createdAt [
	^ self atpPost atpRecord atpCreatedAt
]

{ #category : #accessing }
TAppBskyFeedDefsThreadViewPost >> createdAtTimestamp [
	^ DateAndTime fromString: self createdAt
]

{ #category : #accessing }
TAppBskyFeedDefsThreadViewPost >> embed [
	^ self atpPost atpEmbed
]

{ #category : #accessing }
TAppBskyFeedDefsThreadViewPost >> getReplies [
	^ ((self client
		appBskyFeedGetPostThreadUri: self atpPost atpUri
		depth: nil
		parentHeight: nil) at: 'thread') atpReplies
		collect: [ :aReply | aReply client: self client ]
]

{ #category : #'as yet unclassified' }
TAppBskyFeedDefsThreadViewPost >> getRootPost [
	self atpParent ifNil: [ ^ self ].
	^ self atpParent getRootPost client: self client
]

{ #category : #accessing }
TAppBskyFeedDefsThreadViewPost >> gtCardFor: aView [
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
TAppBskyFeedDefsThreadViewPost >> gtCardsThreadFor: aView [
	<gtView>
	^ aView explicit
		title: 'Thread';
		priority: 0;
		stencil: [ BrSimpleTree new
				nodeStencil: [ GtApFeedPostSummaryElement new
						addAptitude: BrShadowAptitude;
						background: Color white;
						margin: (BlInsets all: 10) ];
				nodeDataBinder: [ :aPostElement :aPost | 
					aPostElement
						post: aPost;
						addAptitude: (BrStyleCommonAptitude new
								default: [ :s | s background: Color white ];
								hovered: [ :s | s background: Color veryVeryLightGray ];
								pressed: [ :s | s background: Color veryLightGray ]);
						when: BlClickEvent
							do: [ :e | 
								e consumed: true.
								e target phlow spawnObject: aPostElement post ] ];
				items: {self} lazy: [ :each | each replies ];
				expandOneLevel ]
]

{ #category : #accessing }
TAppBskyFeedDefsThreadViewPost >> hasEmbed [
	^ self embed isNotNil
]

{ #category : #accessing }
TAppBskyFeedDefsThreadViewPost >> recordText [
	^ self atpPost atpRecord atpText
]

{ #category : #accessing }
TAppBskyFeedDefsThreadViewPost >> replies [
	^ replies ifNil: [ replies := self getReplies ]
]
