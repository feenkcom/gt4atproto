Class {
	#name : #GtApUser,
	#superclass : #GtApModelEntity,
	#instVars : [
		'profilePictureForm',
		'posts',
		'followers',
		'following'
	],
	#category : #'Gt4AtProto-UI'
}

{ #category : #accessing }
GtApUser >> description [
	^ rawData at: 'description' ifAbsent: [ '' ]
]

{ #category : #accessing }
GtApUser >> displayName [
	^ rawData at: 'displayName' ifAbsent: [ '' ]
]

{ #category : #accessing }
GtApUser >> downloadFollowers [
	^ (((self createClientForId: 'app.bsky.graph.getFollowers') 
		queryAddAll: {'actor' -> self handle} asDictionary;
		query) at: 'followers') collect: [ :each |
			GtApUser new
				targetUrl: targetUrl;
				loginData: loginData;
				rawData: each ]
]

{ #category : #accessing }
GtApUser >> downloadFollowing [
	^ (((self createClientForId: 'app.bsky.graph.getFollows') 
		queryAddAll: {'actor' -> self handle} asDictionary;
		query) at: 'follows') collect: [ :each |
			GtApUser new
				targetUrl: targetUrl;
				loginData: loginData;
				rawData: each ]
]

{ #category : #accessing }
GtApUser >> downloadPofileImage [
	^ (rawData at: 'avatar')
		ifNotNil: [ :anUrlString |
			(anUrlString endsWith: 'png')
				ifTrue: [ ^ ZnEasy gtGetPng: anUrlString ].
			(anUrlString endsWith: 'jpeg')
				ifTrue: [ ^ ZnEasy getJpeg: anUrlString ].
			^ nil ]
]

{ #category : #accessing }
GtApUser >> downloadPosts [
	^ (((self createClientForId: 'app.bsky.feed.getAuthorFeed') 
		queryAddAll: {'actor' -> self handle} asDictionary;
		query) at: 'feed') collect: [ :each |
			GtApPost new
				targetUrl: targetUrl;
				loginData: loginData;
				rawData: (each at: 'post') ]
]

{ #category : #accessing }
GtApUser >> followers [
	^ followers ifNil: [
		followers := self downloadFollowers]
]

{ #category : #accessing }
GtApUser >> following [
	^ following ifNil: [
		following := self downloadFollowing]
]

{ #category : #'gt - extensions' }
GtApUser >> gtViewFollowersFor: aView [
	<gtView>
	
	^ aView list
		title: 'Followers';
		priority: 10;
		items: [ self followers ];
		itemStencil: [ 
			GtApUserSummaryListContainerElement new ];
		itemDataBinder: [ :aUserElement :aUser | 
			aUserElement user: aUser ].
]

{ #category : #'gt - extensions' }
GtApUser >> gtViewFollowingFor: aView [
	<gtView>
	
	^ aView list
		title: 'Following';
		priority: 15;
		items: [ self following ];
		itemStencil: [ 
			GtApUserSummaryListContainerElement new ];
		itemDataBinder: [ :aUserElement :aUser | 
			aUserElement user: aUser ].
]

{ #category : #'gt - extensions' }
GtApUser >> gtViewPostsTimelineFor: aView [
	<gtView>
	
	^ aView forward 
		title: 'Timeline';
		priority: 5;
		object: [ GtApUserTimeline forPosts: self posts ];
		view: #gtViewPostsSummaryUIFor:
]

{ #category : #accessing }
GtApUser >> handle [
	^ rawData at: 'handle'
]

{ #category : #accessing }
GtApUser >> posts [ 
	^ posts ifNil: [ 
		posts := self downloadPosts ]
]

{ #category : #accessing }
GtApUser >> posts: anObject [
	posts := anObject
]

{ #category : #accessing }
GtApUser >> printOn: aStream [
	super printOn: aStream.
	
	aStream parenthesize: [
		aStream  
			<< self displayName;
			<< ' ';
			<< self handle]
]

{ #category : #accessing }
GtApUser >> profilePictureForm [ 
	^ profilePictureForm ifNil: [
		[profilePictureForm := self downloadPofileImage]
			
			on: Error 
			do: [ profilePictureForm := nil ].
		profilePictureForm ifNil: [
			profilePictureForm := Form extent: 48@48 depth: 32.
			profilePictureForm fillColor: (Color veryLightGray).
			profilePictureForm ] ]
]
