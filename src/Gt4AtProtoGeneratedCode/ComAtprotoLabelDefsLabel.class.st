Class {
	#name : #ComAtprotoLabelDefsLabel,
	#superclass : #Object,
	#instVars : [
		'atProtoSrc',
		'atProtoUri',
		'atProtoCid',
		'atProtoVal',
		'atProtoNeg',
		'atProtoCts'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atProtoCid [
	^ atProtoCid
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atProtoCid: anObject [
	atProtoCid := anObject
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atProtoCts [
	^ atProtoCts
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atProtoCts: anObject [
	atProtoCts := anObject
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atProtoNeg [
	^ atProtoNeg
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atProtoNeg: anObject [
	atProtoNeg := anObject
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atProtoSrc [
	^ atProtoSrc
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atProtoSrc: anObject [
	atProtoSrc := anObject
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atProtoUri [
	^ atProtoUri
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atProtoUri: anObject [
	atProtoUri := anObject
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atProtoVal [
	^ atProtoVal
]

{ #category : #accessing }
ComAtprotoLabelDefsLabel >> atProtoVal: anObject [
	atProtoVal := anObject
]

{ #category : #magritte }
ComAtprotoLabelDefsLabel >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atProtoCid
]

{ #category : #magritte }
ComAtprotoLabelDefsLabel >> ctsDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cts';
		accessor: #atProtoCts;
	beRequired
]

{ #category : #magritte }
ComAtprotoLabelDefsLabel >> negDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Neg';
		accessor: #atProtoNeg
]

{ #category : #magritte }
ComAtprotoLabelDefsLabel >> srcDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Src';
		accessor: #atProtoSrc;
	beRequired
]

{ #category : #magritte }
ComAtprotoLabelDefsLabel >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atProtoUri;
	beRequired
]

{ #category : #magritte }
ComAtprotoLabelDefsLabel >> valDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Val';
		accessor: #atProtoVal;
	beRequired
]
