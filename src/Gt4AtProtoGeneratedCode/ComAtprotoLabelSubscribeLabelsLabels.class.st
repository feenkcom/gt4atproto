Class {
	#name : #ComAtprotoLabelSubscribeLabelsLabels,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpSeq',
		'atpLabels'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoLabelSubscribeLabelsLabels class >> atpDescription [
 ^ ''
]

{ #category : #accessing }
ComAtprotoLabelSubscribeLabelsLabels class >> atpRecordName [
 ^ 'com.atproto.label.subscribeLabels#labels'
]

{ #category : #serialization }
ComAtprotoLabelSubscribeLabelsLabels class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpSeq: (aRequest at: 'seq' ifAbsent: [ nil ]); 
		atpLabels: (aRequest at: 'labels' ifPresent: [:anArray | anArray collect: [:aValue |ComAtprotoLabelDefsLabel fromRequest: aValue ] ] ifAbsent: [ nil ])
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
