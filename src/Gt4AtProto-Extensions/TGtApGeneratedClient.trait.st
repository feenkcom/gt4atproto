Trait {
	#name : #TGtApGeneratedClient,
	#category : #'Gt4AtProto-Extensions-Traits'
}

{ #category : #accessing }
TGtApGeneratedClient >> gtBlueskyPostFromUrlFor: aSearch [
	<gtSearch>
	^ aSearch explicit
		title: 'Bluesky post';
		priority: 2;
		itemName: [:aPost | aPost author atpHandle, ': ', aPost recordText ];
		search: [ :aContext | 
			| path handle recordId did post |
			(aContext searchQuery asAsyncFuture asAsyncStream
				select: [ :aQuery | 
					(aQuery trimLeft beginsWith: 'https://bsky.app/profile/')
						and: [ aQuery includesSubstring: '/post/' ] ])
				collect: [ :aUrl | 
					path := '/' split: (aUrl removePrefix: 'https://bsky.app/').
					handle := path second.
					recordId := path last.
					did := (self comAtprotoIdentityResolveHandleHandle: handle) at: 'did'.
					post := (self
							appBskyFeedGetPostThreadUri: 'at://' , did , '/app.bsky.feed.post/'
									, recordId
							depth: nil
							parentHeight: nil) at: 'thread'.
					post client: self ] ]
]
