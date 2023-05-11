Class {
	#name : #ComAtprotoLabelDefsLabel,
	#superclass : #Object,
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

{ #category : #serialization }
ComAtprotoLabelDefsLabel class >> fromRequest: aRequest [
	^ self new atpSrc: (aRequest at: 'src' ifAbsent: [ nil ]); 
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
