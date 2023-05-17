Class {
	#name : #ComAtprotoRepoApplyWritesDelete,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpCollection',
		'atpRkey'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoRepoApplyWritesDelete class >> atpDescription [
 ^ 'Delete an existing record.'
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesDelete class >> atpFile [
 ^ 'com/atproto/repo/applyWrites.json'
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesDelete class >> atpRecordName [
 ^ 'com.atproto.repo.applyWrites#delete'
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesDelete class >> atpSchema [
 ^ '{"type":"object","description":"Delete an existing record.","required":["action","collection","rkey"],"properties":{"collection":{"type":"string","format":"nsid"},"rkey":{"type":"string"}}}'
]

{ #category : #serialization }
ComAtprotoRepoApplyWritesDelete class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpCollection: (aRequest at: 'collection' ifAbsent: [ nil ]);
		atpRkey: (aRequest at: 'rkey' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesDelete >> atpCollection [
	<atpType:#String format:'nsid'>
	^ atpCollection
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesDelete >> atpCollection: anObject [
	atpCollection := anObject
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesDelete >> atpRkey [
	<atpType:#String format:nil>
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
