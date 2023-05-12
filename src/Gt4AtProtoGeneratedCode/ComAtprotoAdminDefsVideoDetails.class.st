Class {
	#name : #ComAtprotoAdminDefsVideoDetails,
	#superclass : #Object,
	#instVars : [
		'atpWidth',
		'atpHeight',
		'atpLength'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoAdminDefsVideoDetails class >> fromRequest: aRequest [
	^ self new atpWidth: (aRequest at: 'width' ifAbsent: [ nil ]); 
		atpHeight: (aRequest at: 'height' ifAbsent: [ nil ]); 
		atpLength: (aRequest at: 'length' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoAdminDefsVideoDetails >> atpHeight [
	^ atpHeight
]

{ #category : #accessing }
ComAtprotoAdminDefsVideoDetails >> atpHeight: anObject [
	atpHeight := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsVideoDetails >> atpLength [
	^ atpLength
]

{ #category : #accessing }
ComAtprotoAdminDefsVideoDetails >> atpLength: anObject [
	atpLength := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsVideoDetails >> atpWidth [
	^ atpWidth
]

{ #category : #accessing }
ComAtprotoAdminDefsVideoDetails >> atpWidth: anObject [
	atpWidth := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsVideoDetails >> heightDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Height';
		accessor: #atpHeight;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsVideoDetails >> lengthDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Length';
		accessor: #atpLength;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsVideoDetails >> widthDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Width';
		accessor: #atpWidth;
	beRequired
]