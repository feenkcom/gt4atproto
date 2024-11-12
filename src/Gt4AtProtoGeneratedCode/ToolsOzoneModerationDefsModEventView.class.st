Class {
	#name : #ToolsOzoneModerationDefsModEventView,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpId',
		'atpEvent',
		'atpSubject',
		'atpSubjectBlobCids',
		'atpCreatedBy',
		'atpCreatedAt',
		'atpCreatorHandle',
		'atpSubjectHandle'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsModEventView class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventView class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventView class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#modEventView'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventView class >> atpSchema [
 ^ '{"type":"object","required":["id","event","subject","subjectBlobCids","createdBy","createdAt"],"properties":{"id":{"type":"integer"},"event":{"type":"union","refs":["#modEventTakedown","#modEventReverseTakedown","#modEventComment","#modEventReport","#modEventLabel","#modEventAcknowledge","#modEventEscalate","#modEventMute","#modEventUnmute","#modEventMuteReporter","#modEventUnmuteReporter","#modEventEmail","#modEventResolveAppeal","#modEventDivert","#modEventTag","#accountEvent","#identityEvent","#recordEvent"]},"subject":{"type":"union","refs":["com.atproto.admin.defs#repoRef","com.atproto.repo.strongRef","chat.bsky.convo.defs#messageRef"]},"subjectBlobCids":{"type":"array","items":{"type":"string"}},"createdBy":{"type":"string","format":"did"},"createdAt":{"type":"string","format":"datetime"},"creatorHandle":{"type":"string"},"subjectHandle":{"type":"string"}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsModEventView class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpId: (aRequest at: 'id' ifAbsent: [ nil ]);
		atpEvent: (aRequest
				at: 'event'
				ifPresent: [ :aValue | 
					({'tools.ozone.moderation.defs#modEventTakedown'
							-> ToolsOzoneModerationDefsModEventTakedown.
						'tools.ozone.moderation.defs#modEventReverseTakedown'
							-> ToolsOzoneModerationDefsModEventReverseTakedown.
						'tools.ozone.moderation.defs#modEventComment'
							-> ToolsOzoneModerationDefsModEventComment.
						'tools.ozone.moderation.defs#modEventReport'
							-> ToolsOzoneModerationDefsModEventReport.
						'tools.ozone.moderation.defs#modEventLabel'
							-> ToolsOzoneModerationDefsModEventLabel.
						'tools.ozone.moderation.defs#modEventAcknowledge'
							-> ToolsOzoneModerationDefsModEventAcknowledge.
						'tools.ozone.moderation.defs#modEventEscalate'
							-> ToolsOzoneModerationDefsModEventEscalate.
						'tools.ozone.moderation.defs#modEventMute'
							-> ToolsOzoneModerationDefsModEventMute.
						'tools.ozone.moderation.defs#modEventUnmute'
							-> ToolsOzoneModerationDefsModEventUnmute.
						'tools.ozone.moderation.defs#modEventMuteReporter'
							-> ToolsOzoneModerationDefsModEventMuteReporter.
						'tools.ozone.moderation.defs#modEventUnmuteReporter'
							-> ToolsOzoneModerationDefsModEventUnmuteReporter.
						'tools.ozone.moderation.defs#modEventEmail'
							-> ToolsOzoneModerationDefsModEventEmail.
						'tools.ozone.moderation.defs#modEventResolveAppeal'
							-> ToolsOzoneModerationDefsModEventResolveAppeal.
						'tools.ozone.moderation.defs#modEventDivert'
							-> ToolsOzoneModerationDefsModEventDivert.
						'tools.ozone.moderation.defs#modEventTag'
							-> ToolsOzoneModerationDefsModEventTag.
						'tools.ozone.moderation.defs#accountEvent'
							-> ToolsOzoneModerationDefsAccountEvent.
						'tools.ozone.moderation.defs#identityEvent'
							-> ToolsOzoneModerationDefsIdentityEvent.
						'tools.ozone.moderation.defs#recordEvent'
							-> ToolsOzoneModerationDefsRecordEvent} asDictionary
						at: (aValue at: '$type')
						ifAbsent: [ GtApUnknownRecord new key: (aValue at: '$type') ])
						fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpSubject: (aRequest
				at: 'subject'
				ifPresent: [ :aValue | 
					({'com.atproto.admin.defs#repoRef' -> ComAtprotoAdminDefsRepoRef.
						'com.atproto.repo.strongRef' -> ComAtprotoRepoStrongRefMain.
						'chat.bsky.convo.defs#messageRef' -> ChatBskyConvoDefsMessageRef}
						asDictionary
						at: (aValue at: '$type')
						ifAbsent: [ GtApUnknownRecord new key: (aValue at: '$type') ])
						fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpSubjectBlobCids: (aRequest
				at: 'subjectBlobCids'
				ifPresent: [ :anArray | anArray collect: [ :aValue | aValue ] ]
				ifAbsent: [ nil ]);
		atpCreatedBy: (aRequest at: 'createdBy' ifAbsent: [ nil ]);
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ]);
		atpCreatorHandle: (aRequest at: 'creatorHandle' ifAbsent: [ nil ]);
		atpSubjectHandle: (aRequest at: 'subjectHandle' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventView >> atpCreatedAt [
	<atpType:#String format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventView >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventView >> atpCreatedBy [
	<atpType:#String format:'did'>
	^ atpCreatedBy
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventView >> atpCreatedBy: anObject [
	atpCreatedBy := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventView >> atpCreatorHandle [
	<atpType:#String format:nil>
	^ atpCreatorHandle
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventView >> atpCreatorHandle: anObject [
	atpCreatorHandle := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventView >> atpEvent [
	<atpType:#(ToolsOzoneModerationDefsModEventTakedown ToolsOzoneModerationDefsModEventReverseTakedown ToolsOzoneModerationDefsModEventComment ToolsOzoneModerationDefsModEventReport ToolsOzoneModerationDefsModEventLabel ToolsOzoneModerationDefsModEventAcknowledge ToolsOzoneModerationDefsModEventEscalate ToolsOzoneModerationDefsModEventMute ToolsOzoneModerationDefsModEventUnmute ToolsOzoneModerationDefsModEventMuteReporter ToolsOzoneModerationDefsModEventUnmuteReporter ToolsOzoneModerationDefsModEventEmail ToolsOzoneModerationDefsModEventResolveAppeal ToolsOzoneModerationDefsModEventDivert ToolsOzoneModerationDefsModEventTag ToolsOzoneModerationDefsAccountEvent ToolsOzoneModerationDefsIdentityEvent ToolsOzoneModerationDefsRecordEvent) format:nil>
	^ atpEvent
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventView >> atpEvent: anObject [
	atpEvent := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventView >> atpId [
	<atpType:#Number format:nil>
	^ atpId
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventView >> atpId: anObject [
	atpId := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventView >> atpSubject [
	<atpType:#(ComAtprotoAdminDefsRepoRef ComAtprotoRepoStrongRefMain ChatBskyConvoDefsMessageRef) format:nil>
	^ atpSubject
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventView >> atpSubject: anObject [
	atpSubject := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventView >> atpSubjectBlobCids [
	<atpType:#String format:nil>
	<atpCollection>
	^ atpSubjectBlobCids
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventView >> atpSubjectBlobCids: anObject [
	atpSubjectBlobCids := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventView >> atpSubjectHandle [
	<atpType:#String format:nil>
	^ atpSubjectHandle
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventView >> atpSubjectHandle: anObject [
	atpSubjectHandle := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventView >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventView >> createdByDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedBy';
		accessor: #atpCreatedBy;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventView >> creatorHandleDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatorHandle';
		accessor: #atpCreatorHandle
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventView >> eventDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'#modEventTakedown'.
				'#modEventReverseTakedown'.
				'#modEventComment'.
				'#modEventReport'.
				'#modEventLabel'.
				'#modEventAcknowledge'.
				'#modEventEscalate'.
				'#modEventMute'.
				'#modEventUnmute'.
				'#modEventMuteReporter'.
				'#modEventUnmuteReporter'.
				'#modEventEmail'.
				'#modEventResolveAppeal'.
				'#modEventDivert'.
				'#modEventTag'.
				'#accountEvent'.
				'#identityEvent'.
				'#recordEvent'};
		label: 'Event';
		accessor: #atpEvent;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventView >> idDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Id';
		accessor: #atpId;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventView >> subjectBlobCidsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'SubjectBlobCids';
		accessor: #atpSubjectBlobCids;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventView >> subjectDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'com.atproto.admin.defs#repoRef'.
				'com.atproto.repo.strongRef'.
				'chat.bsky.convo.defs#messageRef'};
		label: 'Subject';
		accessor: #atpSubject;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventView >> subjectHandleDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'SubjectHandle';
		accessor: #atpSubjectHandle
]
