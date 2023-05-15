Class {
	#name : #ComAtprotoAdminDefsModerationDetail,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpCurrentAction',
		'atpActions',
		'atpReports'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoAdminDefsModerationDetail class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
ComAtprotoAdminDefsModerationDetail class >> atpFile [
 ^ 'com/atproto/admin/defs.json'
]

{ #category : #accessing }
ComAtprotoAdminDefsModerationDetail class >> atpRecordName [
 ^ 'com.atproto.admin.defs#moderationDetail'
]

{ #category : #accessing }
ComAtprotoAdminDefsModerationDetail class >> atpSchema [
 ^ '{"type":"object","required":["actions","reports"],"properties":{"currentAction":{"type":"ref","ref":"#actionViewCurrent"},"actions":{"type":"array","items":{"type":"ref","ref":"#actionView"}},"reports":{"type":"array","items":{"type":"ref","ref":"#reportView"}}}}'
]

{ #category : #serialization }
ComAtprotoAdminDefsModerationDetail class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpCurrentAction: (aRequest at: 'currentAction' ifPresent: [:aValue | ComAtprotoAdminDefsActionViewCurrent fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpActions: (aRequest at: 'actions' ifPresent: [:anArray | anArray collect: [:aValue |ComAtprotoAdminDefsActionView fromRequest: aValue ] ] ifAbsent: [ nil ]); 
		atpReports: (aRequest at: 'reports' ifPresent: [:anArray | anArray collect: [:aValue |ComAtprotoAdminDefsReportView fromRequest: aValue ] ] ifAbsent: [ nil ])
]

{ #category : #magritte }
ComAtprotoAdminDefsModerationDetail >> actionsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoAdminDefsActionView};
		label: 'Actions';
		accessor: #atpActions;
	beRequired
]

{ #category : #accessing }
ComAtprotoAdminDefsModerationDetail >> atpActions [
	^ atpActions
]

{ #category : #accessing }
ComAtprotoAdminDefsModerationDetail >> atpActions: anObject [
	atpActions := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsModerationDetail >> atpCurrentAction [
	<referenceTo:'#actionViewCurrent'>
	^ atpCurrentAction
]

{ #category : #accessing }
ComAtprotoAdminDefsModerationDetail >> atpCurrentAction: anObject [
	<referenceTo:'#actionViewCurrent'>
	atpCurrentAction := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsModerationDetail >> atpReports [
	^ atpReports
]

{ #category : #accessing }
ComAtprotoAdminDefsModerationDetail >> atpReports: anObject [
	atpReports := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsModerationDetail >> currentActionDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'CurrentAction';
		accessor: #atpCurrentAction
]

{ #category : #magritte }
ComAtprotoAdminDefsModerationDetail >> reportsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoAdminDefsReportView};
		label: 'Reports';
		accessor: #atpReports;
	beRequired
]
