Class {
	#name : #AppBskyUnspeccedGetTaggedSuggestionsSuggestion,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpTag',
		'atpSubjectType',
		'atpSubject'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyUnspeccedGetTaggedSuggestionsSuggestion class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyUnspeccedGetTaggedSuggestionsSuggestion class >> atpFile [
 ^ 'app/bsky/unspecced/getTaggedSuggestions.json'
]

{ #category : #accessing }
AppBskyUnspeccedGetTaggedSuggestionsSuggestion class >> atpRecordName [
 ^ 'app.bsky.unspecced.getTaggedSuggestions#suggestion'
]

{ #category : #accessing }
AppBskyUnspeccedGetTaggedSuggestionsSuggestion class >> atpSchema [
 ^ '{"type":"object","required":["tag","subjectType","subject"],"properties":{"tag":{"type":"string"},"subjectType":{"type":"string","knownValues":["actor","feed"]},"subject":{"type":"string","format":"uri"}}}'
]

{ #category : #serialization }
AppBskyUnspeccedGetTaggedSuggestionsSuggestion class >> fromRequest: aRequest withClient: aClient [
	^ self new
		client: aClient;
		rawData: aRequest;
		atpTag: (aRequest at: 'tag' ifAbsent: [ nil ]);
		atpSubjectType: (aRequest at: 'subjectType' ifAbsent: [ nil ]);
		atpSubject: (aRequest at: 'subject' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyUnspeccedGetTaggedSuggestionsSuggestion >> atpSubject [
	<atpType:#String format:'uri'>
	^ atpSubject
]

{ #category : #accessing }
AppBskyUnspeccedGetTaggedSuggestionsSuggestion >> atpSubject: anObject [
	atpSubject := anObject
]

{ #category : #accessing }
AppBskyUnspeccedGetTaggedSuggestionsSuggestion >> atpSubjectType [
	<atpType:#String format:nil>
	^ atpSubjectType
]

{ #category : #accessing }
AppBskyUnspeccedGetTaggedSuggestionsSuggestion >> atpSubjectType: anObject [
	atpSubjectType := anObject
]

{ #category : #accessing }
AppBskyUnspeccedGetTaggedSuggestionsSuggestion >> atpTag [
	<atpType:#String format:nil>
	^ atpTag
]

{ #category : #accessing }
AppBskyUnspeccedGetTaggedSuggestionsSuggestion >> atpTag: anObject [
	atpTag := anObject
]

{ #category : #magritte }
AppBskyUnspeccedGetTaggedSuggestionsSuggestion >> subjectDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Subject';
		accessor: #atpSubject;
		beRequired
]

{ #category : #magritte }
AppBskyUnspeccedGetTaggedSuggestionsSuggestion >> subjectTypeDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'SubjectType';
		accessor: #atpSubjectType;
		beRequired
]

{ #category : #magritte }
AppBskyUnspeccedGetTaggedSuggestionsSuggestion >> tagDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Tag';
		accessor: #atpTag;
		beRequired
]
