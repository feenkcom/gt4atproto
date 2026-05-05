Trait {
	#name : 'TAppBskyEmbedExternalView',
	#category : 'Gt4AtProto-Extensions-Traits',
	#package : 'Gt4AtProto-Extensions',
	#tag : 'Traits'
}

{ #category : 'accessing' }
TAppBskyEmbedExternalView >> asEmbeddedElement [
	^ GtApExternalElement new external: self
]

{ #category : 'accessing' }
TAppBskyEmbedExternalView >> hasMedia [
	"external embeds do not have attached media"
	^ false
]
