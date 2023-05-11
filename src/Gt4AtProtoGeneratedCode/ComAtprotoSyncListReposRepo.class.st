Class {
	#name : #ComAtprotoSyncListReposRepo,
	#superclass : #Object,
	#instVars : [
		'atProtoDid',
		'atProtoHead'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoSyncListReposRepo class >> fromRequest: aRequest [
	^ self new atProtoDid: (aRequest at: 'did' ifAbsent: [ nil ]); 
		atProtoHead: (aRequest at: 'head' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoSyncListReposRepo >> atProtoDid [
	^ atProtoDid
]

{ #category : #accessing }
ComAtprotoSyncListReposRepo >> atProtoDid: anObject [
	atProtoDid := anObject
]

{ #category : #accessing }
ComAtprotoSyncListReposRepo >> atProtoHead [
	^ atProtoHead
]

{ #category : #accessing }
ComAtprotoSyncListReposRepo >> atProtoHead: anObject [
	atProtoHead := anObject
]

{ #category : #magritte }
ComAtprotoSyncListReposRepo >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atProtoDid;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncListReposRepo >> headDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Head';
		accessor: #atProtoHead;
	beRequired
]
