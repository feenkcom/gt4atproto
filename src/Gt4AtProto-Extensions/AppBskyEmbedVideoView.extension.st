Extension { #name : #AppBskyEmbedVideoView }

{ #category : #'*Gt4AtProto-Extensions' }
AppBskyEmbedVideoView >> asElement [
	^ GtWebViewElement new url: self atpPlaylist
]

{ #category : #'*Gt4AtProto-Extensions' }
AppBskyEmbedVideoView >> gtWebpageFor: aView [
	<gtView>
	^ aView explicit
		title: 'Webpage';
		priority: 1;
		stencil: [ self asElement
				margin: (BlInsets all: 10);
				background: Color white;
				aptitude: BrShadowAptitude ]
]
