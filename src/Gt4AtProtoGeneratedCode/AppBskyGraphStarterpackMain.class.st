Class {
	#name : #AppBskyGraphStarterpackMain,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpName',
		'atpDescription',
		'atpDescriptionFacets',
		'atpList',
		'atpFeeds',
		'atpCreatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyGraphStarterpackMain class >> atpDescription [
 ^  'Record defining a starter pack of actors and feeds for new users.'
]

{ #category : #accessing }
AppBskyGraphStarterpackMain class >> atpFile [
 ^ 'app/bsky/graph/starterpack.json'
]

{ #category : #accessing }
AppBskyGraphStarterpackMain class >> atpRecordName [
 ^ 'app.bsky.graph.starterpack'
]

{ #category : #accessing }
AppBskyGraphStarterpackMain class >> atpSchema [
 ^ '{"type":"record","description":"Record defining a starter pack of actors and feeds for new users.","key":"tid","record":{"type":"object","required":["name","list","createdAt"],"properties":{"name":{"type":"string","maxGraphemes":50,"maxLength":500,"minLength":1,"description":"Display name for starter pack; can not be empty."},"description":{"type":"string","maxGraphemes":300,"maxLength":3000},"descriptionFacets":{"type":"array","items":{"type":"ref","ref":"app.bsky.richtext.facet"}},"list":{"type":"string","format":"at-uri","description":"Reference (AT-URI) to the list record."},"feeds":{"type":"array","maxLength":3,"items":{"type":"ref","ref":"#feedItem"}},"createdAt":{"type":"string","format":"datetime"}}}}'
]

{ #category : #serialization }
AppBskyGraphStarterpackMain class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpName: (aRequest at: 'name' ifAbsent: [ nil ]);
		atpDescription: (aRequest at: 'description' ifAbsent: [ nil ]);
		atpDescriptionFacets: (aRequest
				at: 'descriptionFacets'
				ifPresent: [ :anArray | anArray collect: [ :aValue | AppBskyRichtextFacetMain fromRequest: aValue ] ]
				ifAbsent: [ nil ]);
		atpList: (aRequest at: 'list' ifAbsent: [ nil ]);
		atpFeeds: (aRequest
				at: 'feeds'
				ifPresent: [ :anArray | 
					anArray
						collect: [ :aValue | AppBskyGraphStarterpackFeedItem fromRequest: aValue ] ]
				ifAbsent: [ nil ]);
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyGraphStarterpackMain >> atpCreatedAt [
	<atpType:#String format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
AppBskyGraphStarterpackMain >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
AppBskyGraphStarterpackMain >> atpDescription [
	<atpType:#String format:nil>
	^ atpDescription
]

{ #category : #accessing }
AppBskyGraphStarterpackMain >> atpDescription: anObject [
	atpDescription := anObject
]

{ #category : #accessing }
AppBskyGraphStarterpackMain >> atpDescriptionFacets [
	<atpType:#AppBskyRichtextFacetMain format:nil>
	<atpCollection>
	^ atpDescriptionFacets
]

{ #category : #accessing }
AppBskyGraphStarterpackMain >> atpDescriptionFacets: anObject [
	atpDescriptionFacets := anObject
]

{ #category : #accessing }
AppBskyGraphStarterpackMain >> atpFeeds [
	<atpType:#AppBskyGraphStarterpackFeedItem format:nil>
	<atpCollection>
	^ atpFeeds
]

{ #category : #accessing }
AppBskyGraphStarterpackMain >> atpFeeds: anObject [
	atpFeeds := anObject
]

{ #category : #accessing }
AppBskyGraphStarterpackMain >> atpList [
	<atpType:#String format:'at-uri'>
	^ atpList
]

{ #category : #accessing }
AppBskyGraphStarterpackMain >> atpList: anObject [
	atpList := anObject
]

{ #category : #accessing }
AppBskyGraphStarterpackMain >> atpName [
	<atpType:#String format:nil>
	^ atpName
]

{ #category : #accessing }
AppBskyGraphStarterpackMain >> atpName: anObject [
	atpName := anObject
]

{ #category : #magritte }
AppBskyGraphStarterpackMain >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt;
		beRequired
]

{ #category : #magritte }
AppBskyGraphStarterpackMain >> descriptionDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Description';
		accessor: #atpDescription
]

{ #category : #magritte }
AppBskyGraphStarterpackMain >> descriptionFacetsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {AppBskyRichtextFacetMain};
		label: 'DescriptionFacets';
		accessor: #atpDescriptionFacets
]

{ #category : #magritte }
AppBskyGraphStarterpackMain >> feedsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {AppBskyGraphStarterpackFeedItem};
		label: 'Feeds';
		accessor: #atpFeeds
]

{ #category : #magritte }
AppBskyGraphStarterpackMain >> listDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'List';
		accessor: #atpList;
		beRequired
]

{ #category : #magritte }
AppBskyGraphStarterpackMain >> nameDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Name';
		accessor: #atpName;
		beRequired
]
