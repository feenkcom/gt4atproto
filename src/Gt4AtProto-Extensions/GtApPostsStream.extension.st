Extension { #name : #GtApPostsStream }

{ #category : #'*Gt4AtProto-Extensions' }
GtApPostsStream >> gtViewCardPostsFor: aView [
	<gtView>
	^ aView explicit
		title: 'Post cards';
		priority: 1;
		stencil: [ BrSimpleList new
				stream: self stream asyncSimilarCopy;
				itemStencil: [ GtApFeedPostSummaryElement new withShadowAndHighlighting ];
				itemDataBinder: [ :aPostElement :aPost | 
					aPostElement
						post: aPost;
						withSpawnHandlers ] ]
]
