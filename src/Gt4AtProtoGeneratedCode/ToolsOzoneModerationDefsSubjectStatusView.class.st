Class {
	#name : #ToolsOzoneModerationDefsSubjectStatusView,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpId',
		'atpSubject',
		'atpHosting',
		'atpSubjectBlobCids',
		'atpSubjectRepoHandle',
		'atpUpdatedAt',
		'atpCreatedAt',
		'atpReviewState',
		'atpComment',
		'atpMuteUntil',
		'atpMuteReportingUntil',
		'atpLastReviewedBy',
		'atpLastReviewedAt',
		'atpLastReportedAt',
		'atpLastAppealedAt',
		'atpTakendown',
		'atpAppealed',
		'atpSuspendUntil',
		'atpTags'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView class >> atpFile [
 ^ 'tools/ozone/moderation/defs.json'
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView class >> atpRecordName [
 ^ 'tools.ozone.moderation.defs#subjectStatusView'
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView class >> atpSchema [
 ^ '{"type":"object","required":["id","subject","createdAt","updatedAt","reviewState"],"properties":{"id":{"type":"integer"},"subject":{"type":"union","refs":["com.atproto.admin.defs#repoRef","com.atproto.repo.strongRef"]},"hosting":{"type":"union","refs":["#accountHosting","#recordHosting"]},"subjectBlobCids":{"type":"array","items":{"type":"string","format":"cid"}},"subjectRepoHandle":{"type":"string"},"updatedAt":{"type":"string","format":"datetime","description":"Timestamp referencing when the last update was made to the moderation status of the subject"},"createdAt":{"type":"string","format":"datetime","description":"Timestamp referencing the first moderation status impacting event was emitted on the subject"},"reviewState":{"type":"ref","ref":"#subjectReviewState"},"comment":{"type":"string","description":"Sticky comment on the subject."},"muteUntil":{"type":"string","format":"datetime"},"muteReportingUntil":{"type":"string","format":"datetime"},"lastReviewedBy":{"type":"string","format":"did"},"lastReviewedAt":{"type":"string","format":"datetime"},"lastReportedAt":{"type":"string","format":"datetime"},"lastAppealedAt":{"type":"string","format":"datetime","description":"Timestamp referencing when the author of the subject appealed a moderation action"},"takendown":{"type":"boolean"},"appealed":{"type":"boolean","description":"True indicates that the a previously taken moderator action was appealed against, by the author of the content. False indicates last appeal was resolved by moderators."},"suspendUntil":{"type":"string","format":"datetime"},"tags":{"type":"array","items":{"type":"string"}}}}'
]

{ #category : #serialization }
ToolsOzoneModerationDefsSubjectStatusView class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpId: (aRequest at: 'id' ifAbsent: [ nil ]);
		atpSubject: (aRequest
				at: 'subject'
				ifPresent: [ :aValue | 
					({'com.atproto.admin.defs#repoRef' -> ComAtprotoAdminDefsRepoRef.
						'com.atproto.repo.strongRef' -> ComAtprotoRepoStrongRefMain} asDictionary
						at: (aValue at: '$type')
						ifAbsent: [ GtApUnknownRecord new key: (aValue at: '$type') ])
						fromRequest: aValue
						withClient: aClient ]
				ifAbsent: [ nil ]);
		atpHosting: (aRequest
				at: 'hosting'
				ifPresent: [ :aValue | 
					({'tools.ozone.moderation.defs#accountHosting'
							-> ToolsOzoneModerationDefsAccountHosting.
						'tools.ozone.moderation.defs#recordHosting'
							-> ToolsOzoneModerationDefsRecordHosting} asDictionary
						at: (aValue at: '$type')
						ifAbsent: [ GtApUnknownRecord new key: (aValue at: '$type') ])
						fromRequest: aValue
						withClient: aClient ]
				ifAbsent: [ nil ]);
		atpSubjectBlobCids: (aRequest
				at: 'subjectBlobCids'
				ifPresent: [ :anArray | anArray collect: [ :aValue | aValue ] ]
				ifAbsent: [ nil ]);
		atpSubjectRepoHandle: (aRequest at: 'subjectRepoHandle' ifAbsent: [ nil ]);
		atpUpdatedAt: (aRequest at: 'updatedAt' ifAbsent: [ nil ]);
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ]);
		atpReviewState: (aRequest at: 'reviewState' ifAbsent: [ nil ]);
		atpComment: (aRequest at: 'comment' ifAbsent: [ nil ]);
		atpMuteUntil: (aRequest at: 'muteUntil' ifAbsent: [ nil ]);
		atpMuteReportingUntil: (aRequest at: 'muteReportingUntil' ifAbsent: [ nil ]);
		atpLastReviewedBy: (aRequest at: 'lastReviewedBy' ifAbsent: [ nil ]);
		atpLastReviewedAt: (aRequest at: 'lastReviewedAt' ifAbsent: [ nil ]);
		atpLastReportedAt: (aRequest at: 'lastReportedAt' ifAbsent: [ nil ]);
		atpLastAppealedAt: (aRequest at: 'lastAppealedAt' ifAbsent: [ nil ]);
		atpTakendown: (aRequest at: 'takendown' ifAbsent: [ nil ]);
		atpAppealed: (aRequest at: 'appealed' ifAbsent: [ nil ]);
		atpSuspendUntil: (aRequest at: 'suspendUntil' ifAbsent: [ nil ]);
		atpTags: (aRequest
				at: 'tags'
				ifPresent: [ :anArray | anArray collect: [ :aValue | aValue ] ]
				ifAbsent: [ nil ])
]

{ #category : #magritte }
ToolsOzoneModerationDefsSubjectStatusView >> appealedDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Appealed';
		accessor: #atpAppealed
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpAppealed [
	<atpType:#Boolean format:nil>
	^ atpAppealed
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpAppealed: anObject [
	atpAppealed := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpComment [
	<atpType:#String format:nil>
	^ atpComment
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpComment: anObject [
	atpComment := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpCreatedAt [
	<atpType:#String format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpHosting [
	<atpType:#(ToolsOzoneModerationDefsAccountHosting ToolsOzoneModerationDefsRecordHosting) format:nil>
	^ atpHosting
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpHosting: anObject [
	atpHosting := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpId [
	<atpType:#Number format:nil>
	^ atpId
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpId: anObject [
	atpId := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpLastAppealedAt [
	<atpType:#String format:'datetime'>
	^ atpLastAppealedAt
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpLastAppealedAt: anObject [
	atpLastAppealedAt := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpLastReportedAt [
	<atpType:#String format:'datetime'>
	^ atpLastReportedAt
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpLastReportedAt: anObject [
	atpLastReportedAt := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpLastReviewedAt [
	<atpType:#String format:'datetime'>
	^ atpLastReviewedAt
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpLastReviewedAt: anObject [
	atpLastReviewedAt := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpLastReviewedBy [
	<atpType:#String format:'did'>
	^ atpLastReviewedBy
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpLastReviewedBy: anObject [
	atpLastReviewedBy := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpMuteReportingUntil [
	<atpType:#String format:'datetime'>
	^ atpMuteReportingUntil
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpMuteReportingUntil: anObject [
	atpMuteReportingUntil := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpMuteUntil [
	<atpType:#String format:'datetime'>
	^ atpMuteUntil
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpMuteUntil: anObject [
	atpMuteUntil := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpReviewState [
	<referenceTo:'#subjectReviewState'>
	<atpType:#String format:nil>
	^ atpReviewState
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpReviewState: anObject [
	<referenceTo:'#subjectReviewState'>
	atpReviewState := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpSubject [
	<atpType:#(ComAtprotoAdminDefsRepoRef ComAtprotoRepoStrongRefMain) format:nil>
	^ atpSubject
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpSubject: anObject [
	atpSubject := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpSubjectBlobCids [
	<atpType:#String format:nil>
	<atpCollection>
	^ atpSubjectBlobCids
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpSubjectBlobCids: anObject [
	atpSubjectBlobCids := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpSubjectRepoHandle [
	<atpType:#String format:nil>
	^ atpSubjectRepoHandle
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpSubjectRepoHandle: anObject [
	atpSubjectRepoHandle := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpSuspendUntil [
	<atpType:#String format:'datetime'>
	^ atpSuspendUntil
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpSuspendUntil: anObject [
	atpSuspendUntil := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpTags [
	<atpType:#String format:nil>
	<atpCollection>
	^ atpTags
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpTags: anObject [
	atpTags := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpTakendown [
	<atpType:#Boolean format:nil>
	^ atpTakendown
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpTakendown: anObject [
	atpTakendown := anObject
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpUpdatedAt [
	<atpType:#String format:'datetime'>
	^ atpUpdatedAt
]

{ #category : #accessing }
ToolsOzoneModerationDefsSubjectStatusView >> atpUpdatedAt: anObject [
	atpUpdatedAt := anObject
]

{ #category : #magritte }
ToolsOzoneModerationDefsSubjectStatusView >> commentDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Comment';
		accessor: #atpComment
]

{ #category : #magritte }
ToolsOzoneModerationDefsSubjectStatusView >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsSubjectStatusView >> hostingDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'#accountHosting'.
				'#recordHosting'};
		label: 'Hosting';
		accessor: #atpHosting
]

{ #category : #magritte }
ToolsOzoneModerationDefsSubjectStatusView >> idDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Id';
		accessor: #atpId;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsSubjectStatusView >> lastAppealedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'LastAppealedAt';
		accessor: #atpLastAppealedAt
]

{ #category : #magritte }
ToolsOzoneModerationDefsSubjectStatusView >> lastReportedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'LastReportedAt';
		accessor: #atpLastReportedAt
]

{ #category : #magritte }
ToolsOzoneModerationDefsSubjectStatusView >> lastReviewedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'LastReviewedAt';
		accessor: #atpLastReviewedAt
]

{ #category : #magritte }
ToolsOzoneModerationDefsSubjectStatusView >> lastReviewedByDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'LastReviewedBy';
		accessor: #atpLastReviewedBy
]

{ #category : #magritte }
ToolsOzoneModerationDefsSubjectStatusView >> muteReportingUntilDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'MuteReportingUntil';
		accessor: #atpMuteReportingUntil
]

{ #category : #magritte }
ToolsOzoneModerationDefsSubjectStatusView >> muteUntilDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'MuteUntil';
		accessor: #atpMuteUntil
]

{ #category : #magritte }
ToolsOzoneModerationDefsSubjectStatusView >> reviewStateDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'ReviewState';
		accessor: #atpReviewState;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsSubjectStatusView >> subjectBlobCidsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'SubjectBlobCids';
		accessor: #atpSubjectBlobCids
]

{ #category : #magritte }
ToolsOzoneModerationDefsSubjectStatusView >> subjectDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'com.atproto.admin.defs#repoRef'.
				'com.atproto.repo.strongRef'};
		label: 'Subject';
		accessor: #atpSubject;
		beRequired
]

{ #category : #magritte }
ToolsOzoneModerationDefsSubjectStatusView >> subjectRepoHandleDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'SubjectRepoHandle';
		accessor: #atpSubjectRepoHandle
]

{ #category : #magritte }
ToolsOzoneModerationDefsSubjectStatusView >> suspendUntilDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'SuspendUntil';
		accessor: #atpSuspendUntil
]

{ #category : #magritte }
ToolsOzoneModerationDefsSubjectStatusView >> tagsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'Tags';
		accessor: #atpTags
]

{ #category : #magritte }
ToolsOzoneModerationDefsSubjectStatusView >> takendownDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Takendown';
		accessor: #atpTakendown
]

{ #category : #magritte }
ToolsOzoneModerationDefsSubjectStatusView >> updatedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'UpdatedAt';
		accessor: #atpUpdatedAt;
		beRequired
]
