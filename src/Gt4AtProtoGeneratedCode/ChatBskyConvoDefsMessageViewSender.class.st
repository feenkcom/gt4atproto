Class {
	#name : #ChatBskyConvoDefsMessageViewSender,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpDid'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ChatBskyConvoDefsMessageViewSender class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ChatBskyConvoDefsMessageViewSender class >> atpFile [
 ^ 'chat/bsky/convo/defs.json'
]

{ #category : #accessing }
ChatBskyConvoDefsMessageViewSender class >> atpRecordName [
 ^ 'chat.bsky.convo.defs#messageViewSender'
]

{ #category : #accessing }
ChatBskyConvoDefsMessageViewSender class >> atpSchema [
 ^ '{"type":"object","required":["did"],"properties":{"did":{"type":"string","format":"did"}}}'
]

{ #category : #serialization }
ChatBskyConvoDefsMessageViewSender class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ])
]

{ #category : #accessing }
ChatBskyConvoDefsMessageViewSender >> atpDid [
	<atpType:#String format:'did'>
	^ atpDid
]

{ #category : #accessing }
ChatBskyConvoDefsMessageViewSender >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #magritte }
ChatBskyConvoDefsMessageViewSender >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid;
		beRequired
]
