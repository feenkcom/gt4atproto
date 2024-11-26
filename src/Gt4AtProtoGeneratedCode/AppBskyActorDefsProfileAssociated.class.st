Class {
	#name : #AppBskyActorDefsProfileAssociated,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpLists',
		'atpFeedgens',
		'atpStarterPacks',
		'atpLabeler',
		'atpChat'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyActorDefsProfileAssociated class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyActorDefsProfileAssociated class >> atpFile [
 ^ 'app/bsky/actor/defs.json'
]

{ #category : #accessing }
AppBskyActorDefsProfileAssociated class >> atpRecordName [
 ^ 'app.bsky.actor.defs#profileAssociated'
]

{ #category : #accessing }
AppBskyActorDefsProfileAssociated class >> atpSchema [
 ^ '{"type":"object","properties":{"lists":{"type":"integer"},"feedgens":{"type":"integer"},"starterPacks":{"type":"integer"},"labeler":{"type":"boolean"},"chat":{"type":"ref","ref":"#profileAssociatedChat"}}}'
]

{ #category : #serialization }
AppBskyActorDefsProfileAssociated class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpLists: (aRequest at: 'lists' ifAbsent: [ nil ]);
		atpFeedgens: (aRequest at: 'feedgens' ifAbsent: [ nil ]);
		atpStarterPacks: (aRequest at: 'starterPacks' ifAbsent: [ nil ]);
		atpLabeler: (aRequest at: 'labeler' ifAbsent: [ nil ]);
		atpChat: (aRequest
				at: 'chat'
				ifPresent: [ :aValue | AppBskyActorDefsProfileAssociatedChat fromRequest: aValue withClient: aClient ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyActorDefsProfileAssociated >> atpChat [
	<referenceTo:'#profileAssociatedChat'>
	<atpType:#AppBskyActorDefsProfileAssociatedChat format:nil>
	^ atpChat
]

{ #category : #accessing }
AppBskyActorDefsProfileAssociated >> atpChat: anObject [
	<referenceTo:'#profileAssociatedChat'>
	atpChat := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileAssociated >> atpFeedgens [
	<atpType:#Number format:nil>
	^ atpFeedgens
]

{ #category : #accessing }
AppBskyActorDefsProfileAssociated >> atpFeedgens: anObject [
	atpFeedgens := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileAssociated >> atpLabeler [
	<atpType:#Boolean format:nil>
	^ atpLabeler
]

{ #category : #accessing }
AppBskyActorDefsProfileAssociated >> atpLabeler: anObject [
	atpLabeler := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileAssociated >> atpLists [
	<atpType:#Number format:nil>
	^ atpLists
]

{ #category : #accessing }
AppBskyActorDefsProfileAssociated >> atpLists: anObject [
	atpLists := anObject
]

{ #category : #accessing }
AppBskyActorDefsProfileAssociated >> atpStarterPacks [
	<atpType:#Number format:nil>
	^ atpStarterPacks
]

{ #category : #accessing }
AppBskyActorDefsProfileAssociated >> atpStarterPacks: anObject [
	atpStarterPacks := anObject
]

{ #category : #magritte }
AppBskyActorDefsProfileAssociated >> chatDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Chat';
		accessor: #atpChat
]

{ #category : #magritte }
AppBskyActorDefsProfileAssociated >> feedgensDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Feedgens';
		accessor: #atpFeedgens
]

{ #category : #magritte }
AppBskyActorDefsProfileAssociated >> labelerDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Labeler';
		accessor: #atpLabeler
]

{ #category : #magritte }
AppBskyActorDefsProfileAssociated >> listsDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Lists';
		accessor: #atpLists
]

{ #category : #magritte }
AppBskyActorDefsProfileAssociated >> starterPacksDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'StarterPacks';
		accessor: #atpStarterPacks
]
