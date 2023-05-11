Class {
	#name : #ComAtprotoAdminDefsImageDetails,
	#superclass : #Object,
	#instVars : [
		'atProtoWidth',
		'atProtoHeight'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoAdminDefsImageDetails class >> fromRequest: aRequest [
	^ self new atProtoWidth: (aRequest at: 'width' ifAbsent: [ nil ]); 
		atProtoHeight: (aRequest at: 'height' ifAbsent: [ nil ])
]

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
	^ MANumberDescription new
		label: 'Height';
		accessor: #atProtoHeight;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsImageDetails >> widthDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Width';
		accessor: #atProtoWidth;
	beRequired
]
