Trait {
	#name : #TAppBskyEmbedRecordView,
	#category : #'Gt4AtProto-Extensions-Traits'
}

{ #category : #accessing }
TAppBskyEmbedRecordView >> asEmbeddedElement [
	^ GtApFeedEmbeddedPostSummaryElement new
		post: self;
		addAptitude: BrShadowAptitude;
		background: Color white;
		margin: (BlInsets all: 10)
]

{ #category : #accessing }
TAppBskyEmbedRecordView >> author [
	^ self atpRecord atpAuthor
]

{ #category : #accessing }
TAppBskyEmbedRecordView >> createdAt [
	^ self atpRecord atpValue atpCreatedAt
]

{ #category : #accessing }
TAppBskyEmbedRecordView >> createdAtTimestamp [
	^ DateAndTime fromString: self createdAt
]

{ #category : #accessing }
TAppBskyEmbedRecordView >> hasMedia [
	^ self hasPhotos
]

{ #category : #accessing }
TAppBskyEmbedRecordView >> hasPhotos [
	^ self atpRecord atpEmbeds isNotNil
]

{ #category : #accessing }
TAppBskyEmbedRecordView >> recordText [
	^ self atpRecord atpValue atpText
]
