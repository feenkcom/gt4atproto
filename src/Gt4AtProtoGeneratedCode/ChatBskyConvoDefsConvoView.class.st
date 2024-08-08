Class {
	#name : #ChatBskyConvoDefsConvoView,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpId',
		'atpRev',
		'atpMembers',
		'atpLastMessage',
		'atpMuted',
		'atpUnreadCount'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ChatBskyConvoDefsConvoView class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ChatBskyConvoDefsConvoView class >> atpFile [
 ^ 'chat/bsky/convo/defs.json'
]

{ #category : #accessing }
ChatBskyConvoDefsConvoView class >> atpRecordName [
 ^ 'chat.bsky.convo.defs#convoView'
]

{ #category : #accessing }
ChatBskyConvoDefsConvoView class >> atpSchema [
 ^ '{"type":"object","required":["id","rev","members","muted","unreadCount"],"properties":{"id":{"type":"string"},"rev":{"type":"string"},"members":{"type":"array","items":{"type":"ref","ref":"chat.bsky.actor.defs#profileViewBasic"}},"lastMessage":{"type":"union","refs":["#messageView","#deletedMessageView"]},"muted":{"type":"boolean"},"unreadCount":{"type":"integer"}}}'
]

{ #category : #serialization }
ChatBskyConvoDefsConvoView class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpId: (aRequest at: 'id' ifAbsent: [ nil ]);
		atpRev: (aRequest at: 'rev' ifAbsent: [ nil ]);
		atpMembers: (aRequest
				at: 'members'
				ifPresent: [ :anArray | 
					anArray
						collect: [ :aValue | ChatBskyActorDefsProfileViewBasic fromRequest: aValue ] ]
				ifAbsent: [ nil ]);
		atpLastMessage: (aRequest
				at: 'lastMessage'
				ifPresent: [ :aValue | 
					({'chat.bsky.convo.defs#messageView' -> ChatBskyConvoDefsMessageView.
						'chat.bsky.convo.defs#deletedMessageView'
							-> ChatBskyConvoDefsDeletedMessageView} asDictionary
						at: (aValue at: '$type')
						ifAbsent: [ GtApUnknownRecord new key: (aValue at: '$type') ])
						fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpMuted: (aRequest at: 'muted' ifAbsent: [ nil ]);
		atpUnreadCount: (aRequest at: 'unreadCount' ifAbsent: [ nil ])
]

{ #category : #accessing }
ChatBskyConvoDefsConvoView >> atpId [
	<atpType:#String format:nil>
	^ atpId
]

{ #category : #accessing }
ChatBskyConvoDefsConvoView >> atpId: anObject [
	atpId := anObject
]

{ #category : #accessing }
ChatBskyConvoDefsConvoView >> atpLastMessage [
	<atpType:#(ChatBskyConvoDefsMessageView ChatBskyConvoDefsDeletedMessageView) format:nil>
	^ atpLastMessage
]

{ #category : #accessing }
ChatBskyConvoDefsConvoView >> atpLastMessage: anObject [
	atpLastMessage := anObject
]

{ #category : #accessing }
ChatBskyConvoDefsConvoView >> atpMembers [
	<atpType:#ChatBskyActorDefsProfileViewBasic format:nil>
	<atpCollection>
	^ atpMembers
]

{ #category : #accessing }
ChatBskyConvoDefsConvoView >> atpMembers: anObject [
	atpMembers := anObject
]

{ #category : #accessing }
ChatBskyConvoDefsConvoView >> atpMuted [
	<atpType:#Boolean format:nil>
	^ atpMuted
]

{ #category : #accessing }
ChatBskyConvoDefsConvoView >> atpMuted: anObject [
	atpMuted := anObject
]

{ #category : #accessing }
ChatBskyConvoDefsConvoView >> atpRev [
	<atpType:#String format:nil>
	^ atpRev
]

{ #category : #accessing }
ChatBskyConvoDefsConvoView >> atpRev: anObject [
	atpRev := anObject
]

{ #category : #accessing }
ChatBskyConvoDefsConvoView >> atpUnreadCount [
	<atpType:#Number format:nil>
	^ atpUnreadCount
]

{ #category : #accessing }
ChatBskyConvoDefsConvoView >> atpUnreadCount: anObject [
	atpUnreadCount := anObject
]

{ #category : #magritte }
ChatBskyConvoDefsConvoView >> idDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Id';
		accessor: #atpId;
		beRequired
]

{ #category : #magritte }
ChatBskyConvoDefsConvoView >> lastMessageDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'#messageView'.
				'#deletedMessageView'};
		label: 'LastMessage';
		accessor: #atpLastMessage
]

{ #category : #magritte }
ChatBskyConvoDefsConvoView >> membersDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ChatBskyActorDefsProfileViewBasic};
		label: 'Members';
		accessor: #atpMembers;
		beRequired
]

{ #category : #magritte }
ChatBskyConvoDefsConvoView >> mutedDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Muted';
		accessor: #atpMuted;
		beRequired
]

{ #category : #magritte }
ChatBskyConvoDefsConvoView >> revDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Rev';
		accessor: #atpRev;
		beRequired
]

{ #category : #magritte }
ChatBskyConvoDefsConvoView >> unreadCountDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'UnreadCount';
		accessor: #atpUnreadCount;
		beRequired
]
