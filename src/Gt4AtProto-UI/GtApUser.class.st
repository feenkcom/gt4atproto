Class {
	#name : #GtApUser,
	#superclass : #GtApModelEntity,
	#instVars : [
		'profilePictureForm',
		'posts'
	],
	#category : #'Gt4AtProto-UI'
}

{ #category : #accessing }
GtApUser >> displayName [
	^ rawData at: 'displayName'
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
]

{ #category : #accessing }
GtApUser >> gtViewPostsTimelineFor: aView [
	<gtView>
	
	^ aView forward 
		title: 'Timeline';
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
