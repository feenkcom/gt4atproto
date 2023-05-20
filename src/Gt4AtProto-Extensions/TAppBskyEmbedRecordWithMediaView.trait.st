Trait {
	#name : #TAppBskyEmbedRecordWithMediaView,
	#category : #'Gt4AtProto-Extensions'
}

{ #category : #accessing }
TAppBskyEmbedRecordWithMediaView >> asEmbeddedElement [
	^ self atpMedia asEmbeddedElement
]

{ #category : #accessing }
TAppBskyEmbedRecordWithMediaView >> hasMedia [
	^ self atpMedia notNil
]
