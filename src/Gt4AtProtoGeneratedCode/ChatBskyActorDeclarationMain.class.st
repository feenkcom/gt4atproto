Class {
	#name : #ChatBskyActorDeclarationMain,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpAllowIncoming'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ChatBskyActorDeclarationMain class >> atpDescription [
 ^  'A declaration of a Bluesky chat account.'
]

{ #category : #accessing }
ChatBskyActorDeclarationMain class >> atpFile [
 ^ 'chat/bsky/actor/declaration.json'
]

{ #category : #accessing }
ChatBskyActorDeclarationMain class >> atpRecordName [
 ^ 'chat.bsky.actor.declaration'
]

{ #category : #accessing }
ChatBskyActorDeclarationMain class >> atpSchema [
 ^ '{"type":"record","description":"A declaration of a Bluesky chat account.","key":"literal:self","record":{"type":"object","required":["allowIncoming"],"properties":{"allowIncoming":{"type":"string","knownValues":["all","none","following"]}}}}'
]

{ #category : #serialization }
ChatBskyActorDeclarationMain class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpAllowIncoming: (aRequest at: 'allowIncoming' ifAbsent: [ nil ])
]

{ #category : #magritte }
ChatBskyActorDeclarationMain >> allowIncomingDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'AllowIncoming';
		accessor: #atpAllowIncoming;
		beRequired
]

{ #category : #accessing }
ChatBskyActorDeclarationMain >> atpAllowIncoming [
	<atpType:#String format:nil>
	^ atpAllowIncoming
]

{ #category : #accessing }
ChatBskyActorDeclarationMain >> atpAllowIncoming: anObject [
	atpAllowIncoming := anObject
]
