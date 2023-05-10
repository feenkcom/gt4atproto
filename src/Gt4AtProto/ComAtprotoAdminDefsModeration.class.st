Class {
	#name : #ComAtprotoAdminDefsModeration,
	#superclass : #Object,
	#instVars : [
		'atProtoCurrentAction'
	],
	#category : #'Gt4AtProto-GeneratedCode'
}

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
