Class {
	#name : #AppBskyFeedPostEntity,
	#superclass : #Object,
	#instVars : [
		'atProtoIndex',
		'atProtoType',
		'atProtoValue'
	],
	#category : #Gt4AtProtoGeneratedCode
}

{ #category : #serialization }
AppBskyFeedPostEntity class >> fromRequest: aRequest [
	^ self new atProtoIndex: (aRequest at: 'index' ifPresent: [:aValue | AppBskyFeedPostTextSlice fromRequest: aValue ] ifAbsent: [ nil ]); 
		atProtoType: (aRequest at: 'type' ifAbsent: [ nil ]); 
		atProtoValue: (aRequest at: 'value' ifAbsent: [ nil ])
]

{ #category : #accessing }
AppBskyFeedPostEntity >> atProtoIndex [
	<referenceTo:'#textSlice'>
	^ atProtoIndex
]

{ #category : #accessing }
AppBskyFeedPostEntity >> atProtoIndex: anObject [
	<referenceTo:'#textSlice'>
	atProtoIndex := anObject
]

{ #category : #accessing }
AppBskyFeedPostEntity >> atProtoType [
	^ atProtoType
]

{ #category : #accessing }
AppBskyFeedPostEntity >> atProtoType: anObject [
	atProtoType := anObject
]

{ #category : #accessing }
AppBskyFeedPostEntity >> atProtoValue [
	^ atProtoValue
]

{ #category : #accessing }
AppBskyFeedPostEntity >> atProtoValue: anObject [
	atProtoValue := anObject
]

{ #category : #magritte }
AppBskyFeedPostEntity >> indexDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new
		label: 'Index';
		accessor: #atProtoIndex;
		beRequired
]

{ #category : #magritte }
AppBskyFeedPostEntity >> typeDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Type';
		accessor: #atProtoType;
	beRequired
]

{ #category : #magritte }
AppBskyFeedPostEntity >> valueDescription [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Value';
		accessor: #atProtoValue;
	beRequired
]
