Class {
	#name : #ComAtprotoAdminDefsImageDetails,
	#superclass : #Object,
	#instVars : [
		'atProtoWidth',
		'atProtoHeight'
	],
	#category : #'Gt4AtProto-GeneratedCode'
}

{ #category : #accessing }
ComAtprotoAdminDefsImageDetails >> atProtoHeight [
	^ atProtoHeight
]

{ #category : #accessing }
ComAtprotoAdminDefsImageDetails >> atProtoHeight: anObject [
	atProtoHeight := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsImageDetails >> atProtoWidth [
	^ atProtoWidth
]

{ #category : #accessing }
ComAtprotoAdminDefsImageDetails >> atProtoWidth: anObject [
	atProtoWidth := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsImageDetails >> heightDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Height';
		accessor: #atProtoHeight;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsImageDetails >> widthDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Width';
		accessor: #atProtoWidth;
	beRequired
]
