Class {
	#name : #ComAtprotoRepoApplyWritesDelete,
	#superclass : #Object,
	#instVars : [
		'atProtoCollection',
		'atProtoRkey'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoRepoApplyWritesDelete class >> fromRequest: aRequest [
	^ self new atProtoCollection: (aRequest at: 'collection' ifAbsent: [ nil ]); 
		atProtoRkey: (aRequest at: 'rkey' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesDelete >> atProtoCollection [
	^ atProtoCollection
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesDelete >> atProtoCollection: anObject [
	atProtoCollection := anObject
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesDelete >> atProtoRkey [
	^ atProtoRkey
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesDelete >> atProtoRkey: anObject [
	atProtoRkey := anObject
]

{ #category : #magritte }
ComAtprotoRepoApplyWritesDelete >> collectionDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Collection';
		accessor: #atProtoCollection;
	beRequired
]

{ #category : #magritte }
ComAtprotoRepoApplyWritesDelete >> rkeyDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Rkey';
		accessor: #atProtoRkey;
	beRequired
]
