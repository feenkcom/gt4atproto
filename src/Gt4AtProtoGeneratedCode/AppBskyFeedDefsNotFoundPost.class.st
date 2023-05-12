Class {
	#name : #AppBskyFeedDefsNotFoundPost,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri',
		'atpNotFound'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyFeedDefsNotFoundPost class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]); 
		atpNotFound: (aRequest at: 'notFound' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedDefsNotFoundPost >> atpNotFound [
	^ atpNotFound
]

{ #category : #accessing }
AppBskyFeedDefsNotFoundPost >> atpNotFound: anObject [
	atpNotFound := anObject
]

{ #category : #accessing }
AppBskyFeedDefsNotFoundPost >> atpUri [
	^ atpUri
]

{ #category : #accessing }
AppBskyFeedDefsNotFoundPost >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #magritte }
AppBskyFeedDefsNotFoundPost >> notFoundDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'NotFound';
		accessor: #atpNotFound;
	beRequired
]

{ #category : #magritte }
AppBskyFeedDefsNotFoundPost >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
	beRequired
]
