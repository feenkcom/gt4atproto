Class {
	#name : #AppBskyActorDefsPersonalDetailsPref,
	#superclass : #GtApModelEntity,
	#instVars : [
		'atpBirthDate'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #accessing }
AppBskyActorDefsPersonalDetailsPref class >> atpDescription [
 ^  ''
]

{ #category : #accessing }
AppBskyActorDefsPersonalDetailsPref class >> atpFile [
 ^ 'app/bsky/actor/defs.json'
]

{ #category : #accessing }
AppBskyActorDefsPersonalDetailsPref class >> atpRecordName [
 ^ 'app.bsky.actor.defs#personalDetailsPref'
]

{ #category : #accessing }
AppBskyActorDefsPersonalDetailsPref class >> atpSchema [
 ^ '{"type":"object","properties":{"birthDate":{"type":"string","format":"datetime","description":"The birth date of account owner."}}}'
]

{ #category : #serialization }
AppBskyActorDefsPersonalDetailsPref class >> fromRequest: aRequest [
	^ self new
		rawData: aRequest;
		atpBirthDate: (aRequest at: 'birthDate' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyActorDefsPersonalDetailsPref >> atpBirthDate [
	<atpType:#String format:'datetime'>
	^ atpBirthDate
]

{ #category : #accessing }
AppBskyActorDefsPersonalDetailsPref >> atpBirthDate: anObject [
	atpBirthDate := anObject
]

{ #category : #magritte }
AppBskyActorDefsPersonalDetailsPref >> birthDateDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'BirthDate';
		accessor: #atpBirthDate
]
