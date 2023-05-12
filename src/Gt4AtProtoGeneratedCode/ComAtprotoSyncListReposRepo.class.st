Class {
	#name : #ComAtprotoSyncListReposRepo,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpDid',
		'atpHead'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoSyncListReposRepo class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ]); 
		atpHead: (aRequest at: 'head' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoSyncListReposRepo >> atpDid [
	^ atpDid
]

{ #category : #accessing }
ComAtprotoSyncListReposRepo >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #accessing }
ComAtprotoSyncListReposRepo >> atpHead [
	^ atpHead
]

{ #category : #accessing }
ComAtprotoSyncListReposRepo >> atpHead: anObject [
	atpHead := anObject
]

{ #category : #magritte }
ComAtprotoSyncListReposRepo >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid;
	beRequired
]

{ #category : #magritte }
ComAtprotoSyncListReposRepo >> headDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Head';
		accessor: #atpHead;
	beRequired
]
