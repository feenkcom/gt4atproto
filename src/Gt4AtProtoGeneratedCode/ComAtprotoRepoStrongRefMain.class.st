Class {
	#name : #ComAtprotoRepoStrongRefMain,
	#superclass : #Object,
	#instVars : [
		'atpUri',
		'atpCid'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoRepoStrongRefMain class >> fromRequest: aRequest [
	^ self new atpUri: (aRequest at: 'uri' ifAbsent: [ nil ]); 
		atpCid: (aRequest at: 'cid' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoRepoStrongRefMain >> atpCid [
	^ atpCid
]

{ #category : #accessing }
ComAtprotoRepoStrongRefMain >> atpCid: anObject [
	atpCid := anObject
]

{ #category : #accessing }
ComAtprotoRepoStrongRefMain >> atpUri [
	^ atpUri
]

{ #category : #accessing }
ComAtprotoRepoStrongRefMain >> atpUri: anObject [
	atpUri := anObject
]

{ #category : #magritte }
ComAtprotoRepoStrongRefMain >> cidDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Cid';
		accessor: #atpCid;
	beRequired
]

{ #category : #magritte }
ComAtprotoRepoStrongRefMain >> uriDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Uri';
		accessor: #atpUri;
	beRequired
]
