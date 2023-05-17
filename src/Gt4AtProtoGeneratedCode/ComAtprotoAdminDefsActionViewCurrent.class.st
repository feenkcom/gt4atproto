Class {
	#name : #ComAtprotoAdminDefsActionViewCurrent,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpId',
		'atpAction'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoAdminDefsActionViewCurrent class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewCurrent class >> atpFile [
 ^ 'com/atproto/admin/defs.json'
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewCurrent class >> atpRecordName [
 ^ 'com.atproto.admin.defs#actionViewCurrent'
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewCurrent class >> atpSchema [
 ^ '{"type":"object","required":["id","action"],"properties":{"id":{"type":"integer"},"action":{"type":"ref","ref":"#actionType"}}}'
]

{ #category : #serialization }
ComAtprotoAdminDefsActionViewCurrent class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpId: (aRequest at: 'id' ifAbsent: [ nil ]);
		atpAction: (aRequest
				at: 'action'
				ifPresent: [ :aValue | String fromRequest: aValue ]
				ifAbsent: [ nil ])
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
	<atpType:#String format:nil>
	^ atpAction
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewCurrent >> atpAction: anObject [
	<referenceTo:'#actionType'>
	atpAction := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsActionViewCurrent >> atpId [
	<atpType:#Number format:nil>
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
