Class {
	#name : #ComAtprotoLabelSubscribeLabelsLabels,
	#superclass : #Object,
	#instVars : [
		'atProtoSeq',
		'atProtoLabels'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoLabelSubscribeLabelsLabels >> atProtoLabels [
	^ atProtoLabels
]

{ #category : #accessing }
ComAtprotoLabelSubscribeLabelsLabels >> atProtoLabels: anObject [
	atProtoLabels := anObject
]

{ #category : #accessing }
ComAtprotoLabelSubscribeLabelsLabels >> atProtoSeq [
	^ atProtoSeq
]

{ #category : #accessing }
ComAtprotoLabelSubscribeLabelsLabels >> atProtoSeq: anObject [
	atProtoSeq := anObject
]

{ #category : #magritte }
ComAtprotoLabelSubscribeLabelsLabels >> labelsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoLabelDefsLabel};
		label: 'Labels';
		accessor: #atProtoLabels;
	beRequired
]

{ #category : #magritte }
ComAtprotoLabelSubscribeLabelsLabels >> seqDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Seq';
		accessor: #atProtoSeq;
	beRequired
]
