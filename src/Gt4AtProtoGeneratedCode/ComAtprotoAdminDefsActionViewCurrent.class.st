Class {
	#name : #ComAtprotoAdminDefsActionViewCurrent,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpId',
		'atpAction'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoAdminDefsActionViewCurrent class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpId: (aRequest at: 'id' ifAbsent: [ nil ]); 
		atpAction: (aRequest at: 'action' ifPresent: [:aValue | String fromRequest: aValue ] ifAbsent: [ nil ])
]

{ #category : #magritte }
ComAtprotoAdminDefsActionViewCurrent >> actionDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Action';
		accessor: #atpAction;
		beRequired
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewCurrent >> atpAction [
	<referenceTo:'#actionType'>
	^ atpAction
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewCurrent >> atpAction: anObject [
	<referenceTo:'#actionType'>
	atpAction := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewCurrent >> atpId [
	^ atpId
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewCurrent >> atpId: anObject [
	atpId := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsActionViewCurrent >> idDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Id';
		accessor: #atpId;
	beRequired
]
