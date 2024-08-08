Class {
	#name : #ChatBskyConvoDefsLogDeleteMessage,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpRev',
		'atpConvoId',
		'atpMessage'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ChatBskyConvoDefsLogDeleteMessage class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ChatBskyConvoDefsLogDeleteMessage class >> atpFile [
 ^ 'chat/bsky/convo/defs.json'
]

{ #category : #accessing }
ChatBskyConvoDefsLogDeleteMessage class >> atpRecordName [
 ^ 'chat.bsky.convo.defs#logDeleteMessage'
]

{ #category : #accessing }
ChatBskyConvoDefsLogDeleteMessage class >> atpSchema [
 ^ '{"type":"object","required":["rev","convoId","message"],"properties":{"rev":{"type":"string"},"convoId":{"type":"string"},"message":{"type":"union","refs":["#messageView","#deletedMessageView"]}}}'
]

{ #category : #serialization }
ChatBskyConvoDefsLogDeleteMessage class >> fromRequest: aRequest [
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
ChatBskyConvoDefsLogDeleteMessage >> atpConvoId [
	<atpType:#String format:nil>
	^ atpConvoId
]

{ #category : #accessing }
ChatBskyConvoDefsLogDeleteMessage >> atpConvoId: anObject [
	atpConvoId := anObject
]

{ #category : #accessing }
ChatBskyConvoDefsLogDeleteMessage >> atpMessage [
	<atpType:#(ChatBskyConvoDefsMessageView ChatBskyConvoDefsDeletedMessageView) format:nil>
	^ atpMessage
]

{ #category : #accessing }
ChatBskyConvoDefsLogDeleteMessage >> atpMessage: anObject [
	atpMessage := anObject
]

{ #category : #accessing }
ChatBskyConvoDefsLogDeleteMessage >> atpRev [
	<atpType:#String format:nil>
	^ atpRev
]

{ #category : #accessing }
ChatBskyConvoDefsLogDeleteMessage >> atpRev: anObject [
	atpRev := anObject
]

{ #category : #magritte }
ChatBskyConvoDefsLogDeleteMessage >> convoIdDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'ConvoId';
		accessor: #atpConvoId;
		beRequired
]

{ #category : #magritte }
ChatBskyConvoDefsLogDeleteMessage >> messageDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'#messageView'.
				'#deletedMessageView'};
		label: 'Message';
		accessor: #atpMessage;
		beRequired
]

{ #category : #magritte }
ChatBskyConvoDefsLogDeleteMessage >> revDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Rev';
		accessor: #atpRev;
		beRequired
]
