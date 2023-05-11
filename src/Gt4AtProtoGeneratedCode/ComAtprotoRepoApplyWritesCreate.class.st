Class {
	#name : #ComAtprotoRepoApplyWritesCreate,
	#superclass : #Object,
	#instVars : [
		'atpCollection',
		'atpRkey',
		'atpValue'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoRepoApplyWritesCreate class >> fromRequest: aRequest [
	^ self new atpCollection: (aRequest at: 'collection' ifAbsent: [ nil ]); 
		atpRkey: (aRequest at: 'rkey' ifAbsent: [ nil ]); 
		atpValue: (aRequest at: 'value' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesCreate >> atpCollection [
	^ atpCollection
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesCreate >> atpCollection: anObject [
	atpCollection := anObject
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesCreate >> atpRkey [
	^ atpRkey
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesCreate >> atpRkey: anObject [
	atpRkey := anObject
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesCreate >> atpValue [
	^ atpValue
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesCreate >> atpValue: anObject [
	atpValue := anObject
]

{ #category : #magritte }
ComAtprotoRepoApplyWritesCreate >> collectionDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Collection';
		accessor: #atpCollection;
	beRequired
]

{ #category : #magritte }
ComAtprotoRepoApplyWritesCreate >> rkeyDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Rkey';
		accessor: #atpRkey
]

{ #category : #magritte }
ComAtprotoRepoApplyWritesCreate >> valueDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Value';
		accessor: #atpValue;
	beRequired
]
