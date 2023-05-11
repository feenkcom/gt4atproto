Class {
	#name : #ComAtprotoRepoApplyWritesUpdate,
	#superclass : #Object,
	#instVars : [
		'atpCollection',
		'atpRkey',
		'atpValue'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoRepoApplyWritesUpdate class >> fromRequest: aRequest [
	^ self new atpCollection: (aRequest at: 'collection' ifAbsent: [ nil ]); 
		atpRkey: (aRequest at: 'rkey' ifAbsent: [ nil ]); 
		atpValue: (aRequest at: 'value' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesUpdate >> atpCollection [
	^ atpCollection
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesUpdate >> atpCollection: anObject [
	atpCollection := anObject
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesUpdate >> atpRkey [
	^ atpRkey
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesUpdate >> atpRkey: anObject [
	atpRkey := anObject
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesUpdate >> atpValue [
	^ atpValue
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesUpdate >> atpValue: anObject [
	atpValue := anObject
]

{ #category : #magritte }
ComAtprotoRepoApplyWritesUpdate >> collectionDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Collection';
		accessor: #atpCollection;
	beRequired
]

{ #category : #magritte }
ComAtprotoRepoApplyWritesUpdate >> rkeyDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Rkey';
		accessor: #atpRkey;
	beRequired
]

{ #category : #magritte }
ComAtprotoRepoApplyWritesUpdate >> valueDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Value';
		accessor: #atpValue;
	beRequired
]
