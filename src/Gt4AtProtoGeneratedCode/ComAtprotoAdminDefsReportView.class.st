Class {
	#name : #ComAtprotoAdminDefsReportView,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpId',
		'atpReasonType',
		'atpReason',
		'atpSubjectRepoHandle',
		'atpSubject',
		'atpReportedBy',
		'atpCreatedAt',
		'atpResolvedByActionIds'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoAdminDefsReportView class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView class >> atpFile [
 ^ 'com/atproto/admin/defs.json'
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView class >> atpRecordName [
 ^ 'com.atproto.admin.defs#reportView'
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView class >> atpSchema [
 ^ '{"type":"object","required":["id","reasonType","subject","reportedBy","createdAt","resolvedByActionIds"],"properties":{"id":{"type":"integer"},"reasonType":{"type":"ref","ref":"com.atproto.moderation.defs#reasonType"},"reason":{"type":"string"},"subjectRepoHandle":{"type":"string"},"subject":{"type":"union","refs":["#repoRef","com.atproto.repo.strongRef"]},"reportedBy":{"type":"string","format":"did"},"createdAt":{"type":"string","format":"datetime"},"resolvedByActionIds":{"type":"array","items":{"type":"integer"}}}}'
]

{ #category : #serialization }
ComAtprotoAdminDefsReportView class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpId: (aRequest at: 'id' ifAbsent: [ nil ]);
		atpReasonType: (aRequest
				at: 'reasonType'
				ifPresent: [ :aValue | String fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpReason: (aRequest at: 'reason' ifAbsent: [ nil ]);
		atpSubjectRepoHandle: (aRequest at: 'subjectRepoHandle' ifAbsent: [ nil ]);
		atpSubject: (aRequest
				at: 'subject'
				ifPresent: [ :aValue | 
					({'com.atproto.admin.defs#repoRef' -> ComAtprotoAdminDefsRepoRef.
						'com.atproto.repo.strongRef' -> ComAtprotoRepoStrongRefMain} asDictionary
						at: (aValue at: '$type')
						ifAbsent: [ GtApUnknownRecord new key: (aValue at: '$type') ])
						fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpReportedBy: (aRequest at: 'reportedBy' ifAbsent: [ nil ]);
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ]);
		atpResolvedByActionIds: (aRequest
				at: 'resolvedByActionIds'
				ifPresent: [ :anArray | anArray collect: [ :aValue | aValue ] ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atpCreatedAt [
	<atpType:#String format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atpId [
	<atpType:#Number format:nil>
	^ atpId
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atpId: anObject [
	atpId := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atpReason [
	<atpType:#String format:nil>
	^ atpReason
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atpReason: anObject [
	atpReason := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atpReasonType [
	<referenceTo:'com.atproto.moderation.defs#reasonType'>
	<atpType:#String format:nil>
	^ atpReasonType
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atpReasonType: anObject [
	<referenceTo:'com.atproto.moderation.defs#reasonType'>
	atpReasonType := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atpReportedBy [
	<atpType:#String format:'did'>
	^ atpReportedBy
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atpReportedBy: anObject [
	atpReportedBy := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atpResolvedByActionIds [
	<atpType:#Number format:nil>
	<atpCollection>
	^ atpResolvedByActionIds
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atpResolvedByActionIds: anObject [
	atpResolvedByActionIds := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atpSubject [
	<atpType:#(ComAtprotoAdminDefsRepoRef ComAtprotoRepoStrongRefMain) format:nil>
	^ atpSubject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atpSubject: anObject [
	atpSubject := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atpSubjectRepoHandle [
	<atpType:#String format:nil>
	^ atpSubjectRepoHandle
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atpSubjectRepoHandle: anObject [
	atpSubjectRepoHandle := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsReportView >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsReportView >> idDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Id';
		accessor: #atpId;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsReportView >> reasonDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Reason';
		accessor: #atpReason
]

{ #category : #magritte }
ComAtprotoAdminDefsReportView >> reasonTypeDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'ReasonType';
		accessor: #atpReasonType;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsReportView >> reportedByDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'ReportedBy';
		accessor: #atpReportedBy;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsReportView >> resolvedByActionIdsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {Number};
		label: 'ResolvedByActionIds';
		accessor: #atpResolvedByActionIds;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsReportView >> subjectDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'#repoRef'.
				'com.atproto.repo.strongRef'};
		label: 'Subject';
		accessor: #atpSubject;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsReportView >> subjectRepoHandleDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'SubjectRepoHandle';
		accessor: #atpSubjectRepoHandle
]
