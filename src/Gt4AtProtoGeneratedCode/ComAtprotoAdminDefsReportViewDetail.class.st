Class {
	#name : #ComAtprotoAdminDefsReportViewDetail,
	#superclass : #Object,
	#instVars : [
		'atProtoId',
		'atProtoReasonType',
		'atProtoReason',
		'atProtoSubject',
		'atProtoReportedBy',
		'atProtoCreatedAt',
		'atProtoResolvedByActions'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoAdminDefsReportViewDetail class >> fromRequest: aRequest [
	^ self new atProtoId: (aRequest at: 'id' ifAbsent: [ nil ]); 
		atProtoReasonType: (aRequest at: 'reasonType' ifPresent: [:aValue | String fromRequest: aValue ] ifAbsent: [ nil ]); 
		atProtoReason: (aRequest at: 'reason' ifAbsent: [ nil ]); 
		atProtoSubject: (aRequest at: 'subject' ifAbsent: [ nil ]); 
		atProtoReportedBy: (aRequest at: 'reportedBy' ifAbsent: [ nil ]); 
		atProtoCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ]); 
		atProtoResolvedByActions: (aRequest at: 'resolvedByActions' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail >> atProtoCreatedAt [
	^ atProtoCreatedAt
]

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail >> atProtoCreatedAt: anObject [
	atProtoCreatedAt := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail >> atProtoId [
	^ atProtoId
]

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail >> atProtoId: anObject [
	atProtoId := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail >> atProtoReason [
	^ atProtoReason
]

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail >> atProtoReason: anObject [
	atProtoReason := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail >> atProtoReasonType [
	<referenceTo:'com.atproto.moderation.defs#reasonType'>
	^ atProtoReasonType
]

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail >> atProtoReasonType: anObject [
	<referenceTo:'com.atproto.moderation.defs#reasonType'>
	atProtoReasonType := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail >> atProtoReportedBy [
	^ atProtoReportedBy
]

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail >> atProtoReportedBy: anObject [
	atProtoReportedBy := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail >> atProtoResolvedByActions [
	^ atProtoResolvedByActions
]

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail >> atProtoResolvedByActions: anObject [
	atProtoResolvedByActions := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail >> atProtoSubject [
	^ atProtoSubject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportViewDetail >> atProtoSubject: anObject [
	atProtoSubject := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsReportViewDetail >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atProtoCreatedAt;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsReportViewDetail >> idDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Id';
		accessor: #atProtoId;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsReportViewDetail >> reasonDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Reason';
		accessor: #atProtoReason
]

{ #category : #magritte }
ComAtprotoAdminDefsReportViewDetail >> reasonTypeDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'ReasonType';
		accessor: #atProtoReasonType;
		beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsReportViewDetail >> reportedByDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'ReportedBy';
		accessor: #atProtoReportedBy;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsReportViewDetail >> resolvedByActionsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoAdminDefsActionView};
		label: 'ResolvedByActions';
		accessor: #atProtoResolvedByActions;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsReportViewDetail >> subjectDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'#repoView'. '#recordView'};
		label: 'Subject';
		accessor: #atProtoSubject;
		beRequired
]
