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
						valuable: [ LeBlueskyEditorSnippet fromUrl: aUrl ];
						title: 'Bluesky post' ] ]
]
