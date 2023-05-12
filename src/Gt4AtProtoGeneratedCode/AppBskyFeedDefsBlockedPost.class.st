Class {
	#name : #AppBskyFeedDefsBlockedPost,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri',
		'atpBlocked'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyFeedDefsBlockedPost class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]); 
		atpBlocked: (aRequest at: 'blocked' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedDefsBlockedPost >> atpBlocked [
	^ atpBlocked
]

{ #category : #accessing }
AppBskyFeedDefsBlockedPost >> atpBlocked: anObject [
	atpBlocked := anObject
]

{ #category : #accessing }
AppBskyFeedDefsBlockedPost >> atpUri [
	^ atpUri
]

{ #category : #accessing }
AppBskyFeedDefsBlockedPost >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #magritte }
AppBskyFeedDefsBlockedPost >> blockedDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Blocked';
		accessor: #atpBlocked;
	beRequired
]

{ #category : #magritte }
AppBskyFeedDefsBlockedPost >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
	beRequired
]
