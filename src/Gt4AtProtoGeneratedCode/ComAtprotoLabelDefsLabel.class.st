Class {
	#name : #ComAtprotoLabelDefsLabel,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpSrc',
		'atpUri',
		'atpCid',
		'atpVal',
		'atpNeg',
		'atpCts'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoLabelDefsLabel class >> atpDescription [
 ^ 'Metadata tag on an atproto resource (eg, repo or record)'
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel class >> atpFile [
 ^ 'com/atproto/label/defs.json'
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel class >> atpRecordName [
 ^ 'com.atproto.label.defs#label'
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel class >> atpSchema [
 ^ '{"type":"object","description":"Metadata tag on an atproto resource (eg, repo or record)","required":["src","uri","val","cts"],"properties":{"src":{"type":"string","format":"did","description":"DID of the actor who created this label"},"uri":{"type":"string","format":"uri","description":"AT URI of the record, repository (account), or other resource which this label applies to"},"cid":{"type":"string","format":"cid","description":"optionally, CID specifying the specific version of ''uri'' resource this label applies to"},"val":{"type":"string","maxLength":128,"description":"the short string name of the value or type of this label"},"neg":{"type":"boolean","description":"if true, this is a negation label, overwriting a previous label"},"cts":{"type":"string","format":"datetime","description":"timestamp when this label was created"}}}'
]

{ #category : #serialization }
ComAtprotoLabelDefsLabel class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpSrc: (aRequest at: 'src' ifAbsent: [ nil ]); 
		atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]); 
		atpCid: (aRequest at: 'cid' ifAbsent: [ nil ]); 
		atpVal: (aRequest at: 'val' ifAbsent: [ nil ]); 
		atpNeg: (aRequest at: 'neg' ifAbsent: [ nil ]); 
		atpCts: (aRequest at: 'cts' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atpCid [
	^ atpCid
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atpCts [
	^ atpCts
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atpCts: anObject [
	atpCts := anObject
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atpNeg [
	^ atpNeg
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atpNeg: anObject [
	atpNeg := anObject
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atpSrc [
	^ atpSrc
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atpSrc: anObject [
	atpSrc := anObject
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atpUri [
	^ atpUri
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atpVal [
	^ atpVal
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atpVal: anObject [
	atpVal := anObject
]

{ #category : #magritte }
ComAtprotoLabelDefsLabel >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atpCid
]

{ #category : #magritte }
ComAtprotoLabelDefsLabel >> ctsDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cts';
		accessor: #atpCts;
	beRequired
]

{ #category : #magritte }
ComAtprotoLabelDefsLabel >> negDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Neg';
		accessor: #atpNeg
]

{ #category : #magritte }
ComAtprotoLabelDefsLabel >> srcDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Src';
		accessor: #atpSrc;
	beRequired
]

{ #category : #magritte }
ComAtprotoLabelDefsLabel >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
	beRequired
]

{ #category : #magritte }
ComAtprotoLabelDefsLabel >> valDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Val';
		accessor: #atpVal;
	beRequired
]
