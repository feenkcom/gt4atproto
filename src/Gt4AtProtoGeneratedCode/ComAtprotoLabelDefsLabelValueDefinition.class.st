Class {
	#name : #ComAtprotoLabelDefsLabelValueDefinition,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpIdentifier',
		'atpSeverity',
		'atpBlurs',
		'atpDefaultSetting',
		'atpAdultOnly',
		'atpLocales'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoLabelDefsLabelValueDefinition class >> atpDescription [
 ^  'Declares a label value and its expected interpretations and behaviors.'
]

{ #category : #accessing }
ComAtprotoLabelDefsLabelValueDefinition class >> atpFile [
 ^ 'com/atproto/label/defs.json'
]

{ #category : #accessing }
ComAtprotoLabelDefsLabelValueDefinition class >> atpRecordName [
 ^ 'com.atproto.label.defs#labelValueDefinition'
]

{ #category : #accessing }
ComAtprotoLabelDefsLabelValueDefinition class >> atpSchema [
 ^ '{"type":"object","description":"Declares a label value and its expected interpretations and behaviors.","required":["identifier","severity","blurs","locales"],"properties":{"identifier":{"type":"string","description":"The value of the label being defined. Must only include lowercase ascii and the ''-'' character ([a-z-]+).","maxLength":100,"maxGraphemes":100},"severity":{"type":"string","description":"How should a client visually convey this label? ''inform'' means neutral and informational; ''alert'' means negative and warning; ''none'' means show nothing.","knownValues":["inform","alert","none"]},"blurs":{"type":"string","description":"What should this label hide in the UI, if applied? ''content'' hides all of the target; ''media'' hides the images/video/audio; ''none'' hides nothing.","knownValues":["content","media","none"]},"defaultSetting":{"type":"string","description":"The default setting for this label.","knownValues":["ignore","warn","hide"],"default":"warn"},"adultOnly":{"type":"boolean","description":"Does the user need to have adult content enabled in order to configure this label?"},"locales":{"type":"array","items":{"type":"ref","ref":"#labelValueDefinitionStrings"}}}}'
]

{ #category : #serialization }
ComAtprotoLabelDefsLabelValueDefinition class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpIdentifier: (aRequest at: 'identifier' ifAbsent: [ nil ]);
		atpSeverity: (aRequest at: 'severity' ifAbsent: [ nil ]);
		atpBlurs: (aRequest at: 'blurs' ifAbsent: [ nil ]);
		atpDefaultSetting: (aRequest at: 'defaultSetting' ifAbsent: [ nil ]);
		atpAdultOnly: (aRequest at: 'adultOnly' ifAbsent: [ nil ]);
		atpLocales: (aRequest
				at: 'locales'
				ifPresent: [ :anArray | 
					anArray
						collect: [ :aValue | 
							ComAtprotoLabelDefsLabelValueDefinitionStrings
								fromRequest: aValue
								withClient: aClient ] ]
				ifAbsent: [ nil ])
]

{ #category : #magritte }
ComAtprotoLabelDefsLabelValueDefinition >> adultOnlyDescription [
	<magritteDescription>
	^ MABooleanDescription new
		label: 'AdultOnly';
		accessor: #atpAdultOnly
]

{ #category : #accessing }
ComAtprotoLabelDefsLabelValueDefinition >> atpAdultOnly [
	<atpType:#Boolean format:nil>
	^ atpAdultOnly
]

{ #category : #accessing }
ComAtprotoLabelDefsLabelValueDefinition >> atpAdultOnly: anObject [
	atpAdultOnly := anObject
]

{ #category : #accessing }
ComAtprotoLabelDefsLabelValueDefinition >> atpBlurs [
	<atpType:#String format:nil>
	^ atpBlurs
]

{ #category : #accessing }
ComAtprotoLabelDefsLabelValueDefinition >> atpBlurs: anObject [
	atpBlurs := anObject
]

{ #category : #accessing }
ComAtprotoLabelDefsLabelValueDefinition >> atpDefaultSetting [
	<atpType:#String format:nil>
	^ atpDefaultSetting
]

{ #category : #accessing }
ComAtprotoLabelDefsLabelValueDefinition >> atpDefaultSetting: anObject [
	atpDefaultSetting := anObject
]

{ #category : #accessing }
ComAtprotoLabelDefsLabelValueDefinition >> atpIdentifier [
	<atpType:#String format:nil>
	^ atpIdentifier
]

{ #category : #accessing }
ComAtprotoLabelDefsLabelValueDefinition >> atpIdentifier: anObject [
	atpIdentifier := anObject
]

{ #category : #accessing }
ComAtprotoLabelDefsLabelValueDefinition >> atpLocales [
	<atpType:#ComAtprotoLabelDefsLabelValueDefinitionStrings format:nil>
	<atpCollection>
	^ atpLocales
]

{ #category : #accessing }
ComAtprotoLabelDefsLabelValueDefinition >> atpLocales: anObject [
	atpLocales := anObject
]

{ #category : #accessing }
ComAtprotoLabelDefsLabelValueDefinition >> atpSeverity [
	<atpType:#String format:nil>
	^ atpSeverity
]

{ #category : #accessing }
ComAtprotoLabelDefsLabelValueDefinition >> atpSeverity: anObject [
	atpSeverity := anObject
]

{ #category : #magritte }
ComAtprotoLabelDefsLabelValueDefinition >> blursDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Blurs';
		accessor: #atpBlurs;
		beRequired
]

{ #category : #magritte }
ComAtprotoLabelDefsLabelValueDefinition >> defaultSettingDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'DefaultSetting';
		accessor: #atpDefaultSetting
]

{ #category : #magritte }
ComAtprotoLabelDefsLabelValueDefinition >> identifierDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Identifier';
		accessor: #atpIdentifier;
		beRequired
]

{ #category : #magritte }
ComAtprotoLabelDefsLabelValueDefinition >> localesDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		classes: {ComAtprotoLabelDefsLabelValueDefinitionStrings};
		label: 'Locales';
		accessor: #atpLocales;
		beRequired
]

{ #category : #magritte }
ComAtprotoLabelDefsLabelValueDefinition >> severityDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Severity';
		accessor: #atpSeverity;
		beRequired
]
