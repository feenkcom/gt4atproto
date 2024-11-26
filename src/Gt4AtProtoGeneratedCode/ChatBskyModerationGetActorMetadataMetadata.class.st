Class {
	#name : #ChatBskyModerationGetActorMetadataMetadata,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpMessagesSent',
		'atpMessagesReceived',
		'atpConvos',
		'atpConvosStarted'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ChatBskyModerationGetActorMetadataMetadata class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ChatBskyModerationGetActorMetadataMetadata class >> atpFile [
 ^ 'chat/bsky/moderation/getActorMetadata.json'
]

{ #category : #accessing }
ChatBskyModerationGetActorMetadataMetadata class >> atpRecordName [
 ^ 'chat.bsky.moderation.getActorMetadata#metadata'
]

{ #category : #accessing }
ChatBskyModerationGetActorMetadataMetadata class >> atpSchema [
 ^ '{"type":"object","required":["messagesSent","messagesReceived","convos","convosStarted"],"properties":{"messagesSent":{"type":"integer"},"messagesReceived":{"type":"integer"},"convos":{"type":"integer"},"convosStarted":{"type":"integer"}}}'
]

{ #category : #serialization }
ChatBskyModerationGetActorMetadataMetadata class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpMessagesSent: (aRequest at: 'messagesSent' ifAbsent: [ nil ]);
		atpMessagesReceived: (aRequest at: 'messagesReceived' ifAbsent: [ nil ]);
		atpConvos: (aRequest at: 'convos' ifAbsent: [ nil ]);
		atpConvosStarted: (aRequest at: 'convosStarted' ifAbsent: [ nil ])
]

{ #category : #accessing }
ChatBskyModerationGetActorMetadataMetadata >> atpConvos [
	<atpType:#Number format:nil>
	^ atpConvos
]

{ #category : #accessing }
ChatBskyModerationGetActorMetadataMetadata >> atpConvos: anObject [
	atpConvos := anObject
]

{ #category : #accessing }
ChatBskyModerationGetActorMetadataMetadata >> atpConvosStarted [
	<atpType:#Number format:nil>
	^ atpConvosStarted
]

{ #category : #accessing }
ChatBskyModerationGetActorMetadataMetadata >> atpConvosStarted: anObject [
	atpConvosStarted := anObject
]

{ #category : #accessing }
ChatBskyModerationGetActorMetadataMetadata >> atpMessagesReceived [
	<atpType:#Number format:nil>
	^ atpMessagesReceived
]

{ #category : #accessing }
ChatBskyModerationGetActorMetadataMetadata >> atpMessagesReceived: anObject [
	atpMessagesReceived := anObject
]

{ #category : #accessing }
ChatBskyModerationGetActorMetadataMetadata >> atpMessagesSent [
	<atpType:#Number format:nil>
	^ atpMessagesSent
]

{ #category : #accessing }
ChatBskyModerationGetActorMetadataMetadata >> atpMessagesSent: anObject [
	atpMessagesSent := anObject
]

{ #category : #magritte }
ChatBskyModerationGetActorMetadataMetadata >> convosDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Convos';
		accessor: #atpConvos;
		beRequired
]

{ #category : #magritte }
ChatBskyModerationGetActorMetadataMetadata >> convosStartedDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'ConvosStarted';
		accessor: #atpConvosStarted;
		beRequired
]

{ #category : #magritte }
ChatBskyModerationGetActorMetadataMetadata >> messagesReceivedDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'MessagesReceived';
		accessor: #atpMessagesReceived;
		beRequired
]

{ #category : #magritte }
ChatBskyModerationGetActorMetadataMetadata >> messagesSentDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'MessagesSent';
		accessor: #atpMessagesSent;
		beRequired
]
