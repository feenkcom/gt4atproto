Class {
	#name : #GtApRestCallParameter,
	#superclass : #Object,
	#instVars : [
		'required',
		'name',
		'type'
	],
	#category : #'Gt4AtProto-RestCall'
}

{ #category : #accessing }
GtApRestCallParameter >> beOptional [
	required := false
]

{ #category : #accessing }
GtApRestCallParameter >> beRequired [
	required := true
]

{ #category : #accessing }
GtApRestCallParameter >> initialize [
	super initialize.

	self beOptional
]

{ #category : #accessing }
GtApRestCallParameter >> isOptional [
	^ required not
]

{ #category : #accessing }
GtApRestCallParameter >> isRequired [
	^ required
]

{ #category : #accessing }
GtApRestCallParameter >> name [
	^ name
]

{ #category : #accessing }
GtApRestCallParameter >> name: anObject [
	name := anObject
]

{ #category : #accessing }
GtApRestCallParameter >> toLexiconIn: aGenerator [
	^ self name
		-> ((self type isKindOf: GtApRestModelEntity)
				ifTrue: [ (self type asLexiconOutputIn: aGenerator) generateJson ]
				ifFalse: [ self type generateJson ])
]

{ #category : #accessing }
GtApRestCallParameter >> type [
	^ type
]

{ #category : #accessing }
GtApRestCallParameter >> type: anObject [
	type := anObject
]
