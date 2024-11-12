Class {
	#name : #AppBskyFeedGeneratorMain,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpDid',
		'atpDisplayName',
		'atpDescription',
		'atpDescriptionFacets',
		'atpAvatar',
		'atpAcceptsInteractions',
		'atpLabels',
		'atpCreatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedGeneratorMain class >> atpDescription [
 ^  'Record declaring of the existence of a feed generator, and containing metadata about it. The record can exist in any repository.'
]

{ #category : #accessing }
AppBskyFeedGeneratorMain class >> atpFile [
 ^ 'app/bsky/feed/generator.json'
]

{ #category : #accessing }
AppBskyFeedGeneratorMain class >> atpRecordName [
 ^ 'app.bsky.feed.generator'
]

{ #category : #accessing }
AppBskyFeedGeneratorMain class >> atpSchema [
 ^ '{"type":"record","description":"Record declaring of the existence of a feed generator, and containing metadata about it. The record can exist in any repository.","key":"any","record":{"type":"object","required":["did","displayName","createdAt"],"properties":{"did":{"type":"string","format":"did"},"displayName":{"type":"string","maxGraphemes":24,"maxLength":240},"description":{"type":"string","maxGraphemes":300,"maxLength":3000},"descriptionFacets":{"type":"array","items":{"type":"ref","ref":"app.bsky.richtext.facet"}},"avatar":{"type":"blob","accept":["image/png","image/jpeg"],"maxSize":1000000},"acceptsInteractions":{"type":"boolean","description":"Declaration that a feed accepts feedback interactions from a client through app.bsky.feed.sendInteractions"},"labels":{"type":"union","description":"Self-label values","refs":["com.atproto.label.defs#selfLabels"]},"createdAt":{"type":"string","format":"datetime"}}}}'
]

{ #category : #serialization }
AppBskyFeedGeneratorMain class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ]);
		atpDisplayName: (aRequest at: 'displayName' ifAbsent: [ nil ]);
		atpDescription: (aRequest at: 'description' ifAbsent: [ nil ]);
		atpDescriptionFacets: (aRequest
				at: 'descriptionFacets'
				ifPresent: [ :anArray | anArray collect: [ :aValue | AppBskyRichtextFacetMain fromRequest: aValue ] ]
				ifAbsent: [ nil ]);
		atpAvatar: (aRequest at: 'avatar' ifAbsent: [ nil ]);
		atpAcceptsInteractions: (aRequest at: 'acceptsInteractions' ifAbsent: [ nil ]);
		atpLabels: (aRequest
				at: 'labels'
				ifPresent: [ :aValue | 
					({'com.atproto.label.defs#selfLabels' -> ComAtprotoLabelDefsSelfLabels}
						asDictionary
						at: (aValue at: '$type')
						ifAbsent: [ GtApUnknownRecord new key: (aValue at: '$type') ])
						fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ])
]

{ #category : #magritte }
AppBskyFeedGeneratorMain >> acceptsInteractionsDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'AcceptsInteractions';
		accessor: #atpAcceptsInteractions
]

{ #category : #accessing }
AppBskyFeedGeneratorMain >> atpAcceptsInteractions [
	<atpType:#Boolean format:nil>
	^ atpAcceptsInteractions
]

{ #category : #accessing }
AppBskyFeedGeneratorMain >> atpAcceptsInteractions: anObject [
	atpAcceptsInteractions := anObject
]

{ #category : #accessing }
AppBskyFeedGeneratorMain >> atpAvatar [
	<atpType:#ByteArray format:nil>
	^ atpAvatar
]

{ #category : #accessing }
AppBskyFeedGeneratorMain >> atpAvatar: anObject [
	atpAvatar := anObject
]

{ #category : #accessing }
AppBskyFeedGeneratorMain >> atpCreatedAt [
	<atpType:#String format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
AppBskyFeedGeneratorMain >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
AppBskyFeedGeneratorMain >> atpDescription [
	<atpType:#String format:nil>
	^ atpDescription
]

{ #category : #accessing }
AppBskyFeedGeneratorMain >> atpDescription: anObject [
	atpDescription := anObject
]

{ #category : #accessing }
AppBskyFeedGeneratorMain >> atpDescriptionFacets [
	<atpType:#AppBskyRichtextFacetMain format:nil>
	<atpCollection>
	^ atpDescriptionFacets
]

{ #category : #accessing }
AppBskyFeedGeneratorMain >> atpDescriptionFacets: anObject [
	atpDescriptionFacets := anObject
]

{ #category : #accessing }
AppBskyFeedGeneratorMain >> atpDid [
	<atpType:#String format:'did'>
	^ atpDid
]

{ #category : #accessing }
AppBskyFeedGeneratorMain >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #accessing }
AppBskyFeedGeneratorMain >> atpDisplayName [
	<atpType:#String format:nil>
	^ atpDisplayName
]

{ #category : #accessing }
AppBskyFeedGeneratorMain >> atpDisplayName: anObject [
	atpDisplayName := anObject
]

{ #category : #accessing }
AppBskyFeedGeneratorMain >> atpLabels [
	<atpType:#(ComAtprotoLabelDefsSelfLabels) format:nil>
	^ atpLabels
]

{ #category : #accessing }
AppBskyFeedGeneratorMain >> atpLabels: anObject [
	atpLabels := anObject
]

{ #category : #magritte }
AppBskyFeedGeneratorMain >> avatarDescription [
	<magritteDescription>
	^ MAFileDescription new
		label: 'Avatar';
		accessor: #atpAvatar
]

{ #category : #magritte }
AppBskyFeedGeneratorMain >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt;
		beRequired
]

{ #category : #magritte }
AppBskyFeedGeneratorMain >> descriptionDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Description';
		accessor: #atpDescription
]

{ #category : #magritte }
AppBskyFeedGeneratorMain >> descriptionFacetsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {AppBskyRichtextFacetMain};
		label: 'DescriptionFacets';
		accessor: #atpDescriptionFacets
]

{ #category : #magritte }
AppBskyFeedGeneratorMain >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid;
		beRequired
]

{ #category : #magritte }
AppBskyFeedGeneratorMain >> displayNameDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'DisplayName';
		accessor: #atpDisplayName;
		beRequired
]

{ #category : #magritte }
AppBskyFeedGeneratorMain >> labelsDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'com.atproto.label.defs#selfLabels'};
		label: 'Labels';
		accessor: #atpLabels
]
