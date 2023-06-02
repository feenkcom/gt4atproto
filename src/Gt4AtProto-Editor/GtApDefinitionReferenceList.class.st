Class {
	#name : #GtApDefinitionReferenceList,
	#superclass : #Object,
	#instVars : [
		'stream'
	],
	#category : #'Gt4AtProto-Editor-Model'
}

{ #category : #accessing }
GtApDefinitionReferenceList >> gtReferenceList: aView [
	<gtView>
	^ aView list
		title: 'References';
		items: [ self stream ]
]

{ #category : #accessing }
GtApDefinitionReferenceList >> stream [
	^ stream asyncSimilarCopy
]

{ #category : #accessing }
GtApDefinitionReferenceList >> stream: asyncStream [
	stream := asyncStream cached
]
