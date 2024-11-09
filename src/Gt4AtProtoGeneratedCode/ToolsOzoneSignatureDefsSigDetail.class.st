Class {
	#name : #ToolsOzoneSignatureDefsSigDetail,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpProperty',
		'atpValue'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneSignatureDefsSigDetail class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ToolsOzoneSignatureDefsSigDetail class >> atpFile [
 ^ 'tools/ozone/signature/defs.json'
]

{ #category : #accessing }
ToolsOzoneSignatureDefsSigDetail class >> atpRecordName [
 ^ 'tools.ozone.signature.defs#sigDetail'
]

{ #category : #accessing }
ToolsOzoneSignatureDefsSigDetail class >> atpSchema [
 ^ '{"type":"object","required":["property","value"],"properties":{"property":{"type":"string"},"value":{"type":"string"}}}'
]

{ #category : #serialization }
ToolsOzoneSignatureDefsSigDetail class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpProperty: (aRequest at: 'property' ifAbsent: [ nil ]);
		atpValue: (aRequest at: 'value' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneSignatureDefsSigDetail >> atpProperty [
	<atpType:#String format:nil>
	^ atpProperty
]

{ #category : #accessing }
ToolsOzoneSignatureDefsSigDetail >> atpProperty: anObject [
	atpProperty := anObject
]

{ #category : #accessing }
ToolsOzoneSignatureDefsSigDetail >> atpValue [
	<atpType:#String format:nil>
	^ atpValue
]

{ #category : #accessing }
ToolsOzoneSignatureDefsSigDetail >> atpValue: anObject [
	atpValue := anObject
]

{ #category : #magritte }
ToolsOzoneSignatureDefsSigDetail >> propertyDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Property';
		accessor: #atpProperty;
		beRequired
]

{ #category : #magritte }
ToolsOzoneSignatureDefsSigDetail >> valueDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Value';
		accessor: #atpValue;
		beRequired
]
