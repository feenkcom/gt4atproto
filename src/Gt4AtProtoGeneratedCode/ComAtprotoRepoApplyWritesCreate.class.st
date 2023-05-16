Class {
	#name : #ComAtprotoRepoApplyWritesCreate,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpCollection',
		'atpRkey',
		'atpValue'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoRepoApplyWritesCreate class >> atpDescription [
 ^ 'Create a new record.'
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesCreate class >> atpFile [
 ^ 'com/atproto/repo/applyWrites.json'
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesCreate class >> atpRecordName [
 ^ 'com.atproto.repo.applyWrites#create'
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesCreate class >> atpSchema [
 ^ '{"type":"object","description":"Create a new record.","required":["action","collection","value"],"properties":{"collection":{"type":"string","format":"nsid"},"rkey":{"type":"string"},"value":{"type":"unknown"}}}'
]

{ #category : #serialization }
ComAtprotoRepoApplyWritesCreate class >> fromRequest: aRequest [
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
ComAtprotoRepoApplyWritesCreate >> atpCollection [
	<atpType:'string' format:'nsid'>
	^ atpCollection
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesCreate >> atpCollection: anObject [
	atpCollection := anObject
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesCreate >> atpRkey [
	<atpType:'string' format:nil>
	^ atpRkey
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesCreate >> atpRkey: anObject [
	atpRkey := anObject
]

{ #category : #accessing }
ComAtprotoRepoApplyWritesCreate >> atpValue [
	<atpType:#Object format:nil>
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
