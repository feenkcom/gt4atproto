Class {
	#name : #ComAtprotoAdminDefsActionView,
	#superclass : #Object,
	#instVars : [
		'atpId',
		'atpAction',
		'atpSubject',
		'atpSubjectBlobCids',
		'atpCreateLabelVals',
		'atpNegateLabelVals',
		'atpReason',
		'atpCreatedBy',
		'atpCreatedAt',
		'atpReversal',
		'atpResolvedReportIds'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoAdminDefsActionView class >> fromRequest: aRequest [
	^ self new atpId: (aRequest at: 'id' ifAbsent: [ nil ]); 
		atpAction: (aRequest at: 'action' ifPresent: [:aValue | String fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpSubject: (aRequest at: 'subject' ifAbsent: [ nil ]); 
		atpSubjectBlobCids: (aRequest at: 'subjectBlobCids' ifAbsent: [ nil ]); 
		atpCreateLabelVals: (aRequest at: 'createLabelVals' ifAbsent: [ nil ]); 
		atpNegateLabelVals: (aRequest at: 'negateLabelVals' ifAbsent: [ nil ]); 
		atpReason: (aRequest at: 'reason' ifAbsent: [ nil ]); 
		atpCreatedBy: (aRequest at: 'createdBy' ifAbsent: [ nil ]); 
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ]); 
		atpReversal: (aRequest at: 'reversal' ifPresent: [:aValue | ComAtprotoAdminDefsActionReversal fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpResolvedReportIds: (aRequest at: 'resolvedReportIds' ifAbsent: [ nil ])
]

{ #category : #magritte }
ComAtprotoAdminDefsActionView >> actionDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Action';
		accessor: #atpAction;
		beRequired
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atpAction [
	<referenceTo:'#actionType'>
	^ atpAction
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atpAction: anObject [
	<referenceTo:'#actionType'>
	atpAction := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atpCreateLabelVals [
	^ atpCreateLabelVals
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atpCreateLabelVals: anObject [
	atpCreateLabelVals := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atpCreatedAt [
	^ atpCreatedAt
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atpCreatedBy [
	^ atpCreatedBy
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atpCreatedBy: anObject [
	atpCreatedBy := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atpId [
	^ atpId
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atpId: anObject [
	atpId := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atpNegateLabelVals [
	^ atpNegateLabelVals
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atpNegateLabelVals: anObject [
	atpNegateLabelVals := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atpReason [
	^ atpReason
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atpReason: anObject [
	atpReason := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atpResolvedReportIds [
	^ atpResolvedReportIds
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atpResolvedReportIds: anObject [
	atpResolvedReportIds := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atpReversal [
	<referenceTo:'#actionReversal'>
	^ atpReversal
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atpReversal: anObject [
	<referenceTo:'#actionReversal'>
	atpReversal := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atpSubject [
	^ atpSubject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atpSubject: anObject [
	atpSubject := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atpSubjectBlobCids [
	^ atpSubjectBlobCids
]

{ #category : #accessing }
ComAtprotoAdminDefsActionView >> atpSubjectBlobCids: anObject [
	atpSubjectBlobCids := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsActionView >> createLabelValsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'CreateLabelVals';
		accessor: #atpCreateLabelVals
]

{ #category : #magritte }
ComAtprotoAdminDefsActionView >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsActionView >> createdByDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedBy';
		accessor: #atpCreatedBy;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsActionView >> idDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Id';
		accessor: #atpId;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsActionView >> negateLabelValsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'NegateLabelVals';
		accessor: #atpNegateLabelVals
]

{ #category : #magritte }
ComAtprotoAdminDefsActionView >> reasonDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Reason';
		accessor: #atpReason;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsActionView >> resolvedReportIdsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {Number};
		label: 'ResolvedReportIds';
		accessor: #atpResolvedReportIds;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsActionView >> reversalDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Reversal';
		accessor: #atpReversal
]

{ #category : #magritte }
ComAtprotoAdminDefsActionView >> subjectBlobCidsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'SubjectBlobCids';
		accessor: #atpSubjectBlobCids;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsActionView >> subjectDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'#repoRef'. 'com.atproto.repo.strongRef'};
		label: 'Subject';
		accessor: #atpSubject;
		beRequired
]