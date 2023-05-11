Class {
	#name : #ComAtprotoAdminDefsActionView,
	#superclass : #Object,
	#instVars : [
		'atProtoId',
		'atProtoAction',
		'atProtoSubject',
		'atProtoSubjectBlobCids',
		'atProtoCreateLabelVals',
		'atProtoNegateLabelVals',
		'atProtoReason',
		'atProtoCreatedBy',
		'atProtoCreatedAt',
		'atProtoReversal',
		'atProtoResolvedReportIds'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoAdminDefsActionView class >> fromRequest: aRequest [
	^ self new atProtoId: (aRequest at: 'id' ifAbsent: [ nil ]); 
		atProtoAction: (aRequest at: 'action' ifPresent: [:aValue | String fromRequest: aValue ] ifAbsent: [ nil ]); 
		atProtoSubject: (aRequest at: 'subject' ifAbsent: [ nil ]); 
		atProtoSubjectBlobCids: (aRequest at: 'subjectBlobCids' ifAbsent: [ nil ]); 
		atProtoCreateLabelVals: (aRequest at: 'createLabelVals' ifAbsent: [ nil ]); 
		atProtoNegateLabelVals: (aRequest at: 'negateLabelVals' ifAbsent: [ nil ]); 
		atProtoReason: (aRequest at: 'reason' ifAbsent: [ nil ]); 
		atProtoCreatedBy: (aRequest at: 'createdBy' ifAbsent: [ nil ]); 
		atProtoCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ]); 
		atProtoReversal: (aRequest at: 'reversal' ifPresent: [:aValue | ComAtprotoAdminDefsActionReversal fromRequest: aValue ] ifAbsent: [ nil ]); 
		atProtoResolvedReportIds: (aRequest at: 'resolvedReportIds' ifAbsent: [ nil ])
]

{ #category : #magritte }
ComAtprotoAdminDefsActionView >> actionDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Action';
		accessor: #atProtoAction;
		beRequired
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atProtoAction [
	<referenceTo:'#actionType'>
	^ atProtoAction
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atProtoAction: anObject [
	<referenceTo:'#actionType'>
	atProtoAction := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atProtoCreateLabelVals [
	^ atProtoCreateLabelVals
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atProtoCreateLabelVals: anObject [
	atProtoCreateLabelVals := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atProtoCreatedAt [
	^ atProtoCreatedAt
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atProtoCreatedAt: anObject [
	atProtoCreatedAt := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atProtoCreatedBy [
	^ atProtoCreatedBy
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atProtoCreatedBy: anObject [
	atProtoCreatedBy := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atProtoId [
	^ atProtoId
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atProtoId: anObject [
	atProtoId := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atProtoNegateLabelVals [
	^ atProtoNegateLabelVals
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atProtoNegateLabelVals: anObject [
	atProtoNegateLabelVals := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atProtoReason [
	^ atProtoReason
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atProtoReason: anObject [
	atProtoReason := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atProtoResolvedReportIds [
	^ atProtoResolvedReportIds
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atProtoResolvedReportIds: anObject [
	atProtoResolvedReportIds := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atProtoReversal [
	<referenceTo:'#actionReversal'>
	^ atProtoReversal
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atProtoReversal: anObject [
	<referenceTo:'#actionReversal'>
	atProtoReversal := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atProtoSubject [
	^ atProtoSubject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atProtoSubject: anObject [
	atProtoSubject := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atProtoSubjectBlobCids [
	^ atProtoSubjectBlobCids
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atProtoSubjectBlobCids: anObject [
	atProtoSubjectBlobCids := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsActionView >> createLabelValsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'CreateLabelVals';
		accessor: #atProtoCreateLabelVals
]

{ #category : #magritte }
ComAtprotoAdminDefsActionView >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atProtoCreatedAt;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsActionView >> createdByDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedBy';
		accessor: #atProtoCreatedBy;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsActionView >> idDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Id';
		accessor: #atProtoId;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsActionView >> negateLabelValsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'NegateLabelVals';
		accessor: #atProtoNegateLabelVals
]

{ #category : #magritte }
ComAtprotoAdminDefsActionView >> reasonDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Reason';
		accessor: #atProtoReason;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsActionView >> resolvedReportIdsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {Number};
		label: 'ResolvedReportIds';
		accessor: #atProtoResolvedReportIds;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsActionView >> reversalDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Reversal';
		accessor: #atProtoReversal
]

{ #category : #magritte }
ComAtprotoAdminDefsActionView >> subjectBlobCidsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'SubjectBlobCids';
		accessor: #atProtoSubjectBlobCids;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsActionView >> subjectDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'#repoRef'. 'com.atproto.repo.strongRef'};
		label: 'Subject';
		accessor: #atProtoSubject;
		beRequired
]
