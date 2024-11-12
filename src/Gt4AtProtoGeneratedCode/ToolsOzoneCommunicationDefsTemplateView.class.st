Class {
	#name : #ToolsOzoneCommunicationDefsTemplateView,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpId',
		'atpName',
		'atpSubject',
		'atpContentMarkdown',
		'atpDisabled',
		'atpLang',
		'atpLastUpdatedBy',
		'atpCreatedAt',
		'atpUpdatedAt'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ToolsOzoneCommunicationDefsTemplateView class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
ToolsOzoneCommunicationDefsTemplateView class >> atpFile [
 ^ 'tools/ozone/communication/defs.json'
]

{ #category : #accessing }
ToolsOzoneCommunicationDefsTemplateView class >> atpRecordName [
 ^ 'tools.ozone.communication.defs#templateView'
]

{ #category : #accessing }
ToolsOzoneCommunicationDefsTemplateView class >> atpSchema [
 ^ '{"type":"object","required":["id","name","contentMarkdown","disabled","lastUpdatedBy","createdAt","updatedAt"],"properties":{"id":{"type":"string"},"name":{"type":"string","description":"Name of the template."},"subject":{"type":"string","description":"Content of the template, can contain markdown and variable placeholders."},"contentMarkdown":{"type":"string","description":"Subject of the message, used in emails."},"disabled":{"type":"boolean"},"lang":{"type":"string","format":"language","description":"Message language."},"lastUpdatedBy":{"type":"string","format":"did","description":"DID of the user who last updated the template."},"createdAt":{"type":"string","format":"datetime"},"updatedAt":{"type":"string","format":"datetime"}}}'
]

{ #category : #serialization }
ToolsOzoneCommunicationDefsTemplateView class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpId: (aRequest at: 'id' ifAbsent: [ nil ]);
		atpName: (aRequest at: 'name' ifAbsent: [ nil ]);
		atpSubject: (aRequest at: 'subject' ifAbsent: [ nil ]);
		atpContentMarkdown: (aRequest at: 'contentMarkdown' ifAbsent: [ nil ]);
		atpDisabled: (aRequest at: 'disabled' ifAbsent: [ nil ]);
		atpLang: (aRequest at: 'lang' ifAbsent: [ nil ]);
		atpLastUpdatedBy: (aRequest at: 'lastUpdatedBy' ifAbsent: [ nil ]);
		atpCreatedAt: (aRequest at: 'createdAt' ifAbsent: [ nil ]);
		atpUpdatedAt: (aRequest at: 'updatedAt' ifAbsent: [ nil ])
]

{ #category : #accessing }
ToolsOzoneCommunicationDefsTemplateView >> atpContentMarkdown [
	<atpType:#String format:nil>
	^ atpContentMarkdown
]

{ #category : #accessing }
ToolsOzoneCommunicationDefsTemplateView >> atpContentMarkdown: anObject [
	atpContentMarkdown := anObject
]

{ #category : #accessing }
ToolsOzoneCommunicationDefsTemplateView >> atpCreatedAt [
	<atpType:#String format:'datetime'>
	^ atpCreatedAt
]

{ #category : #accessing }
ToolsOzoneCommunicationDefsTemplateView >> atpCreatedAt: anObject [
	atpCreatedAt := anObject
]

{ #category : #accessing }
ToolsOzoneCommunicationDefsTemplateView >> atpDisabled [
	<atpType:#Boolean format:nil>
	^ atpDisabled
]

{ #category : #accessing }
ToolsOzoneCommunicationDefsTemplateView >> atpDisabled: anObject [
	atpDisabled := anObject
]

{ #category : #accessing }
ToolsOzoneCommunicationDefsTemplateView >> atpId [
	<atpType:#String format:nil>
	^ atpId
]

{ #category : #accessing }
ToolsOzoneCommunicationDefsTemplateView >> atpId: anObject [
	atpId := anObject
]

{ #category : #accessing }
ToolsOzoneCommunicationDefsTemplateView >> atpLang [
	<atpType:#String format:'language'>
	^ atpLang
]

{ #category : #accessing }
ToolsOzoneCommunicationDefsTemplateView >> atpLang: anObject [
	atpLang := anObject
]

{ #category : #accessing }
ToolsOzoneCommunicationDefsTemplateView >> atpLastUpdatedBy [
	<atpType:#String format:'did'>
	^ atpLastUpdatedBy
]

{ #category : #accessing }
ToolsOzoneCommunicationDefsTemplateView >> atpLastUpdatedBy: anObject [
	atpLastUpdatedBy := anObject
]

{ #category : #accessing }
ToolsOzoneCommunicationDefsTemplateView >> atpName [
	<atpType:#String format:nil>
	^ atpName
]

{ #category : #accessing }
ToolsOzoneCommunicationDefsTemplateView >> atpName: anObject [
	atpName := anObject
]

{ #category : #accessing }
ToolsOzoneCommunicationDefsTemplateView >> atpSubject [
	<atpType:#String format:nil>
	^ atpSubject
]

{ #category : #accessing }
ToolsOzoneCommunicationDefsTemplateView >> atpSubject: anObject [
	atpSubject := anObject
]

{ #category : #accessing }
ToolsOzoneCommunicationDefsTemplateView >> atpUpdatedAt [
	<atpType:#String format:'datetime'>
	^ atpUpdatedAt
]

{ #category : #accessing }
ToolsOzoneCommunicationDefsTemplateView >> atpUpdatedAt: anObject [
	atpUpdatedAt := anObject
]

{ #category : #magritte }
ToolsOzoneCommunicationDefsTemplateView >> contentMarkdownDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'ContentMarkdown';
		accessor: #atpContentMarkdown;
		beRequired
]

{ #category : #magritte }
ToolsOzoneCommunicationDefsTemplateView >> createdAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'CreatedAt';
		accessor: #atpCreatedAt;
		beRequired
]

{ #category : #magritte }
ToolsOzoneCommunicationDefsTemplateView >> disabledDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'Disabled';
		accessor: #atpDisabled;
		beRequired
]

{ #category : #magritte }
ToolsOzoneCommunicationDefsTemplateView >> idDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Id';
		accessor: #atpId;
		beRequired
]

{ #category : #magritte }
ToolsOzoneCommunicationDefsTemplateView >> langDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Lang';
		accessor: #atpLang
]

{ #category : #magritte }
ToolsOzoneCommunicationDefsTemplateView >> lastUpdatedByDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'LastUpdatedBy';
		accessor: #atpLastUpdatedBy;
		beRequired
]

{ #category : #magritte }
ToolsOzoneCommunicationDefsTemplateView >> nameDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Name';
		accessor: #atpName;
		beRequired
]

{ #category : #magritte }
ToolsOzoneCommunicationDefsTemplateView >> subjectDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Subject';
		accessor: #atpSubject
]

{ #category : #magritte }
ToolsOzoneCommunicationDefsTemplateView >> updatedAtDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'UpdatedAt';
		accessor: #atpUpdatedAt;
		beRequired
]
