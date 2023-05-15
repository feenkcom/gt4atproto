"
This trait is meant to work only with {{gtClass:AppBskyActorDefsProfileViewDetailed}}.
"
Trait {
	#name : #TAppBskyActorDefsProfileViewDetailed,
	#instVars : [
		'posts',
		'followers',
		'follows'
	],
	#category : #'Gt4AtProto-Extensions-Traits'
}

{ #category : #accessing }
TAppBskyActorDefsProfileViewDetailed >> downloadFollowers [
	^ ((self client appBskyGraphGetFollowersactor: self atpHandle) at: 'followers')
]

{ #category : #accessing }
TAppBskyActorDefsProfileViewDetailed >> downloadFollows [
	^ (self client appBskyGraphGetFollowsactor: self atpHandle) at: 'follows'
]

{ #category : #accessing }
TAppBskyActorDefsProfileViewDetailed >> downloadPosts [
	^ (self client appBskyFeedGetAuthorFeedactor: self atpHandle)
		collect: [ :aPost | aPost client: self client ]
]

{ #category : #accessing }
TAppBskyActorDefsProfileViewDetailed >> followers [
	^ followers ifNil: [ followers := self downloadFollowers ]
]

{ #category : #accessing }
TAppBskyActorDefsProfileViewDetailed >> follows [
	^ follows ifNil: [ follows := self downloadFollows ]
]

{ #category : #accessing }
TAppBskyActorDefsProfileViewDetailed >> gtCreatePostFor: aView [
	<gtView>
	self atpHandle = self client handle ifFalse: [ ^ aView empty ].

	^ aView explicit
		title: 'Create Post';
		priority: 20;
		stencil: [ GtApCreatePostForm new
				client: self client;
				actor: self ]
]

{ #category : #accessing }
TAppBskyActorDefsProfileViewDetailed >> gtDisplayOn: stream [
	stream
		nextPutAll: self atpDisplayName;
		space;
		nextPut: $@;
		nextPutAll: self atpHandle
]

{ #category : #accessing }
TAppBskyActorDefsProfileViewDetailed >> gtViewCardPostsFor: aView [
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
						withSpawnHandlers ] ]
]

{ #category : #accessing }
TAppBskyActorDefsProfileViewDetailed >> gtViewCompactPostsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Compact posts';
		priority: 1;
		items: [ self posts ];
		column: 'Name'
			text: [ :each | each atpPost atpAuthor atpDisplayName ]
			width: 150;
		column: 'Text' text: [ :each | each atpPost atpRecord atpText ];
		column: 'Is reply' text: [ :each | each isReply ifFalse: [''] ifTrue: [ 'yes' ]] width: 50;
		column: 'Embed' text: [ :each | each hasEmbed ifFalse: [''] ifTrue: [ 'yes' ] ] width: 50;
		column: 'Media' text: [ :each | each hasMedia ifFalse: [''] ifTrue: [ 'yes' ] ] width: 50;
		column: 'Created at'
			text: [ :each | each atpPost atpRecord createdAtTimestamp printToSeconds ]
			width: 150
]

{ #category : #accessing }
TAppBskyActorDefsProfileViewDetailed >> gtViewFollowersFor: aView [
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
TAppBskyActorDefsProfileViewDetailed >> gtViewFollowingFor: aView [
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
TAppBskyActorDefsProfileViewDetailed >> posts [
	^ posts ifNil: [  posts := self downloadPosts ]
]
