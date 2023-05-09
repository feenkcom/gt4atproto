Class {
	#name : #GtApPost,
	#superclass : #GtApModelEntity,
	#instVars : [
		'replies'
	],
	#category : #'Gt4AtProto-UI'
}

{ #category : #accessing }
GtApPost class >> methodId [
	^ 'app.bsky.feed.getTimeline'
]

{ #category : #accessing }
GtApPost >> author [
	^ (GtApUser fromRawData: (rawData at: 'author')) client: client
]

{ #category : #accessing }
GtApPost >> getReplies [
	^ (((self client
		queryOn: 'app.bsky.feed.getPostThread'
		parameters: {'uri' -> (rawData at: 'uri')} asDictionary) at: 'thread')
		at: 'replies')
		collect: [ :aDatum | (GtApPost fromRawData: (aDatum at: 'post')) client: client ]
]

{ #category : #accessing }
GtApPost >> gtCardFor: aView [
	<gtView>
	
	^ aView explicit
		title: 'Card';
		priority: 1;
		stencil: [ 
			GtApPostSummaryElement new
				post: self;
				addAptitude: BrShadowAptitude;
				background: Color white;
				margin: (BlInsets all: 10) ]
]

{ #category : #accessing }
GtApPost >> gtRepliesFor: aView [
	<gtView>
	^ aView list
		title: 'Replies';
		priority: 2;
		items: [ self replies ];
		itemStencil: [ GtApPostSummaryListContainerElement new ];
		itemDataBinder: [ :aPostElement :aPost | aPostElement post: aPost ]
]

{ #category : #accessing }
GtApPost >> gtThreadFor: aView [
	<gtView>
	^ aView tree
		title: 'Thread';
		priority: 0;
		items: [ {self} ];
		children: #replies;
		stencil: [ :aPost | GtApPostSummaryElement new post: aPost ];
		expandOneLevel
]

{ #category : #accessing }
GtApPost >> hasPhotos [
	^ false
]

{ #category : #accessing }
GtApPost >> likesCount [
	^ rawData at: 'likeCount'
]

{ #category : #accessing }
GtApPost >> mediaItems [
	^ #()
]

{ #category : #printing }
GtApPost >> printOn: aStream [
	super printOn: aStream.
	
	aStream parenthesize: [
		aStream << self recordText ]
]

{ #category : #accessing }
GtApPost >> recordText [
	^ (rawData at: 'record') at: 'text'
]

{ #category : #accessing }
GtApPost >> replies [
	^ replies ifNil: [ replies := self getReplies ]
]

{ #category : #accessing }
GtApPost >> repostsCount [
	^ rawData at: 'repostCount'
]
