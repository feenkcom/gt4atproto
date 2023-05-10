Class {
	#name : #ComAtprotoAdminDefsActionViewDetail,
	#superclass : #Object,
	#instVars : [
		'atProtoId',
		'atProtoAction',
		'atProtoSubject',
		'atProtoSubjectBlobs',
		'atProtoCreateLabelVals',
		'atProtoNegateLabelVals',
		'atProtoReason',
		'atProtoCreatedBy',
		'atProtoCreatedAt',
		'atProtoReversal',
		'atProtoResolvedReports'
	],
	#category : #'Gt4AtProto-GeneratedCode'
}

{ #category : #magritte }
ComAtprotoAdminDefsActionViewDetail >> actionDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Action';
		accessor: #atProtoAction;
		beRequired
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atProtoAction [
	<referenceTo:'#actionType'>
	^ atProtoAction
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atProtoAction: anObject [
	<referenceTo:'#actionType'>
	atProtoAction := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atProtoCreateLabelVals [
	^ atProtoCreateLabelVals
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atProtoCreateLabelVals: anObject [
	atProtoCreateLabelVals := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atProtoCreatedAt [
	^ atProtoCreatedAt
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atProtoCreatedAt: anObject [
	atProtoCreatedAt := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atProtoCreatedBy [
	^ atProtoCreatedBy
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atProtoCreatedBy: anObject [
	atProtoCreatedBy := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atProtoId [
	^ atProtoId
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atProtoId: anObject [
	atProtoId := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atProtoNegateLabelVals [
	^ atProtoNegateLabelVals
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atProtoNegateLabelVals: anObject [
	atProtoNegateLabelVals := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atProtoReason [
	^ atProtoReason
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atProtoReason: anObject [
	atProtoReason := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atProtoResolvedReports [
	^ atProtoResolvedReports
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atProtoResolvedReports: anObject [
	atProtoResolvedReports := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atProtoReversal [
	<referenceTo:'#actionReversal'>
	^ atProtoReversal
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atProtoReversal: anObject [
	<referenceTo:'#actionReversal'>
	atProtoReversal := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atProtoSubject [
	^ atProtoSubject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atProtoSubject: anObject [
	atProtoSubject := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atProtoSubjectBlobs [
	^ atProtoSubjectBlobs
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atProtoSubjectBlobs: anObject [
	atProtoSubjectBlobs := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsActionViewDetail >> createLabelValsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'CreateLabelVals';
		accessor: #atProtoCreateLabelVals
]

{ #category : #magritte }
ComAtprotoAdminDefsActionViewDetail >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atProtoCreatedAt;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsActionViewDetail >> createdByDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedBy';
		accessor: #atProtoCreatedBy;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsActionViewDetail >> idDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Id';
		accessor: #atProtoId;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsActionViewDetail >> negateLabelValsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'NegateLabelVals';
		accessor: #atProtoNegateLabelVals
]

{ #category : #magritte }
ComAtprotoAdminDefsActionViewDetail >> reasonDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Reason';
		accessor: #atProtoReason;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsActionViewDetail >> resolvedReportsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ReportView};
		label: 'ResolvedReports';
		accessor: #atProtoResolvedReports;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsActionViewDetail >> reversalDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Reversal';
		accessor: #atProtoReversal
]

{ #category : #magritte }
ComAtprotoAdminDefsActionViewDetail >> subjectBlobsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {BlobView};
		label: 'SubjectBlobs';
		accessor: #atProtoSubjectBlobs;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsActionViewDetail >> subjectDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'#repoView'. '#recordView'};
		label: 'Subject';
		accessor: #atProtoSubject;
		beRequired
]
