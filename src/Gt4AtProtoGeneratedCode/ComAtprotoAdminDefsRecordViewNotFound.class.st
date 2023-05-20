Class {
	#name : #ComAtprotoAdminDefsRecordViewNotFound,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpUri'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewNotFound class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewNotFound class >> atpFile [
 ^ 'com/atproto/admin/defs.json'
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewNotFound class >> atpRecordName [
 ^ 'com.atproto.admin.defs#recordViewNotFound'
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewNotFound class >> atpSchema [
 ^ '{"type":"object","required":["uri"],"properties":{"uri":{"type":"string","format":"at-uri"}}}'
]

{ #category : #serialization }
ComAtprotoAdminDefsRecordViewNotFound class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewNotFound >> atpUri [
	<atpType:#String format:'at-uri'>
	^ atpUri
]

{ #category : #accessing }
ComAtprotoAdminDefsRecordViewNotFound >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #magritte }
ComAtprotoAdminDefsRecordViewNotFound >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
		beRequired
]
