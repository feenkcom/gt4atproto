Class {
	#name : #ToolsOzoneSetDefsSet,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpName',
		'atpDescription'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneSetDefsSet class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ToolsOzoneSetDefsSet class >> atpFile [
 ^ 'tools/ozone/set/defs.json'
]

{ #category : #accessing }
ToolsOzoneSetDefsSet class >> atpRecordName [
 ^ 'tools.ozone.set.defs#set'
]

{ #category : #accessing }
ToolsOzoneSetDefsSet class >> atpSchema [
 ^ '{"type":"object","required":["name"],"properties":{"name":{"type":"string","minLength":3,"maxLength":128},"description":{"type":"string","maxGraphemes":1024,"maxLength":10240}}}'
]

{ #category : #serialization }
ToolsOzoneSetDefsSet class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpName: (aRequest at: 'name' ifAbsent: [ nil ]);
		atpDescription: (aRequest at: 'description' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneSetDefsSet >> atpDescription [
	<atpType:#String format:nil>
	^ atpDescription
]

{ #category : #accessing }
ToolsOzoneSetDefsSet >> atpDescription: anObject [
	atpDescription := anObject
]

{ #category : #accessing }
ToolsOzoneSetDefsSet >> atpName [
	<atpType:#String format:nil>
	^ atpName
]

{ #category : #accessing }
ToolsOzoneSetDefsSet >> atpName: anObject [
	atpName := anObject
]

{ #category : #magritte }
ToolsOzoneSetDefsSet >> descriptionDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Description';
		accessor: #atpDescription
]

{ #category : #magritte }
ToolsOzoneSetDefsSet >> nameDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Name';
		accessor: #atpName;
		beRequired
]
