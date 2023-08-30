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
		'atpResolvedReports',
		'atpDurationInHours'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail class >> atpFile [
 ^ 'com/atproto/admin/defs.json'
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail class >> atpRecordName [
 ^ 'com.atproto.admin.defs#actionViewDetail'
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail class >> atpSchema [
 ^ '{"type":"object","required":["id","action","subject","subjectBlobs","reason","createdBy","createdAt","resolvedReports"],"properties":{"id":{"type":"integer"},"action":{"type":"ref","ref":"#actionType"},"subject":{"type":"union","refs":["#repoView","#repoViewNotFound","#recordView","#recordViewNotFound"]},"subjectBlobs":{"type":"array","items":{"type":"ref","ref":"#blobView"}},"createLabelVals":{"type":"array","items":{"type":"string"}},"negateLabelVals":{"type":"array","items":{"type":"string"}},"reason":{"type":"string"},"createdBy":{"type":"string","format":"did"},"createdAt":{"type":"string","format":"datetime"},"reversal":{"type":"ref","ref":"#actionReversal"},"resolvedReports":{"type":"array","items":{"type":"ref","ref":"#reportView"}}}}'
]

{ #category : #serialization }
ComAtprotoAdminDefsActionViewDetail class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpId: (aRequest at: 'id' ifAbsent: [ nil ]);
		atpAction: (aRequest
				at: 'action'
				ifPresent: [ :aValue | String fromRequest: aValue ]
				ifAbsent: [ nil ]);
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
		atpSubjectBlobs: (aRequest
				at: 'subjectBlobs'
				ifPresent: [ :anArray | anArray collect: [ :aValue | ComAtprotoAdminDefsBlobView fromRequest: aValue ] ]
				ifAbsent: [ nil ]);
		atpCreateLabelVals: (aRequest
				at: 'createLabelVals'
				ifPresent: [ :anArray | anArray collect: [ :aValue | aValue ] ]
				ifAbsent: [ nil ]);
		atpNegateLabelVals: (aRequest
				at: 'negateLabelVals'
				ifPresent: [ :anArray | anArray collect: [ :aValue | aValue ] ]
				ifAbsent: [ nil ]);
		atpReason: (aRequest at: 'reason' ifAbsent: [ nil ]);
		atpCreatedBy: (aRequest at: 'createdBy' ifAbsent: [ nil ]);
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ]);
		atpReversal: (aRequest
				at: 'reversal'
				ifPresent: [ :aValue | ComAtprotoAdminDefsActionReversal fromRequest: aValue ]
				ifAbsent: [ nil ]);
		atpResolvedReports: (aRequest
				at: 'resolvedReports'
				ifPresent: [ :anArray | anArray collect: [ :aValue | ComAtprotoAdminDefsReportView fromRequest: aValue ] ]
				ifAbsent: [ nil ])
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
	<atpType:#String format:nil>
	^ atpAction
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpAction: anObject [
	<referenceTo:'#actionType'>
	atpAction := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpCreateLabelVals [
	<atpType:#String format:nil>
	<atpCollection>
	^ atpCreateLabelVals
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpCreateLabelVals: anObject [
	atpCreateLabelVals := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpCreatedAt [
	<atpType:#String format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpCreatedBy [
	<atpType:#String format:'did'>
	^ atpCreatedBy
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpCreatedBy: anObject [
	atpCreatedBy := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpDurationInHours [
	<atpType:#Number format:nil>
	^ atpDurationInHours
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpDurationInHours: anObject [
	atpDurationInHours := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpId [
	<atpType:#Number format:nil>
	^ atpId
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpId: anObject [
	atpId := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpNegateLabelVals [
	<atpType:#String format:nil>
	<atpCollection>
	^ atpNegateLabelVals
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpNegateLabelVals: anObject [
	atpNegateLabelVals := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpReason [
	<atpType:#String format:nil>
	^ atpReason
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpReason: anObject [
	atpReason := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpResolvedReports [
	<atpType:#ComAtprotoAdminDefsReportView format:nil>
	<atpCollection>
	^ atpResolvedReports
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpResolvedReports: anObject [
	atpResolvedReports := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpReversal [
	<referenceTo:'#actionReversal'>
	<atpType:#ComAtprotoAdminDefsActionReversal format:nil>
	^ atpReversal
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpReversal: anObject [
	<referenceTo:'#actionReversal'>
	atpReversal := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpSubject [
	<atpType:#(ComAtprotoAdminDefsRepoView ComAtprotoAdminDefsRepoViewNotFound ComAtprotoAdminDefsRecordView ComAtprotoAdminDefsRecordViewNotFound) format:nil>
	^ atpSubject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpSubject: anObject [
	atpSubject := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewDetail >> atpSubjectBlobs [
	<atpType:#ComAtprotoAdminDefsBlobView format:nil>
	<atpCollection>
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
ComAtprotoAdminDefsActionViewDetail >> durationInHoursDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'DurationInHours';
		accessor: #atpDurationInHours
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
		options: {'#repoView'.
				'#repoViewNotFound'.
				'#recordView'.
				'#recordViewNotFound'};
		label: 'Subject';
		accessor: #atpSubject;
		beRequired
]
