Class {
	#name : #ChatBskyConvoSendMessageBatchBatchItem,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpConvoId',
		'atpMessage'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ChatBskyConvoSendMessageBatchBatchItem class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ChatBskyConvoSendMessageBatchBatchItem class >> atpFile [
 ^ 'chat/bsky/convo/sendMessageBatch.json'
]

{ #category : #accessing }
ChatBskyConvoSendMessageBatchBatchItem class >> atpRecordName [
 ^ 'chat.bsky.convo.sendMessageBatch#batchItem'
]

{ #category : #accessing }
ChatBskyConvoSendMessageBatchBatchItem class >> atpSchema [
 ^ '{"type":"object","required":["convoId","message"],"properties":{"convoId":{"type":"string"},"message":{"type":"ref","ref":"chat.bsky.convo.defs#messageInput"}}}'
]

{ #category : #serialization }
ChatBskyConvoSendMessageBatchBatchItem class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpConvoId: (aRequest at: 'convoId' ifAbsent: [ nil ]);
		atpMessage: (aRequest
				at: 'message'
				ifPresent: [ :aValue | ChatBskyConvoDefsMessageInput fromRequest: aValue ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
ChatBskyConvoSendMessageBatchBatchItem >> atpConvoId [
	<atpType:#String format:nil>
	^ atpConvoId
]

{ #category : #accessing }
ChatBskyConvoSendMessageBatchBatchItem >> atpConvoId: anObject [
	atpConvoId := anObject
]

{ #category : #accessing }
ChatBskyConvoSendMessageBatchBatchItem >> atpMessage [
	<referenceTo:'chat.bsky.convo.defs#messageInput'>
	<atpType:#ChatBskyConvoDefsMessageInput format:nil>
	^ atpMessage
]

{ #category : #accessing }
ChatBskyConvoSendMessageBatchBatchItem >> atpMessage: anObject [
	<referenceTo:'chat.bsky.convo.defs#messageInput'>
	atpMessage := anObject
]

{ #category : #magritte }
ChatBskyConvoSendMessageBatchBatchItem >> convoIdDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'ConvoId';
		accessor: #atpConvoId;
		beRequired
]

{ #category : #magritte }
ChatBskyConvoSendMessageBatchBatchItem >> messageDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Message';
		accessor: #atpMessage;
		beRequired
]
