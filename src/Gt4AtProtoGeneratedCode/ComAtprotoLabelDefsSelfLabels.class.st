Class {
	#name : #ComAtprotoLabelDefsSelfLabels,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpValues'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoLabelDefsSelfLabels class >> atpDescription [
 ^  'Metadata tags on an atproto record, published by the author within the record.'
]

{ #category : #accessing }
ComAtprotoLabelDefsSelfLabels class >> atpFile [
 ^ 'com/atproto/label/defs.json'
]

{ #category : #accessing }
ComAtprotoLabelDefsSelfLabels class >> atpRecordName [
 ^ 'com.atproto.label.defs#selfLabels'
]

{ #category : #accessing }
ComAtprotoLabelDefsSelfLabels class >> atpSchema [
 ^ '{"type":"object","description":"Metadata tags on an atproto record, published by the author within the record.","required":["values"],"properties":{"values":{"type":"array","items":{"type":"ref","ref":"#selfLabel"},"maxLength":10}}}'
]

{ #category : #serialization }
ComAtprotoLabelDefsSelfLabels class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpValues: (aRequest
				at: 'values'
				ifPresent: [ :anArray | anArray collect: [ :aValue | ComAtprotoLabelDefsSelfLabel fromRequest: aValue ] ]
				ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoLabelDefsSelfLabels >> atpValues [
	<atpType:#ComAtprotoLabelDefsSelfLabel format:nil>
	<atpCollection>
	^ atpValues
]

{ #category : #accessing }
ComAtprotoLabelDefsSelfLabels >> atpValues: anObject [
	atpValues := anObject
]

{ #category : #magritte }
ComAtprotoLabelDefsSelfLabels >> valuesDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoLabelDefsSelfLabel};
		label: 'Values';
		accessor: #atpValues;
		beRequired
]
