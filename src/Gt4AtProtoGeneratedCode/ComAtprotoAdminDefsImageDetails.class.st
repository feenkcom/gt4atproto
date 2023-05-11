Class {
	#name : #ComAtprotoAdminDefsImageDetails,
	#superclass : #Object,
	#instVars : [
		'atpWidth',
		'atpHeight'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoAdminDefsImageDetails class >> fromRequest: aRequest [
	^ self new atpWidth: (aRequest at: 'width' ifAbsent: [ nil ]); 
		atpHeight: (aRequest at: 'height' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoAdminDefsImageDetails >> atpHeight [
	^ atpHeight
]

{ #category : #accessing }
ComAtprotoAdminDefsImageDetails >> atpHeight: anObject [
	atpHeight := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsImageDetails >> atpWidth [
	^ atpWidth
]

{ #category : #accessing }
ComAtprotoAdminDefsImageDetails >> atpWidth: anObject [
	atpWidth := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsImageDetails >> heightDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Height';
		accessor: #atpHeight;
	beRequired
]

{ #category : #magritte }
ComAtprotoAdminDefsImageDetails >> widthDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Width';
		accessor: #atpWidth;
	beRequired
]
