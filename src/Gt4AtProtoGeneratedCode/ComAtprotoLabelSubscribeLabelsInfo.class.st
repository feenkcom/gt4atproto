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
 ^ ''
]

{ #category : #accessing }
ComAtprotoLabelSubscribeLabelsInfo class >> atpRecordName [
 ^ 'com.atproto.label.subscribeLabels#info'
]

{ #category : #serialization }
ComAtprotoLabelSubscribeLabelsInfo class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpName: (aRequest at: 'name' ifAbsent: [ nil ]); 
		atpMessage: (aRequest at: 'message' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoLabelSubscribeLabelsInfo >> atpMessage [
	^ atpMessage
]

{ #category : #accessing }
ComAtprotoLabelSubscribeLabelsInfo >> atpMessage: anObject [
	atpMessage := anObject
]

{ #category : #accessing }
ComAtprotoLabelSubscribeLabelsInfo >> atpName [
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
