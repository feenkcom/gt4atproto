Class {
	#name : #ChatBskyConvoDefsLogLeaveConvo,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpRev',
		'atpConvoId'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ChatBskyConvoDefsLogLeaveConvo class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ChatBskyConvoDefsLogLeaveConvo class >> atpFile [
 ^ 'chat/bsky/convo/defs.json'
]

{ #category : #accessing }
ChatBskyConvoDefsLogLeaveConvo class >> atpRecordName [
 ^ 'chat.bsky.convo.defs#logLeaveConvo'
]

{ #category : #accessing }
ChatBskyConvoDefsLogLeaveConvo class >> atpSchema [
 ^ '{"type":"object","required":["rev","convoId"],"properties":{"rev":{"type":"string"},"convoId":{"type":"string"}}}'
]

{ #category : #serialization }
ChatBskyConvoDefsLogLeaveConvo class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpRev: (aRequest at: 'rev' ifAbsent: [ nil ]);
		atpConvoId: (aRequest at: 'convoId' ifAbsent: [ nil ])
]

{ #category : #accessing }
ChatBskyConvoDefsLogLeaveConvo >> atpConvoId [
	<atpType:#String format:nil>
	^ atpConvoId
]

{ #category : #accessing }
ChatBskyConvoDefsLogLeaveConvo >> atpConvoId: anObject [
	atpConvoId := anObject
]

{ #category : #accessing }
ChatBskyConvoDefsLogLeaveConvo >> atpRev [
	<atpType:#String format:nil>
	^ atpRev
]

{ #category : #accessing }
ChatBskyConvoDefsLogLeaveConvo >> atpRev: anObject [
	atpRev := anObject
]

{ #category : #magritte }
ChatBskyConvoDefsLogLeaveConvo >> convoIdDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'ConvoId';
		accessor: #atpConvoId;
		beRequired
]

{ #category : #magritte }
ChatBskyConvoDefsLogLeaveConvo >> revDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Rev';
		accessor: #atpRev;
		beRequired
]
