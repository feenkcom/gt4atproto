Class {
	#name : #GtApUnknownRecord,
	#superclass : #Object,
	#instVars : [
		'key',
		'rawData',
		'client'
	],
	#category : #'Gt4AtProto-Records'
}

{ #category : #accessing }
GtApUnknownRecord >> asEmbeddedElement [
	^ BrLabel new
		aptitude: BrGlamorousLabelAptitude new bold;
		text: 'Unknown record: ' , self key
]

{ #category : #accessing }
GtApUnknownRecord >> client [
	^ client
]

{ #category : #accessing }
GtApUnknownRecord >> client: anObject [
	client := anObject
]

{ #category : #accessing }
GtApUnknownRecord >> fromRequest: aData [
	rawData := aData
]

{ #category : #accessing }
GtApUnknownRecord >> fromRequest: aData withClient: aClient [
	rawData := aData.
	client := aClient
]

{ #category : #accessing }
GtApUnknownRecord >> gtRawDataFor: aView [
	<gtView>
	^ aView columnedTree
		title: 'Raw data';
		priority: 40;
		items: [ rawData associations ];
		column: 'Property' text: #key;
		column: 'Value' text: #value;
		children: [ :each | 
			each value isDictionary
				ifTrue: [ each value associations ]
				ifFalse: [ (each value isArray and: [ each value allSatisfy: #isDictionary ])
						ifTrue: [ each value collectWithIndex: [ :x :i | i -> x ] ]
						ifFalse: [ #() ] ] ];
		send: #value
]

{ #category : #accessing }
GtApUnknownRecord >> hasMedia [
	^ false
]

{ #category : #accessing }
GtApUnknownRecord >> key [
	^ key
]

{ #category : #accessing }
GtApUnknownRecord >> key: anObject [
	key := anObject
]

{ #category : #accessing }
GtApUnknownRecord >> rawData [
	^ rawData
]
