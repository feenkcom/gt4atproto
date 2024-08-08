Class {
	#name : #ComAtprotoLabelDefsLabelValueDefinitionStrings,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpLang',
		'atpName',
		'atpDescription'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
ComAtprotoLabelDefsLabelValueDefinitionStrings class >> atpDescription [
 ^  'Strings which describe the label in the UI, localized into a specific language.'
]

{ #category : #accessing }
ComAtprotoLabelDefsLabelValueDefinitionStrings class >> atpFile [
 ^ 'com/atproto/label/defs.json'
]

{ #category : #accessing }
ComAtprotoLabelDefsLabelValueDefinitionStrings class >> atpRecordName [
 ^ 'com.atproto.label.defs#labelValueDefinitionStrings'
]

{ #category : #accessing }
ComAtprotoLabelDefsLabelValueDefinitionStrings class >> atpSchema [
 ^ '{"type":"object","description":"Strings which describe the label in the UI, localized into a specific language.","required":["lang","name","description"],"properties":{"lang":{"type":"string","description":"The code of the language these strings are written in.","format":"language"},"name":{"type":"string","description":"A short human-readable name for the label.","maxGraphemes":64,"maxLength":640},"description":{"type":"string","description":"A longer description of what the label means and why it might be applied.","maxGraphemes":10000,"maxLength":100000}}}'
]

{ #category : #serialization }
ComAtprotoLabelDefsLabelValueDefinitionStrings class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpLang: (aRequest at: 'lang' ifAbsent: [ nil ]);
		atpName: (aRequest at: 'name' ifAbsent: [ nil ]);
		atpDescription: (aRequest at: 'description' ifAbsent: [ nil ])
]

{ #category : #accessing }
ComAtprotoLabelDefsLabelValueDefinitionStrings >> atpDescription [
	<atpType:#String format:nil>
	^ atpDescription
]

{ #category : #accessing }
ComAtprotoLabelDefsLabelValueDefinitionStrings >> atpDescription: anObject [
	atpDescription := anObject
]

{ #category : #accessing }
ComAtprotoLabelDefsLabelValueDefinitionStrings >> atpLang [
	<atpType:#String format:'language'>
	^ atpLang
]

{ #category : #accessing }
ComAtprotoLabelDefsLabelValueDefinitionStrings >> atpLang: anObject [
	atpLang := anObject
]

{ #category : #accessing }
ComAtprotoLabelDefsLabelValueDefinitionStrings >> atpName [
	<atpType:#String format:nil>
	^ atpName
]

{ #category : #accessing }
ComAtprotoLabelDefsLabelValueDefinitionStrings >> atpName: anObject [
	atpName := anObject
]

{ #category : #magritte }
ComAtprotoLabelDefsLabelValueDefinitionStrings >> descriptionDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Description';
		accessor: #atpDescription;
		beRequired
]

{ #category : #magritte }
ComAtprotoLabelDefsLabelValueDefinitionStrings >> langDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Lang';
		accessor: #atpLang;
		beRequired
]

{ #category : #magritte }
ComAtprotoLabelDefsLabelValueDefinitionStrings >> nameDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Name';
		accessor: #atpName;
		beRequired
]
