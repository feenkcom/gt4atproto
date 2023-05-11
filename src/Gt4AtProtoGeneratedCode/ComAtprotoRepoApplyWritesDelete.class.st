Class {
	#name : #ComAtprotoRepoApplyWritesDelete,
	#superclass : #Object,
	#instVars : [
		'atpCollection',
		'atpRkey'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoRepoApplyWritesDelete class >> fromRequest: aRequest [
	^ self new atpCollection: (aRequest at: 'collection' ifAbsent: [ nil ]); 
		atpRkey: (aRequest at: 'rkey' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesDelete >> atpCollection [
	^ atpCollection
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesDelete >> atpCollection: anObject [
	atpCollection := anObject
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesDelete >> atpRkey [
	^ atpRkey
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesDelete >> atpRkey: anObject [
	atpRkey := anObject
]

{ #category : #magritte }
ComAtprotoRepoApplyWritesDelete >> collectionDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Collection';
		accessor: #atpCollection;
	beRequired
]

{ #category : #magritte }
ComAtprotoRepoApplyWritesDelete >> rkeyDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Rkey';
		accessor: #atpRkey;
	beRequired
]
