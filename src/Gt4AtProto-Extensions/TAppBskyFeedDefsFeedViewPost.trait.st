Trait {
	#name : #TAppBskyFeedDefsFeedViewPost,
	#instVars : [
		'profilePictureForm'
	],
	#category : #'Gt4AtProto-Extensions'
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
TAppBskyFeedDefsFeedViewPost >> hasPhotos [
	^ self atpPost atpEmbed isNotNil
]

{ #category : #accessing }
TAppBskyFeedDefsFeedViewPost >> recordText [
	^ self atpPost atpRecord atpText
]
