Class {
	#name : #GtApServerConfiguration,
	#superclass : #LeServerConfiguration,
	#instVars : [
		'database'
	],
	#category : #'Gt4AtProto-Server'
}

{ #category : #accessing }
GtApServerConfiguration class >> defaultPortNumber [
	^ 8100
]

{ #category : #accessing }
GtApServerConfiguration >> database [
	^ database
]

{ #category : #accessing }
GtApServerConfiguration >> database: anObject [
	database := anObject
]
