Class {
	#name : #ComAtprotoAdminDefsReportViewDetail,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpId',
		'atpReasonType',
		'atpReason',
		'atpSubject',
		'atpReportedBy',
		'atpCreatedAt',
		'atpResolvedByActions'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail class >> atpFile [
 ^ 'com/atproto/admin/defs.json'
]

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail class >> atpRecordName [
 ^ 'com.atproto.admin.defs#reportViewDetail'
]

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail class >> atpSchema [
 ^ '{"type":"object","required":["id","reasonType","subject","reportedBy","createdAt","resolvedByActions"],"properties":{"id":{"type":"integer"},"reasonType":{"type":"ref","ref":"com.atproto.moderation.defs#reasonType"},"reason":{"type":"string"},"subject":{"type":"union","refs":["#repoView","#repoViewNotFound","#recordView","#recordViewNotFound"]},"reportedBy":{"type":"string","format":"did"},"createdAt":{"type":"string","format":"datetime"},"resolvedByActions":{"type":"array","items":{"type":"ref","ref":"com.atproto.admin.defs#actionView"}}}}'
]

{ #category : #serialization }
ComAtprotoAdminDefsReportViewDetail class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpId: (aRequest at: 'id' ifAbsent: [ nil ]);
		atpReasonType: (aRequest
				at: 'reasonType'
				ifPresent: [ :aValue | String fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpReason: (aRequest at: 'reason' ifAbsent: [ nil ]);
		atpSubject: (aRequest
				at: 'subject'
				ifPresent: [ :aValue | 
					({'com.atproto.admin.defs#repoView' -> ComAtprotoAdminDefsRepoView.
						'com.atproto.admin.defs#repoViewNotFound'
							-> ComAtprotoAdminDefsRepoViewNotFound.
						'com.atproto.admin.defs#recordView' -> ComAtprotoAdminDefsRecordView.
						'com.atproto.admin.defs#recordViewNotFound'
							-> ComAtprotoAdminDefsRecordViewNotFound} asDictionary
						at: (aValue at: '$type')
						ifAbsent: [ GtApUnknownRecord new key: (aValue at: '$type') ])
						fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpReportedBy: (aRequest at: 'reportedBy' ifAbsent: [ nil ]);
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ]);
		atpResolvedByActions: (aRequest
				at: 'resolvedByActions'
				ifPresent: [ :anArray | anArray collect: [ :aValue | ComAtprotoAdminDefsActionView fromRequest: aValue ] ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail >> atpCreatedAt [
	<atpType:#String format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail >> atpId [
	<atpType:#Number format:nil>
	^ atpId
]

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail >> atpId: anObject [
	atpId := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail >> atpReason [
	<atpType:#String format:nil>
	^ atpReason
]

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail >> atpReason: anObject [
	atpReason := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail >> atpReasonType [
	<referenceTo:'com.atproto.moderation.defs#reasonType'>
	<atpType:#String format:nil>
	^ atpReasonType
]

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail >> atpReasonType: anObject [
	<referenceTo:'com.atproto.moderation.defs#reasonType'>
	atpReasonType := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail >> atpReportedBy [
	<atpType:#String format:'did'>
	^ atpReportedBy
]

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail >> atpReportedBy: anObject [
	atpReportedBy := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail >> atpResolvedByActions [
	<atpType:#ComAtprotoAdminDefsActionView format:nil>
	<atpCollection>
	^ atpResolvedByActions
]

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail >> atpResolvedByActions: anObject [
	atpResolvedByActions := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail >> atpSubject [
	<atpType:#(ComAtprotoAdminDefsRepoView ComAtprotoAdminDefsRepoViewNotFound ComAtprotoAdminDefsRecordView ComAtprotoAdminDefsRecordViewNotFound) format:nil>
	^ atpSubject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail >> atpSubject: anObject [
	atpSubject := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsReportViewDetail >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsReportViewDetail >> idDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Id';
		accessor: #atpId;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsReportViewDetail >> reasonDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Reason';
		accessor: #atpReason
]

{ #category : #magritte }
ComAtprotoAdminDefsReportViewDetail >> reasonTypeDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'ReasonType';
		accessor: #atpReasonType;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsReportViewDetail >> reportedByDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'ReportedBy';
		accessor: #atpReportedBy;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsReportViewDetail >> resolvedByActionsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoAdminDefsActionView};
		label: 'ResolvedByActions';
		accessor: #atpResolvedByActions;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsReportViewDetail >> subjectDescription [
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
