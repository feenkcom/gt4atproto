Class {
	#name : #ComAtprotoRepoStrongRefMain,
	#superclass : #Object,
	#instVars : [
		'atProtoUri',
		'atProtoCid'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoRepoStrongRefMain class >> fromRequest: aRequest [
	^ self new atProtoUri: (aRequest at: 'uri' ifAbsent: [ nil ]); 
		atProtoCid: (aRequest at: 'cid' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoRepoStrongRefMain >> atProtoCid [
	^ atProtoCid
]

{ #category : #accessing }
ComAtprotoRepoStrongRefMain >> atProtoCid: anObject [
	atProtoCid := anObject
]

{ #category : #accessing }
ComAtprotoRepoStrongRefMain >> atProtoUri [
	^ atProtoUri
]

{ #category : #accessing }
ComAtprotoRepoStrongRefMain >> atProtoUri: anObject [
	atProtoUri := anObject
]

{ #category : #magritte }
ComAtprotoRepoStrongRefMain >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atProtoCid;
	beRequired
]

{ #category : #magritte }
ComAtprotoRepoStrongRefMain >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atProtoUri;
	beRequired
]
