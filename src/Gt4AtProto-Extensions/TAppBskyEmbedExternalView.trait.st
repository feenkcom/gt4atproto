Trait {
	#name : #TAppBskyEmbedExternalView,
	#category : #'Gt4AtProto-Extensions-Traits'
}

{ #category : #accessing }
TAppBskyEmbedExternalView >> asEmbeddedElement [
	^ GtApExternalElement new external: self
]

{ #category : #accessing }
TAppBskyEmbedExternalView >> hasMedia [
	"external embeds do not have attached media"
	^ false
]
