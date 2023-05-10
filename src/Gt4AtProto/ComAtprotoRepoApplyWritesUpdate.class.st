Class {
	#name : #ComAtprotoRepoApplyWritesUpdate,
	#superclass : #Object,
	#instVars : [
		'atProtoCollection',
		'atProtoRkey',
		'atProtoValue'
	],
	#category : #'Gt4AtProto-GeneratedCode'
}

{ #category : #accessing }
ComAtprotoRepoApplyWritesUpdate >> atProtoCollection [
	^ atProtoCollection
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesUpdate >> atProtoCollection: anObject [
	atProtoCollection := anObject
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesUpdate >> atProtoRkey [
	^ atProtoRkey
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesUpdate >> atProtoRkey: anObject [
	atProtoRkey := anObject
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesUpdate >> atProtoValue [
	^ atProtoValue
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesUpdate >> atProtoValue: anObject [
	atProtoValue := anObject
]

{ #category : #magritte }
ComAtprotoRepoApplyWritesUpdate >> collectionDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Collection';
		accessor: #atProtoCollection;
	beRequired
]

{ #category : #magritte }
ComAtprotoRepoApplyWritesUpdate >> rkeyDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Rkey';
		accessor: #atProtoRkey;
	beRequired
]

{ #category : #magritte }
ComAtprotoRepoApplyWritesUpdate >> valueDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Value';
		accessor: #atProtoValue;
	beRequired
]
