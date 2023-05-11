Class {
	#name : #ComAtprotoAdminDefsActionViewCurrent,
	#superclass : #Object,
	#instVars : [
		'atProtoId',
		'atProtoAction'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoAdminDefsActionViewCurrent class >> fromRequest: aRequest [
	^ self new atProtoId: (aRequest at: 'id' ifAbsent: [ nil ]); 
		atProtoAction: (aRequest at: 'action' ifPresent: [:aValue | String fromRequest: aValue ] ifAbsent: [ nil ])
]

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
	^ MANumberDescription new
		label: 'Id';
		accessor: #atProtoId;
	beRequired
]
