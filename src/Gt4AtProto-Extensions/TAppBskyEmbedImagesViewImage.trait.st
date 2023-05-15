"
This trait is an extension for {{gtClass:AppBskyEmbedImagesViewImage}}.
"
Trait {
	#name : #TAppBskyEmbedImagesViewImage,
	#category : #'Gt4AtProto-Extensions-Traits'
}

{ #category : #accessing }
TAppBskyEmbedImagesViewImage >> asImageElement [
	^ BrAsyncFileWidget new hMatchParent
		vExact: 200;
		url: self atpFullsize
]

{ #category : #accessing }
TAppBskyEmbedImagesViewImage >> gtImageFor: aView [
	<gtView>
	^ aView explicit 
		title: 'Image';
		stencil: [ self asImageElement ]
]
