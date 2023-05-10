Class {
	#name : #ComAtprotoAdminDefsActionViewCurrent,
	#superclass : #Object,
	#instVars : [
		'atProtoId',
		'atProtoAction'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #magritte }
ComAtprotoAdminDefsActionViewCurrent >> actionDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Action';
		accessor: #atProtoAction;
		beRequired
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewCurrent >> atProtoAction [
	<referenceTo:'#actionType'>
	^ atProtoAction
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewCurrent >> atProtoAction: anObject [
	<referenceTo:'#actionType'>
	atProtoAction := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewCurrent >> atProtoId [
	^ atProtoId
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewCurrent >> atProtoId: anObject [
	atProtoId := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsActionViewCurrent >> idDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Id';
		accessor: #atProtoId;
	beRequired
]
