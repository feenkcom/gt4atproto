Class {
	#name : #ChatBskyConvoDefsDeletedMessageView,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpId',
		'atpRev',
		'atpSender',
		'atpSentAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ChatBskyConvoDefsDeletedMessageView class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ChatBskyConvoDefsDeletedMessageView class >> atpFile [
 ^ 'chat/bsky/convo/defs.json'
]

{ #category : #accessing }
ChatBskyConvoDefsDeletedMessageView class >> atpRecordName [
 ^ 'chat.bsky.convo.defs#deletedMessageView'
]

{ #category : #accessing }
ChatBskyConvoDefsDeletedMessageView class >> atpSchema [
 ^ '{"type":"object","required":["id","rev","sender","sentAt"],"properties":{"id":{"type":"string"},"rev":{"type":"string"},"sender":{"type":"ref","ref":"#messageViewSender"},"sentAt":{"type":"string","format":"datetime"}}}'
]

{ #category : #serialization }
ChatBskyConvoDefsDeletedMessageView class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpId: (aRequest at: 'id' ifAbsent: [ nil ]);
		atpRev: (aRequest at: 'rev' ifAbsent: [ nil ]);
		atpSender: (aRequest
				at: 'sender'
				ifPresent: [ :aValue | ChatBskyConvoDefsMessageViewSender fromRequest: aValue withClient: aClient ]
				ifAbsent: [ nil ]);
		atpSentAt: (aRequest at: 'sentAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
ChatBskyConvoDefsDeletedMessageView >> atpId [
	<atpType:#String format:nil>
	^ atpId
]

{ #category : #accessing }
ChatBskyConvoDefsDeletedMessageView >> atpId: anObject [
	atpId := anObject
]

{ #category : #accessing }
ChatBskyConvoDefsDeletedMessageView >> atpRev [
	<atpType:#String format:nil>
	^ atpRev
]

{ #category : #accessing }
ChatBskyConvoDefsDeletedMessageView >> atpRev: anObject [
	atpRev := anObject
]

{ #category : #accessing }
ChatBskyConvoDefsDeletedMessageView >> atpSender [
	<referenceTo:'#messageViewSender'>
	<atpType:#ChatBskyConvoDefsMessageViewSender format:nil>
	^ atpSender
]

{ #category : #accessing }
ChatBskyConvoDefsDeletedMessageView >> atpSender: anObject [
	<referenceTo:'#messageViewSender'>
	atpSender := anObject
]

{ #category : #accessing }
ChatBskyConvoDefsDeletedMessageView >> atpSentAt [
	<atpType:#String format:'datetime'>
	^ atpSentAt
]

{ #category : #accessing }
ChatBskyConvoDefsDeletedMessageView >> atpSentAt: anObject [
	atpSentAt := anObject
]

{ #category : #magritte }
ChatBskyConvoDefsDeletedMessageView >> idDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Id';
		accessor: #atpId;
		beRequired
]

{ #category : #magritte }
ChatBskyConvoDefsDeletedMessageView >> revDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Rev';
		accessor: #atpRev;
		beRequired
]

{ #category : #magritte }
ChatBskyConvoDefsDeletedMessageView >> senderDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Sender';
		accessor: #atpSender;
		beRequired
]

{ #category : #magritte }
ChatBskyConvoDefsDeletedMessageView >> sentAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'SentAt';
		accessor: #atpSentAt;
		beRequired
]
