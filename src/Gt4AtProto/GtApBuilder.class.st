Class {
	#name : #GtApBuilder,
	#superclass : #Object,
	#instVars : [
		'lexicons'
	],
	#category : #'Gt4AtProto-Code Generation'
}

{ #category : #accessing }
GtApBuilder >> buildUsing: aModel [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtApBuilder >> lexicons [
	^ lexicons
]

{ #category : #accessing }
GtApBuilder >> lexicons: anObject [
	lexicons := anObject
]

{ #category : #accessing }
GtApBuilder >> removeUsing: aModel [
	^ self subclassResponsibility
]
