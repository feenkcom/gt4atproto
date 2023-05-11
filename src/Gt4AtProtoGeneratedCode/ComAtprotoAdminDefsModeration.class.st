Class {
	#name : #ComAtprotoAdminDefsModeration,
	#superclass : #Object,
	#instVars : [
		'atpCurrentAction'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoAdminDefsModeration class >> fromRequest: aRequest [
	^ self new atpCurrentAction: (aRequest at: 'currentAction' ifPresent: [:aValue | ComAtprotoAdminDefsActionViewCurrent fromRequest: aValue ] ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoAdminDefsModeration >> atpCurrentAction [
	<referenceTo:'#actionViewCurrent'>
	^ atpCurrentAction
]

{ #category : #accessing }
ComAtprotoAdminDefsModeration >> atpCurrentAction: anObject [
	<referenceTo:'#actionViewCurrent'>
	atpCurrentAction := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsModeration >> currentActionDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'CurrentAction';
		accessor: #atpCurrentAction
]
