Class {
	#name : #ComAtprotoLabelSubscribeLabelsLabels,
	#superclass : #Object,
	#instVars : [
		'atpSeq',
		'atpLabels'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
ComAtprotoLabelSubscribeLabelsLabels class >> fromRequest: aRequest [
	^ self new atpSeq: (aRequest at: 'seq' ifAbsent: [ nil ]); 
		atpLabels: (aRequest at: 'labels' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoLabelSubscribeLabelsLabels >> atpLabels [
	^ atpLabels
]

{ #category : #accessing }
ComAtprotoLabelSubscribeLabelsLabels >> atpLabels: anObject [
	atpLabels := anObject
]

{ #category : #accessing }
ComAtprotoLabelSubscribeLabelsLabels >> atpSeq [
	^ atpSeq
]

{ #category : #accessing }
ComAtprotoLabelSubscribeLabelsLabels >> atpSeq: anObject [
	atpSeq := anObject
]

{ #category : #magritte }
ComAtprotoLabelSubscribeLabelsLabels >> labelsDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoLabelDefsLabel};
		label: 'Labels';
		accessor: #atpLabels;
	beRequired
]

{ #category : #magritte }
ComAtprotoLabelSubscribeLabelsLabels >> seqDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Seq';
		accessor: #atpSeq;
	beRequired
]