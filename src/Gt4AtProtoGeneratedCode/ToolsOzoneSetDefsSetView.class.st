Class {
	#name : #ToolsOzoneSetDefsSetView,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpName',
		'atpDescription',
		'atpSetSize',
		'atpCreatedAt',
		'atpUpdatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneSetDefsSetView class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ToolsOzoneSetDefsSetView class >> atpFile [
 ^ 'tools/ozone/set/defs.json'
]

{ #category : #accessing }
ToolsOzoneSetDefsSetView class >> atpRecordName [
 ^ 'tools.ozone.set.defs#setView'
]

{ #category : #accessing }
ToolsOzoneSetDefsSetView class >> atpSchema [
 ^ '{"type":"object","required":["name","setSize","createdAt","updatedAt"],"properties":{"name":{"type":"string","minLength":3,"maxLength":128},"description":{"type":"string","maxGraphemes":1024,"maxLength":10240},"setSize":{"type":"integer"},"createdAt":{"type":"string","format":"datetime"},"updatedAt":{"type":"string","format":"datetime"}}}'
]

{ #category : #serialization }
ToolsOzoneSetDefsSetView class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpName: (aRequest at: 'name' ifAbsent: [ nil ]);
		atpDescription: (aRequest at: 'description' ifAbsent: [ nil ]);
		atpSetSize: (aRequest at: 'setSize' ifAbsent: [ nil ]);
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ]);
		atpUpdatedAt: (aRequest at: 'updatedAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneSetDefsSetView >> atpCreatedAt [
	<atpType:#String format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
ToolsOzoneSetDefsSetView >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
ToolsOzoneSetDefsSetView >> atpDescription [
	<atpType:#String format:nil>
	^ atpDescription
]

{ #category : #accessing }
ToolsOzoneSetDefsSetView >> atpDescription: anObject [
	atpDescription := anObject
]

{ #category : #accessing }
ToolsOzoneSetDefsSetView >> atpName [
	<atpType:#String format:nil>
	^ atpName
]

{ #category : #accessing }
ToolsOzoneSetDefsSetView >> atpName: anObject [
	atpName := anObject
]

{ #category : #accessing }
ToolsOzoneSetDefsSetView >> atpSetSize [
	<atpType:#Number format:nil>
	^ atpSetSize
]

{ #category : #accessing }
ToolsOzoneSetDefsSetView >> atpSetSize: anObject [
	atpSetSize := anObject
]

{ #category : #accessing }
ToolsOzoneSetDefsSetView >> atpUpdatedAt [
	<atpType:#String format:'datetime'>
	^ atpUpdatedAt
]

{ #category : #accessing }
ToolsOzoneSetDefsSetView >> atpUpdatedAt: anObject [
	atpUpdatedAt := anObject
]

{ #category : #magritte }
ToolsOzoneSetDefsSetView >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt;
		beRequired
]

{ #category : #magritte }
ToolsOzoneSetDefsSetView >> descriptionDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Description';
		accessor: #atpDescription
]

{ #category : #magritte }
ToolsOzoneSetDefsSetView >> nameDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Name';
		accessor: #atpName;
		beRequired
]

{ #category : #magritte }
ToolsOzoneSetDefsSetView >> setSizeDescription [
	<magritteDescription>
	^ MANumberDescription new
		label: 'SetSize';
		accessor: #atpSetSize;
		beRequired
]

{ #category : #magritte }
ToolsOzoneSetDefsSetView >> updatedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'UpdatedAt';
		accessor: #atpUpdatedAt;
		beRequired
]
