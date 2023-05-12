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

{ #category : #serialization }
ComAtprotoAdminDefsModerationDetail class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpCurrentAction: (aRequest at: 'currentAction' ifPresent: [:aValue | ComAtprotoAdminDefsActionViewCurrent fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpActions: (aRequest at: 'actions' ifAbsent: [ nil ]); 
		atpReports: (aRequest at: 'reports' ifAbsent: [ nil ])
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
