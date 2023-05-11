Class {
	#name : #ComAtprotoRepoApplyWritesCreate,
	#superclass : #Object,
	#instVars : [
		'atProtoCollection',
		'atProtoRkey',
		'atProtoValue'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoRepoApplyWritesCreate class >> fromRequest: aRequest [
	^ self new atProtoCollection: (aRequest at: 'collection' ifAbsent: [ nil ]); 
		atProtoRkey: (aRequest at: 'rkey' ifAbsent: [ nil ]); 
		atProtoValue: (aRequest at: 'value' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesCreate >> atProtoCollection [
	^ atProtoCollection
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesCreate >> atProtoCollection: anObject [
	atProtoCollection := anObject
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesCreate >> atProtoRkey [
	^ atProtoRkey
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesCreate >> atProtoRkey: anObject [
	atProtoRkey := anObject
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesCreate >> atProtoValue [
	^ atProtoValue
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesCreate >> atProtoValue: anObject [
	atProtoValue := anObject
]

{ #category : #magritte }
ComAtprotoRepoApplyWritesCreate >> collectionDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Collection';
		accessor: #atProtoCollection;
	beRequired
]

{ #category : #magritte }
ComAtprotoRepoApplyWritesCreate >> rkeyDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Rkey';
		accessor: #atProtoRkey
]

{ #category : #magritte }
ComAtprotoRepoApplyWritesCreate >> valueDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Value';
		accessor: #atProtoValue;
	beRequired
]
