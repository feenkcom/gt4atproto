Extension { #name : #LeContextMenuSpotterStart }

{ #category : #'*Gt4Bluesky' }
LeContextMenuSpotterStart >> gtSpotterForBlueskyFor: aSearch [
	<gtSearch>
	^ aSearch explicit
		title: 'Add bluesky snippet';
		priority: 2;
		itemName: #title;
		search: [ :aContext | 
			(aContext searchQuery asAsyncFuture asAsyncStream
				select: [ :aQuery | 
					(aQuery trimLeft beginsWith: 'https://bsky.app/profile/')
						and: [ aQuery includesSubstring: '/post/' ] ])
				collect: [ :aUrl | 
					LeContextMenuItemValuableSpecification new
						valuable: [ LeBlueskySnippet fromUrl: aUrl ];
						title: 'Bluesky Post' ] ]
]

{ #category : #'*Gt4Bluesky' }
LeContextMenuSpotterStart >> gtSpotterForPictureFor: aSearch [
	<gtSearch>

	^ aSearch explicit
		title: 'Add picture snippet';
		priority: 2;
		itemName: #title;
		search: [ :aContext |
			((aContext searchQuery asAsyncFuture asAsyncStream
				collect: [ :aQuery | self spotterPictureFileStringFor: aQuery trimBoth ])
				select: #notNil)
				collect: [ :aPicturePath |
					LeContextMenuItemValuableSpecification new
						valuable: [ LePictureSnippet new urlString: aPicturePath ];
						title: aPicturePath ] ]
]
