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
TAppBskyEmbedRecordView >> atpPost [
	^ self atpRecord
]

{ #category : #accessing }
TAppBskyEmbedRecordView >> author [
	^ self atpRecord atpAuthor
]

{ #category : #accessing }
TAppBskyEmbedRecordView >> createdAt [
	(self atpRecord isKindOf: AppBskyGraphDefsStarterPackViewBasic)
		ifTrue: [ ^ self atpRecord atpRecord atpCreatedAt ].

	(self atpRecord isKindOf: AppBskyFeedDefsGeneratorView)
		ifTrue: [ ^ self atpRecord atpCreator atpCreatedAt ].

	^ self atpRecord atpValue atpCreatedAt
]

{ #category : #accessing }
TAppBskyEmbedRecordView >> createdAtTimestamp [
	^ DateAndTime fromString: self createdAt
]

{ #category : #accessing }
TAppBskyEmbedRecordView >> hasEmbed [
	^ self atpRecord atpEmbeds isEmptyOrNil not
]

{ #category : #accessing }
TAppBskyEmbedRecordView >> hasMedia [
	^ self hasPhotos
]

{ #category : #accessing }
TAppBskyEmbedRecordView >> hasPhotos [
	(self atpRecord isKindOf: AppBskyEmbedRecordViewRecord) ifFalse: [ ^ false ].

	^ self atpRecord atpEmbeds isNotNil
]

{ #category : #accessing }
TAppBskyEmbedRecordView >> isBlocked [
	^ self atpRecord isKindOf: AppBskyEmbedRecordViewBlocked
]

{ #category : #accessing }
TAppBskyEmbedRecordView >> recordText [
	(self atpRecord isKindOf: AppBskyGraphDefsStarterPackViewBasic)
		ifTrue: [ ^ 'Starter pack "' , self atpRecord atpRecord atpName , '" from '
				, self atpRecord atpCreator atpHandle ].
				
		(self atpRecord isKindOf: AppBskyFeedDefsGeneratorView)
		ifTrue: [ ^ 'Feed "' , self atpRecord atpDisplayName , '" from '
				, self atpRecord atpCreator atpHandle ].
				
	^ self atpRecord atpValue atpText
]
