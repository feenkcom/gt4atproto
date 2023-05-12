Trait {
	#name : #TAppBskyActorDefsProfileViewDetailed,
	#instVars : [
		'posts'
	],
	#category : #'Gt4AtProto-Extensions-Traits'
}

{ #category : #accessing }
TAppBskyActorDefsProfileViewDetailed >> downloadPosts [
	^ self client appBskyFeedGetAuthorFeedactor: self atpHandle
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
