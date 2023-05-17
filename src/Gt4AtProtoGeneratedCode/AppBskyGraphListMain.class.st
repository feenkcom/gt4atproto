Class {
	#name : #AppBskyGraphListMain,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpPurpose',
		'atpName',
		'atpDescription',
		'atpDescriptionFacets',
		'atpAvatar',
		'atpCreatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyGraphListMain class >> atpDescription [
 ^ 'A declaration of a list of actors.'
]

{ #category : #accessing }
AppBskyGraphListMain class >> atpFile [
 ^ 'app/bsky/graph/list.json'
]

{ #category : #accessing }
AppBskyGraphListMain class >> atpRecordName [
 ^ 'app.bsky.graph.list'
]

{ #category : #accessing }
AppBskyGraphListMain class >> atpSchema [
 ^ '{"type":"record","description":"A declaration of a list of actors.","key":"tid","record":{"type":"object","required":["name","purpose","createdAt"],"properties":{"purpose":{"type":"ref","ref":"app.bsky.graph.defs#listPurpose"},"name":{"type":"string","maxLength":64,"minLength":1},"description":{"type":"string","maxGraphemes":300,"maxLength":3000},"descriptionFacets":{"type":"array","items":{"type":"ref","ref":"app.bsky.richtext.facet"}},"avatar":{"type":"blob","accept":["image/png","image/jpeg"],"maxSize":1000000},"createdAt":{"type":"string","format":"datetime"}}}}'
]

{ #category : #serialization }
AppBskyGraphListMain class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpPurpose: (aRequest
				at: 'purpose'
				ifPresent: [ :aValue | String fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpName: (aRequest at: 'name' ifAbsent: [ nil ]);
		atpDescription: (aRequest at: 'description' ifAbsent: [ nil ]);
		atpDescriptionFacets: (aRequest
				at: 'descriptionFacets'
				ifPresent: [ :anArray | anArray collect: [ :aValue | AppBskyRichtextFacetMain fromRequest: aValue ] ]
				ifAbsent: [ nil ]);
		atpAvatar: (aRequest at: 'avatar' ifAbsent: [ nil ]);
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyGraphListMain >> atpAvatar [
	<atpType:#ByteArray format:nil>
	^ atpAvatar
]

{ #category : #accessing }
AppBskyGraphListMain >> atpAvatar: anObject [
	atpAvatar := anObject
]

{ #category : #accessing }
AppBskyGraphListMain >> atpCreatedAt [
	<atpType:#String format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
AppBskyGraphListMain >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
AppBskyGraphListMain >> atpDescription [
	<atpType:#String format:nil>
	^ atpDescription
]

{ #category : #accessing }
AppBskyGraphListMain >> atpDescription: anObject [
	atpDescription := anObject
]

{ #category : #accessing }
AppBskyGraphListMain >> atpDescriptionFacets [
	<atpType:#AppBskyRichtextFacetMain format:nil>
	<atpCollection>
	^ atpDescriptionFacets
]

{ #category : #accessing }
AppBskyGraphListMain >> atpDescriptionFacets: anObject [
	atpDescriptionFacets := anObject
]

{ #category : #accessing }
AppBskyGraphListMain >> atpName [
	<atpType:#String format:nil>
	^ atpName
]

{ #category : #accessing }
AppBskyGraphListMain >> atpName: anObject [
	atpName := anObject
]

{ #category : #accessing }
AppBskyGraphListMain >> atpPurpose [
	<referenceTo:'app.bsky.graph.defs#listPurpose'>
	<atpType:#String format:nil>
	^ atpPurpose
]

{ #category : #accessing }
AppBskyGraphListMain >> atpPurpose: anObject [
	<referenceTo:'app.bsky.graph.defs#listPurpose'>
	atpPurpose := anObject
]

{ #category : #magritte }
AppBskyGraphListMain >> avatarDescription [
	<magritteDescription>
	^ MAFileDescription new
		label: 'Avatar';
		accessor: #atpAvatar
]

{ #category : #magritte }
AppBskyGraphListMain >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt;
		beRequired
]

{ #category : #magritte }
AppBskyGraphListMain >> descriptionDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Description';
		accessor: #atpDescription
]

{ #category : #magritte }
AppBskyGraphListMain >> descriptionFacetsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {AppBskyRichtextFacetMain};
		label: 'DescriptionFacets';
		accessor: #atpDescriptionFacets
]

{ #category : #magritte }
AppBskyGraphListMain >> nameDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Name';
		accessor: #atpName;
		beRequired
]

{ #category : #magritte }
AppBskyGraphListMain >> purposeDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Purpose';
		accessor: #atpPurpose;
		beRequired
]
