Class {
	#name : #ToolsOzoneModerationDefsModEventViewDetail,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpId',
		'atpEvent',
		'atpSubject',
		'atpSubjectBlobs',
		'atpCreatedBy',
		'atpCreatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsModEventViewDetail class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventViewDetail class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventViewDetail class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#modEventViewDetail'
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventViewDetail class >> atpSchema [
 ^ '{"type":"object","required":["id","event","subject","subjectBlobs","createdBy","createdAt"],"properties":{"id":{"type":"integer"},"event":{"type":"union","refs":["#modEventTakedown","#modEventReverseTakedown","#modEventComment","#modEventReport","#modEventLabel","#modEventAcknowledge","#modEventEscalate","#modEventMute","#modEventUnmute","#modEventMuteReporter","#modEventUnmuteReporter","#modEventEmail","#modEventResolveAppeal","#modEventDivert","#modEventTag","#accountEvent","#identityEvent","#recordEvent"]},"subject":{"type":"union","refs":["#repoView","#repoViewNotFound","#recordView","#recordViewNotFound"]},"subjectBlobs":{"type":"array","items":{"type":"ref","ref":"#blobView"}},"createdBy":{"type":"string","format":"did"},"createdAt":{"type":"string","format":"datetime"}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsModEventViewDetail class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
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
						fromRequest: aValue
						withClient: aClient ]
				ifAbsent: [ nil ]);
		atpSubject: (aRequest
				at: 'subject'
				ifPresent: [ :aValue | 
					({'tools.ozone.moderation.defs#repoView' -> ToolsOzoneModerationDefsRepoView.
						'tools.ozone.moderation.defs#repoViewNotFound'
							-> ToolsOzoneModerationDefsRepoViewNotFound.
						'tools.ozone.moderation.defs#recordView'
							-> ToolsOzoneModerationDefsRecordView.
						'tools.ozone.moderation.defs#recordViewNotFound'
							-> ToolsOzoneModerationDefsRecordViewNotFound} asDictionary
						at: (aValue at: '$type')
						ifAbsent: [ GtApUnknownRecord new key: (aValue at: '$type') ])
						fromRequest: aValue
						withClient: aClient ]
				ifAbsent: [ nil ]);
		atpSubjectBlobs: (aRequest
				at: 'subjectBlobs'
				ifPresent: [ :anArray | 
					anArray
						collect: [ :aValue | ToolsOzoneModerationDefsBlobView fromRequest: aValue withClient: aClient ] ]
				ifAbsent: [ nil ]);
		atpCreatedBy: (aRequest at: 'createdBy' ifAbsent: [ nil ]);
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventViewDetail >> atpCreatedAt [
	<atpType:#String format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventViewDetail >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventViewDetail >> atpCreatedBy [
	<atpType:#String format:'did'>
	^ atpCreatedBy
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventViewDetail >> atpCreatedBy: anObject [
	atpCreatedBy := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventViewDetail >> atpEvent [
	<atpType:#(ToolsOzoneModerationDefsModEventTakedown ToolsOzoneModerationDefsModEventReverseTakedown ToolsOzoneModerationDefsModEventComment ToolsOzoneModerationDefsModEventReport ToolsOzoneModerationDefsModEventLabel ToolsOzoneModerationDefsModEventAcknowledge ToolsOzoneModerationDefsModEventEscalate ToolsOzoneModerationDefsModEventMute ToolsOzoneModerationDefsModEventUnmute ToolsOzoneModerationDefsModEventMuteReporter ToolsOzoneModerationDefsModEventUnmuteReporter ToolsOzoneModerationDefsModEventEmail ToolsOzoneModerationDefsModEventResolveAppeal ToolsOzoneModerationDefsModEventDivert ToolsOzoneModerationDefsModEventTag ToolsOzoneModerationDefsAccountEvent ToolsOzoneModerationDefsIdentityEvent ToolsOzoneModerationDefsRecordEvent) format:nil>
	^ atpEvent
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventViewDetail >> atpEvent: anObject [
	atpEvent := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventViewDetail >> atpId [
	<atpType:#Number format:nil>
	^ atpId
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventViewDetail >> atpId: anObject [
	atpId := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventViewDetail >> atpSubject [
	<atpType:#(ToolsOzoneModerationDefsRepoView ToolsOzoneModerationDefsRepoViewNotFound ToolsOzoneModerationDefsRecordView ToolsOzoneModerationDefsRecordViewNotFound) format:nil>
	^ atpSubject
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventViewDetail >> atpSubject: anObject [
	atpSubject := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventViewDetail >> atpSubjectBlobs [
	<atpType:#ToolsOzoneModerationDefsBlobView format:nil>
	<atpCollection>
	^ atpSubjectBlobs
]

{ #category : #accessing }
ToolsOzoneModerationDefsModEventViewDetail >> atpSubjectBlobs: anObject [
	atpSubjectBlobs := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventViewDetail >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventViewDetail >> createdByDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedBy';
		accessor: #atpCreatedBy;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventViewDetail >> eventDescription [
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
ToolsOzoneModerationDefsModEventViewDetail >> idDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Id';
		accessor: #atpId;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventViewDetail >> subjectBlobsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ToolsOzoneModerationDefsBlobView};
		label: 'SubjectBlobs';
		accessor: #atpSubjectBlobs;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsModEventViewDetail >> subjectDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'#repoView'.
				'#repoViewNotFound'.
				'#recordView'.
				'#recordViewNotFound'};
		label: 'Subject';
		accessor: #atpSubject;
		beRequired
]
