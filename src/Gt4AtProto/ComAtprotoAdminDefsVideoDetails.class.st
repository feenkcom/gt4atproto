Class {
	#name : #ComAtprotoAdminDefsVideoDetails,
	#superclass : #Object,
	#instVars : [
		'atProtoWidth',
		'atProtoHeight',
		'atProtoLength'
	],
	#category : #'Gt4AtProto-GeneratedCode'
}

{ #category : #accessing }
ComAtprotoAdminDefsVideoDetails >> atProtoHeight [
	^ atProtoHeight
]

{ #category : #accessing }
ComAtprotoAdminDefsVideoDetails >> atProtoHeight: anObject [
	atProtoHeight := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsVideoDetails >> atProtoLength [
	^ atProtoLength
]

{ #category : #accessing }
ComAtprotoAdminDefsVideoDetails >> atProtoLength: anObject [
	atProtoLength := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsVideoDetails >> atProtoWidth [
	^ atProtoWidth
]

{ #category : #accessing }
ComAtprotoAdminDefsVideoDetails >> atProtoWidth: anObject [
	atProtoWidth := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsVideoDetails >> heightDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Height';
		accessor: #atProtoHeight;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsVideoDetails >> lengthDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Length';
		accessor: #atProtoLength;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsVideoDetails >> widthDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Width';
		accessor: #atProtoWidth;
	beRequired
]
