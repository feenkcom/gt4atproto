Class {
	#name : #ChatBskyConvoDefsLogCreateMessage,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpRev',
		'atpConvoId',
		'atpMessage'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ChatBskyConvoDefsLogCreateMessage class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ChatBskyConvoDefsLogCreateMessage class >> atpFile [
 ^ 'chat/bsky/convo/defs.json'
]

{ #category : #accessing }
ChatBskyConvoDefsLogCreateMessage class >> atpRecordName [
 ^ 'chat.bsky.convo.defs#logCreateMessage'
]

{ #category : #accessing }
ChatBskyConvoDefsLogCreateMessage class >> atpSchema [
 ^ '{"type":"object","required":["rev","convoId","message"],"properties":{"rev":{"type":"string"},"convoId":{"type":"string"},"message":{"type":"union","refs":["#messageView","#deletedMessageView"]}}}'
]

{ #category : #serialization }
ChatBskyConvoDefsLogCreateMessage class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpRev: (aRequest at: 'rev' ifAbsent: [ nil ]);
		atpConvoId: (aRequest at: 'convoId' ifAbsent: [ nil ]);
		atpMessage: (aRequest
				at: 'message'
				ifPresent: [ :aValue | 
					({'chat.bsky.convo.defs#messageView' -> ChatBskyConvoDefsMessageView.
						'chat.bsky.convo.defs#deletedMessageView'
							-> ChatBskyConvoDefsDeletedMessageView} asDictionary
						at: (aValue at: '$type')
						ifAbsent: [ GtApUnknownRecord new key: (aValue at: '$type') ])
						fromRequest: aValue ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
ChatBskyConvoDefsLogCreateMessage >> atpConvoId [
	<atpType:#String format:nil>
	^ atpConvoId
]

{ #category : #accessing }
ChatBskyConvoDefsLogCreateMessage >> atpConvoId: anObject [
	atpConvoId := anObject
]

{ #category : #accessing }
ChatBskyConvoDefsLogCreateMessage >> atpMessage [
	<atpType:#(ChatBskyConvoDefsMessageView ChatBskyConvoDefsDeletedMessageView) format:nil>
	^ atpMessage
]

{ #category : #accessing }
ChatBskyConvoDefsLogCreateMessage >> atpMessage: anObject [
	atpMessage := anObject
]

{ #category : #accessing }
ChatBskyConvoDefsLogCreateMessage >> atpRev [
	<atpType:#String format:nil>
	^ atpRev
]

{ #category : #accessing }
ChatBskyConvoDefsLogCreateMessage >> atpRev: anObject [
	atpRev := anObject
]

{ #category : #magritte }
ChatBskyConvoDefsLogCreateMessage >> convoIdDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'ConvoId';
		accessor: #atpConvoId;
		beRequired
]

{ #category : #magritte }
ChatBskyConvoDefsLogCreateMessage >> messageDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'#messageView'.
				'#deletedMessageView'};
		label: 'Message';
		accessor: #atpMessage;
		beRequired
]

{ #category : #magritte }
ChatBskyConvoDefsLogCreateMessage >> revDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Rev';
		accessor: #atpRev;
		beRequired
]
