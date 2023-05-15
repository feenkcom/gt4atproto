"
This trait is an extension to {{gtClass:AppBskyEmbedImagesView}}.
"
Trait {
	#name : #TAppBskyEmbedImagesView,
	#category : #'Gt4AtProto-Extensions-Traits'
}

{ #category : #accessing }
TAppBskyEmbedImagesView >> asEmbeddedElement [
	^ BrVerticalPane new matchParent
		addChildren: (self atpImages
				collect: [ :anImage | anImage asImageElement ])
]

{ #category : #accessing }
TAppBskyEmbedImagesView >> gtImagesFor: aView [
	<gtView>
	^ aView explicit
		title: 'Images';
		priority: 10;
		stencil: [ self asEmbeddedElement ]
]

{ #category : #accessing }
TAppBskyEmbedImagesView >> hasMedia [
	^ self atpImages notEmpty
]
