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

{ #category : #serialization }
AppBskyGraphListMain class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpPurpose: (aRequest at: 'purpose' ifPresent: [:aValue | String fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpName: (aRequest at: 'name' ifAbsent: [ nil ]); 
		atpDescription: (aRequest at: 'description' ifAbsent: [ nil ]); 
		atpDescriptionFacets: (aRequest at: 'descriptionFacets' ifAbsent: [ nil ]); 
		atpAvatar: (aRequest at: 'avatar' ifAbsent: [ nil ]); 
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyGraphListMain >> atpAvatar [
	^ atpAvatar
]

{ #category : #accessing }
AppBskyGraphListMain >> atpAvatar: anObject [
	atpAvatar := anObject
]

{ #category : #accessing }
AppBskyGraphListMain >> atpCreatedAt [
	^ atpCreatedAt
]

{ #category : #accessing }
AppBskyGraphListMain >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
AppBskyGraphListMain >> atpDescription [
	^ atpDescription
]

{ #category : #accessing }
AppBskyGraphListMain >> atpDescription: anObject [
	atpDescription := anObject
]

{ #category : #accessing }
AppBskyGraphListMain >> atpDescriptionFacets [
	^ atpDescriptionFacets
]

{ #category : #accessing }
AppBskyGraphListMain >> atpDescriptionFacets: anObject [
	atpDescriptionFacets := anObject
]

{ #category : #accessing }
AppBskyGraphListMain >> atpName [
	^ atpName
]

{ #category : #accessing }
AppBskyGraphListMain >> atpName: anObject [
	atpName := anObject
]

{ #category : #accessing }
AppBskyGraphListMain >> atpPurpose [
	<referenceTo:'app.bsky.graph.defs#listPurpose'>
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
