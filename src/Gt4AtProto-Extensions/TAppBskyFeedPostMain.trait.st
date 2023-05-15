Trait {
	#name : #TAppBskyFeedPostMain,
	#category : #'Gt4AtProto-Extensions-Traits'
}

{ #category : #accessing }
TAppBskyFeedPostMain >> createdAtTimestamp [
	^ DateAndTime fromString: self atpCreatedAt
]
