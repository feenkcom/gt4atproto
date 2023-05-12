Trait {
	#name : #TAppBskyEmbedImagesView,
	#category : #'Gt4AtProto-Extensions-Traits'
}

{ #category : #accessing }
TAppBskyEmbedImagesView >> asEmbeddedElement [
	^ BrVerticalPane new matchParent
		addChildren: (self atpImages
				collect: [ :anImage | BrAsyncFileWidget new hMatchParent vExact: 200; url: anImage atpFullsize ])
]
