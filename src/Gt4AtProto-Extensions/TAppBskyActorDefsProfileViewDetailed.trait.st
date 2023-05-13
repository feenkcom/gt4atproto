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
		collect: [ :aDict | AppBskyActorDefsProfileView fromRequest: aDict ]
]

{ #category : #accessing }
TAppBskyActorDefsProfileViewDetailed >> downloadFollows [
	^ ((self client appBskyGraphGetFollowsactor: self atpHandle) at: 'follows')
		collect: [ :aDict | AppBskyActorDefsProfileView fromRequest: aDict ]
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
TAppBskyActorDefsProfileViewDetailed >> gtViewPostsTimelineFor: aView [
	<gtView>
	^ aView explicit
		title: 'Posts';
		priority: 1;
		stencil: [  
			BrSimpleList new
				stream: self posts;
				itemStencil: [ GtApFeedPostSummaryElement new
					addAptitude: BrShadowAptitude;
					background: Color white;
					margin: (BlInsets all: 10) ];
				itemDataBinder: [ :aPostElement :aPost | aPostElement post: aPost; when: BlClickEvent do: [ :e | e target phlow spawnObject: aPostElement post ] ] ]
]

{ #category : #accessing }
TAppBskyActorDefsProfileViewDetailed >> posts [
	^ posts ifNil: [  posts := self downloadPosts ]
]
