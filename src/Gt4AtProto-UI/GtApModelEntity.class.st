Class {
	#name : #GtApModelEntity,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #'Gt4AtProto-UI'
}

{ #category : #accessing }
GtApModelEntity class >> fromRawData: aDictionary [
	^ self new 
		rawData: aDictionary
]

{ #category : #accessing }
GtApModelEntity >> rawData: aDictionary [ 
	rawData := aDictionary
]
