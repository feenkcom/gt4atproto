Class {
	#name : #ComAtprotoAdminDefsImageDetails,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpWidth',
		'atpHeight'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoAdminDefsImageDetails class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
ComAtprotoAdminDefsImageDetails class >> atpFile [
 ^ 'com/atproto/admin/defs.json'
]

{ #category : #accessing }
ComAtprotoAdminDefsImageDetails class >> atpRecordName [
 ^ 'com.atproto.admin.defs#imageDetails'
]

{ #category : #accessing }
ComAtprotoAdminDefsImageDetails class >> atpSchema [
 ^ '{"type":"object","required":["width","height"],"properties":{"width":{"type":"integer"},"height":{"type":"integer"}}}'
]

{ #category : #serialization }
ComAtprotoAdminDefsImageDetails class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpWidth: (aRequest at: 'width' ifAbsent: [ nil ]);
		atpHeight: (aRequest at: 'height' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoAdminDefsImageDetails >> atpHeight [
	<atpType:#Number format:nil>
	^ atpHeight
]

{ #category : #accessing }
ComAtprotoAdminDefsImageDetails >> atpHeight: anObject [
	atpHeight := anObject
]

{ #category : #accessing }
ComAtprotoAdminDefsImageDetails >> atpWidth [
	<atpType:#Number format:nil>
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
