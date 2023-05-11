Class {
	#name : #ComAtprotoAdminDefsVideoDetails,
	#superclass : #Object,
	#instVars : [
		'atProtoWidth',
		'atProtoHeight',
		'atProtoLength'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoAdminDefsVideoDetails class >> fromRequest: aRequest [
	^ self new atProtoWidth: (aRequest at: 'width' ifAbsent: [ nil ]); 
		atProtoHeight: (aRequest at: 'height' ifAbsent: [ nil ]); 
		atProtoLength: (aRequest at: 'length' ifAbsent: [ nil ])
]

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
	^ MANumberDescription new
		label: 'Height';
		accessor: #atProtoHeight;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsVideoDetails >> lengthDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Length';
		accessor: #atProtoLength;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsVideoDetails >> widthDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Width';
		accessor: #atProtoWidth;
	beRequired
]
