Class {
	#name : #GtApPost,
	#superclass : #GtApModelEntity,
	#category : #'Gt4AtProto-UI'
}

{ #category : #accessing }
GtApPost >> author [
	^ GtApUser fromRawData: (rawData at: 'author')
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

{ #category : #accessing }
GtApPost >> recordText [
	^ (rawData at: 'record') at: 'text'
]

{ #category : #accessing }
GtApPost >> repostsCount [
	^ rawData at: 'repostCount'
]
