Class {
	#name : #AppBskyVideoDefsJobStatus,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpJobId',
		'atpDid',
		'atpState',
		'atpProgress',
		'atpBlob',
		'atpError',
		'atpMessage'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyVideoDefsJobStatus class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyVideoDefsJobStatus class >> atpFile [
 ^ 'app/bsky/video/defs.json'
]

{ #category : #accessing }
AppBskyVideoDefsJobStatus class >> atpRecordName [
 ^ 'app.bsky.video.defs#jobStatus'
]

{ #category : #accessing }
AppBskyVideoDefsJobStatus class >> atpSchema [
 ^ '{"type":"object","required":["jobId","did","state"],"properties":{"jobId":{"type":"string"},"did":{"type":"string","format":"did"},"state":{"type":"string","description":"The state of the video processing job. All values not listed as a known value indicate that the job is in process.","knownValues":["JOB_STATE_COMPLETED","JOB_STATE_FAILED"]},"progress":{"type":"integer","minimum":0,"maximum":100,"description":"Progress within the current processing state."},"blob":{"type":"blob"},"error":{"type":"string"},"message":{"type":"string"}}}'
]

{ #category : #serialization }
AppBskyVideoDefsJobStatus class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpJobId: (aRequest at: 'jobId' ifAbsent: [ nil ]);
		atpDid: (aRequest at: 'did' ifAbsent: [ nil ]);
		atpState: (aRequest at: 'state' ifAbsent: [ nil ]);
		atpProgress: (aRequest at: 'progress' ifAbsent: [ nil ]);
		atpBlob: (aRequest at: 'blob' ifAbsent: [ nil ]);
		atpError: (aRequest at: 'error' ifAbsent: [ nil ]);
		atpMessage: (aRequest at: 'message' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyVideoDefsJobStatus >> atpBlob [
	<atpType:#ByteArray format:nil>
	^ atpBlob
]

{ #category : #accessing }
AppBskyVideoDefsJobStatus >> atpBlob: anObject [
	atpBlob := anObject
]

{ #category : #accessing }
AppBskyVideoDefsJobStatus >> atpDid [
	<atpType:#String format:'did'>
	^ atpDid
]

{ #category : #accessing }
AppBskyVideoDefsJobStatus >> atpDid: anObject [
	atpDid := anObject
]

{ #category : #accessing }
AppBskyVideoDefsJobStatus >> atpError [
	<atpType:#String format:nil>
	^ atpError
]

{ #category : #accessing }
AppBskyVideoDefsJobStatus >> atpError: anObject [
	atpError := anObject
]

{ #category : #accessing }
AppBskyVideoDefsJobStatus >> atpJobId [
	<atpType:#String format:nil>
	^ atpJobId
]

{ #category : #accessing }
AppBskyVideoDefsJobStatus >> atpJobId: anObject [
	atpJobId := anObject
]

{ #category : #accessing }
AppBskyVideoDefsJobStatus >> atpMessage [
	<atpType:#String format:nil>
	^ atpMessage
]

{ #category : #accessing }
AppBskyVideoDefsJobStatus >> atpMessage: anObject [
	atpMessage := anObject
]

{ #category : #accessing }
AppBskyVideoDefsJobStatus >> atpProgress [
	<atpType:#Number format:nil>
	^ atpProgress
]

{ #category : #accessing }
AppBskyVideoDefsJobStatus >> atpProgress: anObject [
	atpProgress := anObject
]

{ #category : #accessing }
AppBskyVideoDefsJobStatus >> atpState [
	<atpType:#String format:nil>
	^ atpState
]

{ #category : #accessing }
AppBskyVideoDefsJobStatus >> atpState: anObject [
	atpState := anObject
]

{ #category : #magritte }
AppBskyVideoDefsJobStatus >> blobDescription [
	<magritteDescription>
	^ MAFileDescription new
		label: 'Blob';
		accessor: #atpBlob
]

{ #category : #magritte }
AppBskyVideoDefsJobStatus >> didDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Did';
		accessor: #atpDid;
		beRequired
]

{ #category : #magritte }
AppBskyVideoDefsJobStatus >> errorDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Error';
		accessor: #atpError
]

{ #category : #magritte }
AppBskyVideoDefsJobStatus >> jobIdDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'JobId';
		accessor: #atpJobId;
		beRequired
]

{ #category : #magritte }
AppBskyVideoDefsJobStatus >> messageDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Message';
		accessor: #atpMessage
]

{ #category : #magritte }
AppBskyVideoDefsJobStatus >> progressDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Progress';
		accessor: #atpProgress
]

{ #category : #magritte }
AppBskyVideoDefsJobStatus >> stateDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'State';
		accessor: #atpState;
		beRequired
]
