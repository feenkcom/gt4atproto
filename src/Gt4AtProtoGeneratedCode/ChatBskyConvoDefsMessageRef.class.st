Class {
	#name : #ChatBskyConvoDefsMessageRef,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpDid',
		'atpConvoId',
		'atpMessageId'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ChatBskyConvoDefsMessageRef class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ChatBskyConvoDefsMessageRef class >> atpFile [
 ^ 'chat/bsky/convo/defs.json'
]

{ #category : #accessing }
ChatBskyConvoDefsMessageRef class >> atpRecordName [
 ^ 'chat.bsky.convo.defs#messageRef'
]

{ #category : #accessing }
ChatBskyConvoDefsMessageRef class >> atpSchema [
 ^ '{"type":"object","required":["did","messageId","convoId"],"properties":{"did":{"type":"string","format":"did"},"convoId":{"type":"string"},"messageId":{"type":"string"}}}'
]

{ #category : #serialization }
ChatBskyConvoDefsMessageRef class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ]);
		atpConvoId: (aRequest at: 'convoId' ifAbsent: [ nil ]);
		atpMessageId: (aRequest at: 'messageId' ifAbsent: [ nil ])
]

{ #category : #accessing }
ChatBskyConvoDefsMessageRef >> atpConvoId [
	<atpType:#String format:nil>
	^ atpConvoId
]

{ #category : #accessing }
ChatBskyConvoDefsMessageRef >> atpConvoId: anObject [
	atpConvoId := anObject
]

{ #category : #accessing }
ChatBskyConvoDefsMessageRef >> atpDid [
	<atpType:#String format:'did'>
	^ atpDid
]

{ #category : #accessing }
ChatBskyConvoDefsMessageRef >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #accessing }
ChatBskyConvoDefsMessageRef >> atpMessageId [
	<atpType:#String format:nil>
	^ atpMessageId
]

{ #category : #accessing }
ChatBskyConvoDefsMessageRef >> atpMessageId: anObject [
	atpMessageId := anObject
]

{ #category : #magritte }
ChatBskyConvoDefsMessageRef >> convoIdDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'ConvoId';
		accessor: #atpConvoId;
		beRequired
]

{ #category : #magritte }
ChatBskyConvoDefsMessageRef >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid;
		beRequired
]

{ #category : #magritte }
ChatBskyConvoDefsMessageRef >> messageIdDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'MessageId';
		accessor: #atpMessageId;
		beRequired
]
