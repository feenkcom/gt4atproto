Class {
	#name : #ComAtprotoLabelDefsSelfLabel,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpVal'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoLabelDefsSelfLabel class >> atpDescription [
 ^ 'Metadata tag on an atproto record, published by the author within the record. Note -- schemas should use #selfLabels, not #selfLabel.'
]

{ #category : #accessing }
ComAtprotoLabelDefsSelfLabel class >> atpFile [
 ^ 'com/atproto/label/defs.json'
]

{ #category : #accessing }
ComAtprotoLabelDefsSelfLabel class >> atpRecordName [
 ^ 'com.atproto.label.defs#selfLabel'
]

{ #category : #accessing }
ComAtprotoLabelDefsSelfLabel class >> atpSchema [
 ^ '{"type":"object","description":"Metadata tag on an atproto record, published by the author within the record. Note -- schemas should use #selfLabels, not #selfLabel.","required":["val"],"properties":{"val":{"type":"string","maxLength":128,"description":"the short string name of the value or type of this label"}}}'
]

{ #category : #serialization }
ComAtprotoLabelDefsSelfLabel class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpVal: (aRequest at: 'val' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoLabelDefsSelfLabel >> atpVal [
	<atpType:#String format:nil>
	^ atpVal
]

{ #category : #accessing }
ComAtprotoLabelDefsSelfLabel >> atpVal: anObject [
	atpVal := anObject
]

{ #category : #magritte }
ComAtprotoLabelDefsSelfLabel >> valDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Val';
		accessor: #atpVal;
		beRequired
]
