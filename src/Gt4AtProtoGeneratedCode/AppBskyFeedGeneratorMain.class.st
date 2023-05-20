Class {
	#name : #AppBskyFeedGeneratorMain,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpDid',
		'atpDisplayName',
		'atpDescription',
		'atpDescriptionFacets',
		'atpAvatar',
		'atpCreatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyFeedGeneratorMain class >> atpDescription [
 ^ 'A declaration of the existence of a feed generator'
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
 ^ '{"type":"record","description":"A declaration of the existence of a feed generator","key":"any","record":{"type":"object","required":["did","displayName","createdAt"],"properties":{"did":{"type":"string","format":"did"},"displayName":{"type":"string","maxGraphemes":24,"maxLength":240},"description":{"type":"string","maxGraphemes":300,"maxLength":3000},"descriptionFacets":{"type":"array","items":{"type":"ref","ref":"app.bsky.richtext.facet"}},"avatar":{"type":"blob","accept":["image/png","image/jpeg"],"maxSize":1000000},"createdAt":{"type":"string","format":"datetime"}}}}'
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
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ])
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
