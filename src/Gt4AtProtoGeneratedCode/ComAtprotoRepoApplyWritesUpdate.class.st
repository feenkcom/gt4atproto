Class {
	#name : #ComAtprotoRepoApplyWritesUpdate,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpCollection',
		'atpRkey',
		'atpValue'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoRepoApplyWritesUpdate class >> atpDescription [
 ^ 'Update an existing record.'
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesUpdate class >> atpFile [
 ^ 'com/atproto/repo/applyWrites.json'
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesUpdate class >> atpRecordName [
 ^ 'com.atproto.repo.applyWrites#update'
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesUpdate class >> atpSchema [
 ^ '{"type":"object","description":"Update an existing record.","required":["action","collection","rkey","value"],"properties":{"collection":{"type":"string","format":"nsid"},"rkey":{"type":"string"},"value":{"type":"unknown"}}}'
]

{ #category : #serialization }
ComAtprotoRepoApplyWritesUpdate class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpCollection: (aRequest at: 'collection' ifAbsent: [ nil ]);
		atpRkey: (aRequest at: 'rkey' ifAbsent: [ nil ]);
		atpValue: (aRequest
				at: 'value'
				ifPresent: [ :aValue | GtApModelEntity findForRequest: aValue ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesUpdate >> atpCollection [
	<atpType:#String format:'nsid'>
	^ atpCollection
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesUpdate >> atpCollection: anObject [
	atpCollection := anObject
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesUpdate >> atpRkey [
	<atpType:#String format:nil>
	^ atpRkey
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesUpdate >> atpRkey: anObject [
	atpRkey := anObject
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesUpdate >> atpValue [
	<atpType:#Object format:nil>
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
