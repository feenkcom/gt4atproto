Class {
	#name : #ComAtprotoAdminDefsModeration,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpCurrentAction'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoAdminDefsModeration class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
ComAtprotoAdminDefsModeration class >> atpFile [
 ^ 'com/atproto/admin/defs.json'
]

{ #category : #accessing }
ComAtprotoAdminDefsModeration class >> atpRecordName [
 ^ 'com.atproto.admin.defs#moderation'
]

{ #category : #accessing }
ComAtprotoAdminDefsModeration class >> atpSchema [
 ^ '{"type":"object","required":[],"properties":{"currentAction":{"type":"ref","ref":"#actionViewCurrent"}}}'
]

{ #category : #serialization }
ComAtprotoAdminDefsModeration class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpCurrentAction: (aRequest
				at: 'currentAction'
				ifPresent: [ :aValue | ComAtprotoAdminDefsActionViewCurrent fromRequest: aValue ]
				ifAbsent: [ nil ])
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
