Class {
	#name : #ChatBskyActorDefsProfileViewBasic,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpDid',
		'atpHandle',
		'atpDisplayName',
		'atpAvatar',
		'atpAssociated',
		'atpViewer',
		'atpLabels',
		'atpChatDisabled'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ChatBskyActorDefsProfileViewBasic class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ChatBskyActorDefsProfileViewBasic class >> atpFile [
 ^ 'chat/bsky/actor/defs.json'
]

{ #category : #accessing }
ChatBskyActorDefsProfileViewBasic class >> atpRecordName [
 ^ 'chat.bsky.actor.defs#profileViewBasic'
]

{ #category : #accessing }
ChatBskyActorDefsProfileViewBasic class >> atpSchema [
 ^ '{"type":"object","required":["did","handle"],"properties":{"did":{"type":"string","format":"did"},"handle":{"type":"string","format":"handle"},"displayName":{"type":"string","maxGraphemes":64,"maxLength":640},"avatar":{"type":"string","format":"uri"},"associated":{"type":"ref","ref":"app.bsky.actor.defs#profileAssociated"},"viewer":{"type":"ref","ref":"app.bsky.actor.defs#viewerState"},"labels":{"type":"array","items":{"type":"ref","ref":"com.atproto.label.defs#label"}},"chatDisabled":{"type":"boolean","description":"Set to true when the actor cannot actively participate in converations"}}}'
]

{ #category : #serialization }
ChatBskyActorDefsProfileViewBasic class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ]);
		atpHandle: (aRequest at: 'handle' ifAbsent: [ nil ]);
		atpDisplayName: (aRequest at: 'displayName' ifAbsent: [ nil ]);
		atpAvatar: (aRequest at: 'avatar' ifAbsent: [ nil ]);
		atpAssociated: (aRequest
				at: 'associated'
				ifPresent: [ :aValue | AppBskyActorDefsProfileAssociated fromRequest: aValue withClient: aClient ]
				ifAbsent: [ nil ]);
		atpViewer: (aRequest
				at: 'viewer'
				ifPresent: [ :aValue | AppBskyActorDefsViewerState fromRequest: aValue withClient: aClient ]
				ifAbsent: [ nil ]);
		atpLabels: (aRequest
				at: 'labels'
				ifPresent: [ :anArray | 
					anArray
						collect: [ :aValue | ComAtprotoLabelDefsLabel fromRequest: aValue withClient: aClient ] ]
				ifAbsent: [ nil ]);
		atpChatDisabled: (aRequest at: 'chatDisabled' ifAbsent: [ nil ])
]

{ #category : #magritte }
ChatBskyActorDefsProfileViewBasic >> associatedDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Associated';
		accessor: #atpAssociated
]

{ #category : #accessing }
ChatBskyActorDefsProfileViewBasic >> atpAssociated [
	<referenceTo:'app.bsky.actor.defs#profileAssociated'>
	<atpType:#AppBskyActorDefsProfileAssociated format:nil>
	^ atpAssociated
]

{ #category : #accessing }
ChatBskyActorDefsProfileViewBasic >> atpAssociated: anObject [
	<referenceTo:'app.bsky.actor.defs#profileAssociated'>
	atpAssociated := anObject
]

{ #category : #accessing }
ChatBskyActorDefsProfileViewBasic >> atpAvatar [
	<atpType:#String format:'uri'>
	^ atpAvatar
]

{ #category : #accessing }
ChatBskyActorDefsProfileViewBasic >> atpAvatar: anObject [
	atpAvatar := anObject
]

{ #category : #accessing }
ChatBskyActorDefsProfileViewBasic >> atpChatDisabled [
	<atpType:#Boolean format:nil>
	^ atpChatDisabled
]

{ #category : #accessing }
ChatBskyActorDefsProfileViewBasic >> atpChatDisabled: anObject [
	atpChatDisabled := anObject
]

{ #category : #accessing }
ChatBskyActorDefsProfileViewBasic >> atpDid [
	<atpType:#String format:'did'>
	^ atpDid
]

{ #category : #accessing }
ChatBskyActorDefsProfileViewBasic >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #accessing }
ChatBskyActorDefsProfileViewBasic >> atpDisplayName [
	<atpType:#String format:nil>
	^ atpDisplayName
]

{ #category : #accessing }
ChatBskyActorDefsProfileViewBasic >> atpDisplayName: anObject [
	atpDisplayName := anObject
]

{ #category : #accessing }
ChatBskyActorDefsProfileViewBasic >> atpHandle [
	<atpType:#String format:'handle'>
	^ atpHandle
]

{ #category : #accessing }
ChatBskyActorDefsProfileViewBasic >> atpHandle: anObject [
	atpHandle := anObject
]

{ #category : #accessing }
ChatBskyActorDefsProfileViewBasic >> atpLabels [
	<atpType:#ComAtprotoLabelDefsLabel format:nil>
	<atpCollection>
	^ atpLabels
]

{ #category : #accessing }
ChatBskyActorDefsProfileViewBasic >> atpLabels: anObject [
	atpLabels := anObject
]

{ #category : #accessing }
ChatBskyActorDefsProfileViewBasic >> atpViewer [
	<referenceTo:'app.bsky.actor.defs#viewerState'>
	<atpType:#AppBskyActorDefsViewerState format:nil>
	^ atpViewer
]

{ #category : #accessing }
ChatBskyActorDefsProfileViewBasic >> atpViewer: anObject [
	<referenceTo:'app.bsky.actor.defs#viewerState'>
	atpViewer := anObject
]

{ #category : #magritte }
ChatBskyActorDefsProfileViewBasic >> avatarDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Avatar';
		accessor: #atpAvatar
]

{ #category : #magritte }
ChatBskyActorDefsProfileViewBasic >> chatDisabledDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'ChatDisabled';
		accessor: #atpChatDisabled
]

{ #category : #magritte }
ChatBskyActorDefsProfileViewBasic >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid;
		beRequired
]

{ #category : #magritte }
ChatBskyActorDefsProfileViewBasic >> displayNameDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'DisplayName';
		accessor: #atpDisplayName
]

{ #category : #magritte }
ChatBskyActorDefsProfileViewBasic >> handleDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Handle';
		accessor: #atpHandle;
		beRequired
]

{ #category : #magritte }
ChatBskyActorDefsProfileViewBasic >> labelsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoLabelDefsLabel};
		label: 'Labels';
		accessor: #atpLabels
]

{ #category : #magritte }
ChatBskyActorDefsProfileViewBasic >> viewerDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Viewer';
		accessor: #atpViewer
]
