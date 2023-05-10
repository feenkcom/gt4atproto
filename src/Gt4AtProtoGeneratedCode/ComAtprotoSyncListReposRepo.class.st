Class {
	#name : #ComAtprotoSyncListReposRepo,
	#superclass : #Object,
	#instVars : [
		'atProtoDid',
		'atProtoHead'
	],
	#category : #Gt4AtProtoGeneratedCode
}

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
