Trait {
	#name : #THelperAppBskyActorWithHandle,
	#instVars : [
		'posts',
		'followers',
		'follows'
	],
	#category : #'Gt4AtProto-Extensions-Traits'
}

{ #category : #accessing }
THelperAppBskyActorWithHandle >> downloadFollowers [
	^ ((self client appBskyGraphGetFollowersActor: self atpHandle) at: 'followers')
		collect: [ :anActor | anActor client: self client ]
]

{ #category : #accessing }
THelperAppBskyActorWithHandle >> downloadFollows [
	^ ((self client appBskyGraphGetFollowsActor: self atpHandle) at: 'follows')
		collect: [ :anActor | anActor client: self client ]
]

{ #category : #accessing }
THelperAppBskyActorWithHandle >> downloadPosts [
	^ (self client appBskyFeedGetAuthorFeedActor: self atpHandle)
		collect: [ :aPost | aPost client: self client ]
]

{ #category : #accessing }
THelperAppBskyActorWithHandle >> followers [
	^ (followers ifNil: [ followers := self downloadFollowers cached ]) asyncSimilarCopy
]

{ #category : #accessing }
THelperAppBskyActorWithHandle >> follows [
	^ (follows ifNil: [ follows := self downloadFollows cached ]) asyncSimilarCopy
]

{ #category : #accessing }
THelperAppBskyActorWithHandle >> gtCreatePostFor: aView [
	<gtView>
	self atpHandle = self client handle ifFalse: [ ^ aView empty ].

	^ aView explicit
		title: 'Create post';
		priority: 20;
		stencil: [ GtApCreatePostForm new
				client: self client;
				actor: self ]
]

{ #category : #accessing }
THelperAppBskyActorWithHandle >> gtDisplayOn: stream [
	stream
		nextPutAll: (self atpDisplayName ifNil: ['']);
		space;
		nextPut: $@;
		nextPutAll: self atpHandle
]

{ #category : #accessing }
THelperAppBskyActorWithHandle >> gtViewCardPostsFor: aView [
	<gtView>
	^ aView explicit
		title: 'Post cards';
		priority: 1;
		stencil: [ BrSimpleList new
				stream: self posts;
				itemStencil: [ GtApFeedPostSummaryElement new withShadowAndHighlighting ];
				itemDataBinder: [ :aPostElement :aPost | 
					aPostElement
						post: aPost;
						withSpawnHandlers ] ];
		actionButtonIcon: BrGlamorousVectorIcons refresh
			tooltip: 'Update'
			action: [ :aButton :aTab | 
				self posts: self downloadPosts asyncSimilarCopy.
				aTab viewContentElement phlow update ]
]

{ #category : #accessing }
THelperAppBskyActorWithHandle >> gtViewCompactPostsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Compact posts';
		priority: 1;
		items: [ self posts ];
		column: 'Name'
			text: [ :each | each atpPost atpAuthor atpDisplayName ]
			width: 150;
		column: 'Text' text: [ :each | each atpPost atpRecord atpText ];
		column: 'Is reply'
			text: [ :each | each isReply ifFalse: [ '' ] ifTrue: [ 'yes' ] ]
			width: 50;
		column: 'Embed'
			text: [ :each | each hasEmbed ifFalse: [ '' ] ifTrue: [ 'yes' ] ]
			width: 50;
		column: 'Media'
			text: [ :each | each hasMedia ifFalse: [ '' ] ifTrue: [ 'yes' ] ]
			width: 50;
		column: 'Created at'
			text: [ :each | each atpPost atpRecord createdAtTimestamp printToSeconds ]
			width: 150;
		actionButtonIcon: BrGlamorousVectorIcons refresh
			tooltip: 'Update'
			action: [ :aButton :aTab | 
				self posts: self downloadPosts asyncSimilarCopy.
				aTab viewContentElement phlow update ]
]

{ #category : #accessing }
THelperAppBskyActorWithHandle >> gtViewFollowersFor: aView [
	<gtView>
	
	^ aView list
		title: 'Followers';
		priority: 10;
		items: [ self followers ];
		itemStencil: [ 
			GtApFeedUserSummaryListContainerElement new ];
		itemDataBinder: [ :aUserElement :aUser | 
			aUserElement user: aUser ].
]

{ #category : #accessing }
THelperAppBskyActorWithHandle >> gtViewFollowingFor: aView [
	<gtView>
	
	^ aView list
		title: 'Following';
		priority: 15;
		items: [ self follows ];
		itemStencil: [ 
			GtApFeedUserSummaryListContainerElement new ];
		itemDataBinder: [ :aUserElement :aUser | 
			aUserElement user: aUser ].
]

{ #category : #accessing }
THelperAppBskyActorWithHandle >> posts [
	^ (posts ifNil: [  posts := self downloadPosts cached ]) asyncSimilarCopy
]

{ #category : #accessing }
THelperAppBskyActorWithHandle >> posts: aListOfPosts [
	posts := aListOfPosts
]
