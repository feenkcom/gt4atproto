Class {
	#name : #ComAtprotoLabelSubscribeLabelsInfo,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpName',
		'atpMessage'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoLabelSubscribeLabelsInfo class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ComAtprotoLabelSubscribeLabelsInfo class >> atpFile [
 ^ 'com/atproto/label/subscribeLabels.json'
]

{ #category : #accessing }
ComAtprotoLabelSubscribeLabelsInfo class >> atpRecordName [
 ^ 'com.atproto.label.subscribeLabels#info'
]

{ #category : #accessing }
ComAtprotoLabelSubscribeLabelsInfo class >> atpSchema [
 ^ '{"type":"object","required":["name"],"properties":{"name":{"type":"string","knownValues":["OutdatedCursor"]},"message":{"type":"string"}}}'
]

{ #category : #serialization }
ComAtprotoLabelSubscribeLabelsInfo class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpName: (aRequest at: 'name' ifAbsent: [ nil ]);
		atpMessage: (aRequest at: 'message' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoLabelSubscribeLabelsInfo >> atpMessage [
	<atpType:#String format:nil>
	^ atpMessage
]

{ #category : #accessing }
ComAtprotoLabelSubscribeLabelsInfo >> atpMessage: anObject [
	atpMessage := anObject
]

{ #category : #accessing }
ComAtprotoLabelSubscribeLabelsInfo >> atpName [
	<atpType:#String format:nil>
	^ atpName
]

{ #category : #accessing }
ComAtprotoLabelSubscribeLabelsInfo >> atpName: anObject [
	atpName := anObject
]

{ #category : #magritte }
ComAtprotoLabelSubscribeLabelsInfo >> messageDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Message';
		accessor: #atpMessage
]

{ #category : #magritte }
ComAtprotoLabelSubscribeLabelsInfo >> nameDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Name';
		accessor: #atpName;
		beRequired
]
