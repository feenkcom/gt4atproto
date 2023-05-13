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
	^ ((self client appBskyFeedGetPostThreaduri: self atpPost atpUri depth: nil)
		at: 'thread') atpReplies
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
TAppBskyFeedDefsThreadViewPost >> gtThreadFor: aView [
	<gtView>
	^ aView tree
		title: 'Thread';
		priority: 0;
		items: [ {self} ];
		children: #replies;
		stencil: [ :aPost | GtApFeedPostSummaryElement new post: aPost ];
		expandOneLevel
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
