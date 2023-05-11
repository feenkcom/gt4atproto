Class {
	#name : #ComAtprotoAdminDefsModeration,
	#superclass : #Object,
	#instVars : [
		'atProtoCurrentAction'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoAdminDefsModeration class >> fromRequest: aRequest [
	^ self new atProtoCurrentAction: (aRequest at: 'currentAction' ifPresent: [:aValue | ComAtprotoAdminDefsActionViewCurrent fromRequest: aValue ] ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoAdminDefsModeration >> atProtoCurrentAction [
	<referenceTo:'#actionViewCurrent'>
	^ atProtoCurrentAction
]

{ #category : #accessing }
ComAtprotoAdminDefsModeration >> atProtoCurrentAction: anObject [
	<referenceTo:'#actionViewCurrent'>
	atProtoCurrentAction := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsModeration >> currentActionDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'CurrentAction';
		accessor: #atProtoCurrentAction
]
