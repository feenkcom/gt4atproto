Class {
	#name : #ComAtprotoLabelSubscribeLabelsInfo,
	#superclass : #Object,
	#instVars : [
		'atProtoName',
		'atProtoMessage'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoLabelSubscribeLabelsInfo class >> fromRequest: aRequest [
	^ self new atProtoName: (aRequest at: 'name' ifAbsent: [ nil ]); 
		atProtoMessage: (aRequest at: 'message' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoLabelSubscribeLabelsInfo >> atProtoMessage [
	^ atProtoMessage
]

{ #category : #accessing }
ComAtprotoLabelSubscribeLabelsInfo >> atProtoMessage: anObject [
	atProtoMessage := anObject
]

{ #category : #accessing }
ComAtprotoLabelSubscribeLabelsInfo >> atProtoName [
	^ atProtoName
]

{ #category : #accessing }
ComAtprotoLabelSubscribeLabelsInfo >> atProtoName: anObject [
	atProtoName := anObject
]

{ #category : #magritte }
ComAtprotoLabelSubscribeLabelsInfo >> messageDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Message';
		accessor: #atProtoMessage
]

{ #category : #magritte }
ComAtprotoLabelSubscribeLabelsInfo >> nameDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Name';
		accessor: #atProtoName;
	beRequired
]
