Class {
	#name : #ChatBskyConvoDefsLogBeginConvo,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpRev',
		'atpConvoId'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ChatBskyConvoDefsLogBeginConvo class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ChatBskyConvoDefsLogBeginConvo class >> atpFile [
 ^ 'chat/bsky/convo/defs.json'
]

{ #category : #accessing }
ChatBskyConvoDefsLogBeginConvo class >> atpRecordName [
 ^ 'chat.bsky.convo.defs#logBeginConvo'
]

{ #category : #accessing }
ChatBskyConvoDefsLogBeginConvo class >> atpSchema [
 ^ '{"type":"object","required":["rev","convoId"],"properties":{"rev":{"type":"string"},"convoId":{"type":"string"}}}'
]

{ #category : #serialization }
ChatBskyConvoDefsLogBeginConvo class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpRev: (aRequest at: 'rev' ifAbsent: [ nil ]);
		atpConvoId: (aRequest at: 'convoId' ifAbsent: [ nil ])
]

{ #category : #accessing }
ChatBskyConvoDefsLogBeginConvo >> atpConvoId [
	<atpType:#String format:nil>
	^ atpConvoId
]

{ #category : #accessing }
ChatBskyConvoDefsLogBeginConvo >> atpConvoId: anObject [
	atpConvoId := anObject
]

{ #category : #accessing }
ChatBskyConvoDefsLogBeginConvo >> atpRev [
	<atpType:#String format:nil>
	^ atpRev
]

{ #category : #accessing }
ChatBskyConvoDefsLogBeginConvo >> atpRev: anObject [
	atpRev := anObject
]

{ #category : #magritte }
ChatBskyConvoDefsLogBeginConvo >> convoIdDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'ConvoId';
		accessor: #atpConvoId;
		beRequired
]

{ #category : #magritte }
ChatBskyConvoDefsLogBeginConvo >> revDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Rev';
		accessor: #atpRev;
		beRequired
]
