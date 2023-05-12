Class {
	#name : #ComAtprotoAdminDefsActionViewDetail,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpId',
		'atpAction',
		'atpSubject',
		'atpSubjectBlobs',
		'atpCreateLabelVals',
		'atpNegateLabelVals',
		'atpReason',
		'atpCreatedBy',
		'atpCreatedAt',
		'atpReversal',
		'atpResolvedReports'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail class >> atpRecordName [
 ^ 'com.atproto.admin.defs#actionViewDetail'
]

{ #category : #serialization }
ComAtprotoAdminDefsActionViewDetail class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpId: (aRequest at: 'id' ifAbsent: [ nil ]); 
		atpAction: (aRequest at: 'action' ifPresent: [:aValue | String fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpSubject: (aRequest at: 'subject' ifPresent: [:aValue | ({'com.atproto.admin.defs#repoView' -> ComAtprotoAdminDefsRepoView. 'com.atproto.admin.defs#recordView' -> ComAtprotoAdminDefsRecordView} asDictionary at: (aValue at: '$type')) fromRequest: aValue] ifAbsent: [ nil ]); 
		atpSubjectBlobs: (aRequest at: 'subjectBlobs' ifPresent: [:anArray | anArray collect: [:aValue |ComAtprotoAdminDefsBlobView fromRequest: aValue ] ] ifAbsent: [ nil ]); 
		atpCreateLabelVals: (aRequest at: 'createLabelVals' ifPresent: [:anArray | anArray collect: [:aValue |aValue ] ] ifAbsent: [ nil ]); 
		atpNegateLabelVals: (aRequest at: 'negateLabelVals' ifPresent: [:anArray | anArray collect: [:aValue |aValue ] ] ifAbsent: [ nil ]); 
		atpReason: (aRequest at: 'reason' ifAbsent: [ nil ]); 
		atpCreatedBy: (aRequest at: 'createdBy' ifAbsent: [ nil ]); 
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ]); 
		atpReversal: (aRequest at: 'reversal' ifPresent: [:aValue | ComAtprotoAdminDefsActionReversal fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpResolvedReports: (aRequest at: 'resolvedReports' ifPresent: [:anArray | anArray collect: [:aValue |ComAtprotoAdminDefsReportView fromRequest: aValue ] ] ifAbsent: [ nil ])
]

{ #category : #magritte }
ComAtprotoAdminDefsActionViewDetail >> actionDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Action';
		accessor: #atpAction;
		beRequired
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpAction [
	<referenceTo:'#actionType'>
	^ atpAction
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpAction: anObject [
	<referenceTo:'#actionType'>
	atpAction := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpCreateLabelVals [
	^ atpCreateLabelVals
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpCreateLabelVals: anObject [
	atpCreateLabelVals := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpCreatedAt [
	^ atpCreatedAt
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpCreatedBy [
	^ atpCreatedBy
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpCreatedBy: anObject [
	atpCreatedBy := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpId [
	^ atpId
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpId: anObject [
	atpId := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpNegateLabelVals [
	^ atpNegateLabelVals
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpNegateLabelVals: anObject [
	atpNegateLabelVals := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpReason [
	^ atpReason
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpReason: anObject [
	atpReason := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpResolvedReports [
	^ atpResolvedReports
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpResolvedReports: anObject [
	atpResolvedReports := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpReversal [
	<referenceTo:'#actionReversal'>
	^ atpReversal
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpReversal: anObject [
	<referenceTo:'#actionReversal'>
	atpReversal := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpSubject [
	^ atpSubject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpSubject: anObject [
	atpSubject := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpSubjectBlobs [
	^ atpSubjectBlobs
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpSubjectBlobs: anObject [
	atpSubjectBlobs := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsActionViewDetail >> createLabelValsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'CreateLabelVals';
		accessor: #atpCreateLabelVals
]

{ #category : #magritte }
ComAtprotoAdminDefsActionViewDetail >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsActionViewDetail >> createdByDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedBy';
		accessor: #atpCreatedBy;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsActionViewDetail >> idDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Id';
		accessor: #atpId;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsActionViewDetail >> negateLabelValsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {String};
		label: 'NegateLabelVals';
		accessor: #atpNegateLabelVals
]

{ #category : #magritte }
ComAtprotoAdminDefsActionViewDetail >> reasonDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Reason';
		accessor: #atpReason;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsActionViewDetail >> resolvedReportsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoAdminDefsReportView};
		label: 'ResolvedReports';
		accessor: #atpResolvedReports;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsActionViewDetail >> reversalDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Reversal';
		accessor: #atpReversal
]

{ #category : #magritte }
ComAtprotoAdminDefsActionViewDetail >> subjectBlobsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoAdminDefsBlobView};
		label: 'SubjectBlobs';
		accessor: #atpSubjectBlobs;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsActionViewDetail >> subjectDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		options: {'#repoView'. '#recordView'};
		label: 'Subject';
		accessor: #atpSubject;
		beRequired
]
