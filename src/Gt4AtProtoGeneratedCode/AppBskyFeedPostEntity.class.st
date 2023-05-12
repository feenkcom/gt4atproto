Class {
	#name : #AppBskyFeedPostEntity,
	#superclass : #Object,
	#instVars : [
		'atpIndex',
		'atpType',
		'atpValue'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyFeedPostEntity class >> fromRequest: aRequest [
	^ self new atpIndex: (aRequest at: 'index' ifPresent: [:aValue | AppBskyFeedPostTextSlice fromRequest: aValue ] ifAbsent: [ nil ]); 
		atpType: (aRequest at: 'type' ifAbsent: [ nil ]); 
		atpValue: (aRequest at: 'value' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedPostEntity >> atpIndex [
	<referenceTo:'#textSlice'>
	^ atpIndex
]

{ #category : #accessing }
AppBskyFeedPostEntity >> atpIndex: anObject [
	<referenceTo:'#textSlice'>
	atpIndex := anObject
]

{ #category : #accessing }
AppBskyFeedPostEntity >> atpType [
	^ atpType
]

{ #category : #accessing }
AppBskyFeedPostEntity >> atpType: anObject [
	atpType := anObject
]

{ #category : #accessing }
AppBskyFeedPostEntity >> atpValue [
	^ atpValue
]

{ #category : #accessing }
AppBskyFeedPostEntity >> atpValue: anObject [
	atpValue := anObject
]

{ #category : #magritte }
AppBskyFeedPostEntity >> indexDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Index';
		accessor: #atpIndex;
		beRequired
]

{ #category : #magritte }
AppBskyFeedPostEntity >> typeDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Type';
		accessor: #atpType;
	beRequired
]

{ #category : #magritte }
AppBskyFeedPostEntity >> valueDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Value';
		accessor: #atpValue;
	beRequired
]