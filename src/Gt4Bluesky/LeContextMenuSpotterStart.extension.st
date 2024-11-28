Extension { #name : #LeContextMenuSpotterStart }

{ #category : #'*Gt4Bluesky' }
LeContextMenuSpotterStart >> gtSpotterForBlueskyFor: aSearch [
	<gtSearch>
	^ aSearch explicit
		title: 'Add Bluesky snippet';
		priority: 2;
		itemName: #title;
		search: [ :aContext | 
			(aContext searchQuery asAsyncFuture asAsyncStream
				select: [ :aQuery | 
					(aQuery trimLeft beginsWith: 'https://bsky.app/profile/')
						and: [ aQuery includesSubstring: '/post/' ] ])
				collect: [ :aUrl | 
					LeContextMenuItemValuableSpecification new
						valuable: [ LeBlueskyPostSnippet fromUrl: aUrl ];
						title: 'Bluesky post' ] ]
]

{ #category : #'*Gt4Bluesky' }
LeContextMenuSpotterStart >> gtSpotterForBlueskyPostFor: aSearch [
	<gtSearch>
	^ aSearch explicit
		title: 'Add Bluesky post';
		priority: 2;
		itemName: #title;
		search: [ :aContext | 
			(aContext searchQuery asAsyncFuture asAsyncStream
				select: [ :aQuery | 
					(aQuery beginsWith: 'https://bsky.app/profile/')
						and: [ aQuery includesSubstring: '/post' ] ])
				collect: [ :aUrl | 
					LeContextMenuItemValuableSpecification new
						valuable: [ LeBlueskyLinkSnippet new url: aUrl ];
						title: aUrl ] ]
]
