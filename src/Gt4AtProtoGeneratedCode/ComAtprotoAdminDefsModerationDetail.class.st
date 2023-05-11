Class {
	#name : #ComAtprotoAdminDefsModerationDetail,
	#superclass : #Object,
	#instVars : [
		'atProtoCurrentAction',
		'atProtoActions',
		'atProtoReports'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoAdminDefsModerationDetail class >> fromRequest: aRequest [
	^ self new atProtoCurrentAction: (ComAtprotoAdminDefsActionViewCurrent fromRequest: (aRequest at: 'currentAction' ifAbsent: [ nil ])); 
		atProtoActions: (aRequest at: 'actions' ifAbsent: [ nil ]); 
		atProtoReports: (aRequest at: 'reports' ifAbsent: [ nil ])
]

{ #category : #magritte }
ComAtprotoAdminDefsModerationDetail >> actionsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoAdminDefsActionView};
		label: 'Actions';
		accessor: #atProtoActions;
	beRequired
]

{ #category : #accessing }
ComAtprotoAdminDefsModerationDetail >> atProtoActions [
	^ atProtoActions
]

{ #category : #accessing }
ComAtprotoAdminDefsModerationDetail >> atProtoActions: anObject [
	atProtoActions := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsModerationDetail >> atProtoCurrentAction [
	<referenceTo:'#actionViewCurrent'>
	^ atProtoCurrentAction
]

{ #category : #accessing }
ComAtprotoAdminDefsModerationDetail >> atProtoCurrentAction: anObject [
	<referenceTo:'#actionViewCurrent'>
	atProtoCurrentAction := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsModerationDetail >> atProtoReports [
	^ atProtoReports
]

{ #category : #accessing }
ComAtprotoAdminDefsModerationDetail >> atProtoReports: anObject [
	atProtoReports := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsModerationDetail >> currentActionDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'CurrentAction';
		accessor: #atProtoCurrentAction
]

{ #category : #magritte }
ComAtprotoAdminDefsModerationDetail >> reportsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoAdminDefsReportView};
		label: 'Reports';
		accessor: #atProtoReports;
	beRequired
]
