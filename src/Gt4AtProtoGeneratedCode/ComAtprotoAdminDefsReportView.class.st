Class {
	#name : #ComAtprotoAdminDefsReportView,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpId',
		'atpReasonType',
		'atpReason',
		'atpSubject',
		'atpReportedBy',
		'atpCreatedAt',
		'atpResolvedByActionIds'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoAdminDefsReportView class >> atpRecordName [
 ^ 'com.atproto.admin.defs#reportView'
]

{ #category : #serialization }
ComAtprotoAdminDefsReportView class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpId: (aRequest at: 'id' ifAbsent: [ nil ]); 
		atpReasonType: (aRequest at: 'reasonType' ifPresent: [:aValue | String fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpReason: (aRequest at: 'reason' ifAbsent: [ nil ]); 
		atpSubject: (aRequest at: 'subject' ifPresent: [:aValue | ({'com.atproto.admin.defs#repoRef' -> ComAtprotoAdminDefsRepoRef. 'com.atproto.repo.strongRef' -> ComAtprotoRepoStrongRefMain} asDictionary at: (aValue at: '$type')) fromRequest: aValue] ifAbsent: [ nil ]); 
		atpReportedBy: (aRequest at: 'reportedBy' ifAbsent: [ nil ]); 
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ]); 
		atpResolvedByActionIds: (aRequest at: 'resolvedByActionIds' ifPresent: [:anArray | anArray collect: [:aValue |aValue ] ] ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atpCreatedAt [
	^ atpCreatedAt
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atpId [
	^ atpId
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atpId: anObject [
	atpId := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atpReason [
	^ atpReason
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atpReason: anObject [
	atpReason := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atpReasonType [
	<referenceTo:'com.atproto.moderation.defs#reasonType'>
	^ atpReasonType
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atpReasonType: anObject [
	<referenceTo:'com.atproto.moderation.defs#reasonType'>
	atpReasonType := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atpReportedBy [
	^ atpReportedBy
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atpReportedBy: anObject [
	atpReportedBy := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atpResolvedByActionIds [
	^ atpResolvedByActionIds
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atpResolvedByActionIds: anObject [
	atpResolvedByActionIds := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atpSubject [
	^ atpSubject
]

{ #category : #accessing }
ComAtprotoAdminDefsReportView >> atpSubject: anObject [
	atpSubject := anObject
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
		options: {'#repoRef'. 'com.atproto.repo.strongRef'};
		label: 'Subject';
		accessor: #atpSubject;
		beRequired
]
