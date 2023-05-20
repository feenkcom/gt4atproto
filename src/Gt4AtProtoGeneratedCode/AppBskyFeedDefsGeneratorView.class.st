Class {
	#name : #AppBskyFeedDefsGeneratorView,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri',
		'atpCid',
		'atpDid',
		'atpCreator',
		'atpDisplayName',
		'atpDescription',
		'atpDescriptionFacets',
		'atpAvatar',
		'atpLikeCount',
		'atpViewer',
		'atpIndexedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedDefsGeneratorView class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
AppBskyFeedDefsGeneratorView class >> atpFile [
 ^ 'app/bsky/feed/defs.json'
]

{ #category : #accessing }
AppBskyFeedDefsGeneratorView class >> atpRecordName [
 ^ 'app.bsky.feed.defs#generatorView'
]

{ #category : #accessing }
AppBskyFeedDefsGeneratorView class >> atpSchema [
 ^ '{"type":"object","required":["uri","cid","creator","displayName","indexedAt"],"properties":{"uri":{"type":"string","format":"at-uri"},"cid":{"type":"string","format":"cid"},"did":{"type":"string","format":"did"},"creator":{"type":"ref","ref":"app.bsky.actor.defs#profileView"},"displayName":{"type":"string"},"description":{"type":"string","maxGraphemes":300,"maxLength":3000},"descriptionFacets":{"type":"array","items":{"type":"ref","ref":"app.bsky.richtext.facet"}},"avatar":{"type":"string"},"likeCount":{"type":"integer","minimum":0},"viewer":{"type":"ref","ref":"#generatorViewerState"},"indexedAt":{"type":"string","format":"datetime"}}}'
]

{ #category : #serialization }
AppBskyFeedDefsGeneratorView class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]);
		atpCid: (aRequest at: 'cid' ifAbsent: [ nil ]);
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ]);
		atpCreator: (aRequest
				at: 'creator'
				ifPresent: [ :aValue | AppBskyActorDefsProfileView fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpDisplayName: (aRequest at: 'displayName' ifAbsent: [ nil ]);
		atpDescription: (aRequest at: 'description' ifAbsent: [ nil ]);
		atpDescriptionFacets: (aRequest
				at: 'descriptionFacets'
				ifPresent: [ :anArray | anArray collect: [ :aValue | AppBskyRichtextFacetMain fromRequest: aValue ] ]
				ifAbsent: [ nil ]);
		atpAvatar: (aRequest at: 'avatar' ifAbsent: [ nil ]);
		atpLikeCount: (aRequest at: 'likeCount' ifAbsent: [ nil ]);
		atpViewer: (aRequest
				at: 'viewer'
				ifPresent: [ :aValue | AppBskyFeedDefsGeneratorViewerState fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpIndexedAt: (aRequest at: 'indexedAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedDefsGeneratorView >> atpAvatar [
	<atpType:#String format:nil>
	^ atpAvatar
]

{ #category : #accessing }
AppBskyFeedDefsGeneratorView >> atpAvatar: anObject [
	atpAvatar := anObject
]

{ #category : #accessing }
AppBskyFeedDefsGeneratorView >> atpCid [
	<atpType:#String format:'cid'>
	^ atpCid
]

{ #category : #accessing }
AppBskyFeedDefsGeneratorView >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
AppBskyFeedDefsGeneratorView >> atpCreator [
	<referenceTo:'app.bsky.actor.defs#profileView'>
	<atpType:#AppBskyActorDefsProfileView format:nil>
	^ atpCreator
]

{ #category : #accessing }
AppBskyFeedDefsGeneratorView >> atpCreator: anObject [
	<referenceTo:'app.bsky.actor.defs#profileView'>
	atpCreator := anObject
]

{ #category : #accessing }
AppBskyFeedDefsGeneratorView >> atpDescription [
	<atpType:#String format:nil>
	^ atpDescription
]

{ #category : #accessing }
AppBskyFeedDefsGeneratorView >> atpDescription: anObject [
	atpDescription := anObject
]

{ #category : #accessing }
AppBskyFeedDefsGeneratorView >> atpDescriptionFacets [
	<atpType:#AppBskyRichtextFacetMain format:nil>
	<atpCollection>
	^ atpDescriptionFacets
]

{ #category : #accessing }
AppBskyFeedDefsGeneratorView >> atpDescriptionFacets: anObject [
	atpDescriptionFacets := anObject
]

{ #category : #accessing }
AppBskyFeedDefsGeneratorView >> atpDid [
	<atpType:#String format:'did'>
	^ atpDid
]

{ #category : #accessing }
AppBskyFeedDefsGeneratorView >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #accessing }
AppBskyFeedDefsGeneratorView >> atpDisplayName [
	<atpType:#String format:nil>
	^ atpDisplayName
]

{ #category : #accessing }
AppBskyFeedDefsGeneratorView >> atpDisplayName: anObject [
	atpDisplayName := anObject
]

{ #category : #accessing }
AppBskyFeedDefsGeneratorView >> atpIndexedAt [
	<atpType:#String format:'datetime'>
	^ atpIndexedAt
]

{ #category : #accessing }
AppBskyFeedDefsGeneratorView >> atpIndexedAt: anObject [
	atpIndexedAt := anObject
]

{ #category : #accessing }
AppBskyFeedDefsGeneratorView >> atpLikeCount [
	<atpType:#Number format:nil>
	^ atpLikeCount
]

{ #category : #accessing }
AppBskyFeedDefsGeneratorView >> atpLikeCount: anObject [
	atpLikeCount := anObject
]

{ #category : #accessing }
AppBskyFeedDefsGeneratorView >> atpUri [
	<atpType:#String format:'at-uri'>
	^ atpUri
]

{ #category : #accessing }
AppBskyFeedDefsGeneratorView >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #accessing }
AppBskyFeedDefsGeneratorView >> atpViewer [
	<referenceTo:'#generatorViewerState'>
	<atpType:#AppBskyFeedDefsGeneratorViewerState format:nil>
	^ atpViewer
]

{ #category : #accessing }
AppBskyFeedDefsGeneratorView >> atpViewer: anObject [
	<referenceTo:'#generatorViewerState'>
	atpViewer := anObject
]

{ #category : #magritte }
AppBskyFeedDefsGeneratorView >> avatarDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Avatar';
		accessor: #atpAvatar
]

{ #category : #magritte }
AppBskyFeedDefsGeneratorView >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atpCid;
		beRequired
]

{ #category : #magritte }
AppBskyFeedDefsGeneratorView >> creatorDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Creator';
		accessor: #atpCreator;
		beRequired
]

{ #category : #magritte }
AppBskyFeedDefsGeneratorView >> descriptionDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Description';
		accessor: #atpDescription
]

{ #category : #magritte }
AppBskyFeedDefsGeneratorView >> descriptionFacetsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {AppBskyRichtextFacetMain};
		label: 'DescriptionFacets';
		accessor: #atpDescriptionFacets
]

{ #category : #magritte }
AppBskyFeedDefsGeneratorView >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid
]

{ #category : #magritte }
AppBskyFeedDefsGeneratorView >> displayNameDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'DisplayName';
		accessor: #atpDisplayName;
		beRequired
]

{ #category : #magritte }
AppBskyFeedDefsGeneratorView >> indexedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'IndexedAt';
		accessor: #atpIndexedAt;
		beRequired
]

{ #category : #magritte }
AppBskyFeedDefsGeneratorView >> likeCountDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'LikeCount';
		accessor: #atpLikeCount
]

{ #category : #magritte }
AppBskyFeedDefsGeneratorView >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
		beRequired
]

{ #category : #magritte }
AppBskyFeedDefsGeneratorView >> viewerDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Viewer';
		accessor: #atpViewer
]
