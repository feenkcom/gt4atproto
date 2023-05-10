Class {
	#name : #ComAtprotoAdminDefsReportView,
	#superclass : #Object,
	#instVars : [
		'atProtoId',
		'atProtoReasonType',
		'atProtoReason',
		'atProtoSubject',
		'atProtoReportedBy',
		'atProtoCreatedAt',
		'atProtoResolvedByActionIds'
	],
	#category : #'Gt4AtProto-GeneratedCode'
}

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atProtoCreatedAt [
	^ atProtoCreatedAt
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atProtoCreatedAt: anObject [
	atProtoCreatedAt := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atProtoId [
	^ atProtoId
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atProtoId: anObject [
	atProtoId := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atProtoReason [
	^ atProtoReason
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atProtoReason: anObject [
	atProtoReason := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atProtoReasonType [
	<referenceTo:'com.atproto.moderation.defs#reasonType'>
	^ atProtoReasonType
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atProtoReasonType: anObject [
	<referenceTo:'com.atproto.moderation.defs#reasonType'>
	atProtoReasonType := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atProtoReportedBy [
	^ atProtoReportedBy
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atProtoReportedBy: anObject [
	atProtoReportedBy := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atProtoResolvedByActionIds [
	^ atProtoResolvedByActionIds
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atProtoResolvedByActionIds: anObject [
	atProtoResolvedByActionIds := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atProtoSubject [
	^ atProtoSubject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atProtoSubject: anObject [
	atProtoSubject := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsReportView >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atProtoCreatedAt;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsReportView >> idDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Id';
		accessor: #atProtoId;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsReportView >> reasonDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Reason';
		accessor: #atProtoReason
]

{ #category : #magritte }
ComAtprotoAdminDefsReportView >> reasonTypeDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'ReasonType';
		accessor: #atProtoReasonType;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsReportView >> reportedByDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'ReportedBy';
		accessor: #atProtoReportedBy;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsReportView >> resolvedByActionIdsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {Number};
		label: 'ResolvedByActionIds';
		accessor: #atProtoResolvedByActionIds;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsReportView >> subjectDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'#repoRef'. 'com.atproto.repo.strongRef'};
		label: 'Subject';
		accessor: #atProtoSubject;
		beRequired
]
