Class {
	#name : #ComAtprotoLabelSubscribeLabelsLabels,
	#superclass : #Object,
	#instVars : [
		'atProtoSeq',
		'atProtoLabels'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoLabelSubscribeLabelsLabels class >> fromRequest: aRequest [
	^ self new atProtoSeq: (aRequest at: 'seq' ifAbsent: [ nil ]); 
		atProtoLabels: (aRequest at: 'labels' ifAbsent: [ nil ])
]

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
	^ MANumberDescription new
		label: 'Seq';
		accessor: #atProtoSeq;
	beRequired
]
