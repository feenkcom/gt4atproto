Class {
	#name : #GtApPost,
	#superclass : #GtApModelEntity,
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
GtApPost >> gtCardFor: aView [
	<gtView>
	
	^ aView explicit
		title: 'Card';
		priority: 0;
		stencil: [ 
			GtApPostSummaryElement new
				post: self;
				addAptitude: BrShadowAptitude;
				background: Color white;
				margin: (BlInsets all: 10) ]
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
GtApPost >> repostsCount [
	^ rawData at: 'repostCount'
]
