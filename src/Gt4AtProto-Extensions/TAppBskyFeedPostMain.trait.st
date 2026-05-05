Trait {
	#name : 'TAppBskyFeedPostMain',
	#category : 'Gt4AtProto-Extensions-Traits',
	#package : 'Gt4AtProto-Extensions',
	#tag : 'Traits'
}

{ #category : 'accessing' }
TAppBskyFeedPostMain >> createdAtTimestamp [
	^ DateAndTime fromString: self atpCreatedAt
]
