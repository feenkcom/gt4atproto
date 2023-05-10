Class {
	#name : #ComAtprotoLabelSubscribeLabelsInfo,
	#superclass : #Object,
	#instVars : [
		'atProtoName',
		'atProtoMessage'
	],
	#category : #'Gt4AtProto-GeneratedCode'
}

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
