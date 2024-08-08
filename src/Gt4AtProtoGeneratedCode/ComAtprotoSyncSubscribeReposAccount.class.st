Class {
	#name : #ComAtprotoSyncSubscribeReposAccount,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpSeq',
		'atpDid',
		'atpTime',
		'atpActive',
		'atpStatus'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoSyncSubscribeReposAccount class >> atpDescription [
 ^  'Represents a change to an account''s status on a host (eg, PDS or Relay). The semantics of this event are that the status is at the host which emitted the event, not necessarily that at the currently active PDS. Eg, a Relay takedown would emit a takedown with active=false, even if the PDS is still active.'
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposAccount class >> atpFile [
 ^ 'com/atproto/sync/subscribeRepos.json'
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposAccount class >> atpRecordName [
 ^ 'com.atproto.sync.subscribeRepos#account'
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposAccount class >> atpSchema [
 ^ '{"type":"object","description":"Represents a change to an account''s status on a host (eg, PDS or Relay). The semantics of this event are that the status is at the host which emitted the event, not necessarily that at the currently active PDS. Eg, a Relay takedown would emit a takedown with active=false, even if the PDS is still active.","required":["seq","did","time","active"],"properties":{"seq":{"type":"integer"},"did":{"type":"string","format":"did"},"time":{"type":"string","format":"datetime"},"active":{"type":"boolean","description":"Indicates that the account has a repository which can be fetched from the host that emitted this event."},"status":{"type":"string","description":"If active=false, this optional field indicates a reason for why the account is not active.","knownValues":["takendown","suspended","deleted","deactivated"]}}}'
]

{ #category : #serialization }
ComAtprotoSyncSubscribeReposAccount class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpSeq: (aRequest at: 'seq' ifAbsent: [ nil ]);
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ]);
		atpTime: (aRequest at: 'time' ifAbsent: [ nil ]);
		atpActive: (aRequest at: 'active' ifAbsent: [ nil ]);
		atpStatus: (aRequest at: 'status' ifAbsent: [ nil ])
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposAccount >> activeDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Active';
		accessor: #atpActive;
		beRequired
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposAccount >> atpActive [
	<atpType:#Boolean format:nil>
	^ atpActive
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposAccount >> atpActive: anObject [
	atpActive := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposAccount >> atpDid [
	<atpType:#String format:'did'>
	^ atpDid
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposAccount >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposAccount >> atpSeq [
	<atpType:#Number format:nil>
	^ atpSeq
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposAccount >> atpSeq: anObject [
	atpSeq := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposAccount >> atpStatus [
	<atpType:#String format:nil>
	^ atpStatus
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposAccount >> atpStatus: anObject [
	atpStatus := anObject
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposAccount >> atpTime [
	<atpType:#String format:'datetime'>
	^ atpTime
]

{ #category : #accessing }
ComAtprotoSyncSubscribeReposAccount >> atpTime: anObject [
	atpTime := anObject
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposAccount >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid;
		beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposAccount >> seqDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Seq';
		accessor: #atpSeq;
		beRequired
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposAccount >> statusDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Status';
		accessor: #atpStatus
]

{ #category : #magritte }
ComAtprotoSyncSubscribeReposAccount >> timeDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Time';
		accessor: #atpTime;
		beRequired
]
