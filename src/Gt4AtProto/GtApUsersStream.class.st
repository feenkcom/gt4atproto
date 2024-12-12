Class {
	#name : #GtApUsersStream,
	#superclass : #Object,
	#traits : 'TGtStreamGroup',
	#classTraits : 'TGtStreamGroup classTrait',
	#instVars : [
		'stream'
	],
	#category : #'Gt4AtProto-Streams'
}

{ #category : #accessing }
GtApUsersStream class >> users: aStream [
	^ self new stream: aStream
]

{ #category : #accessing }
GtApUsersStream >> asyncSimilarCopy [
	^ GtApUsersStream users: self stream asyncSimilarCopy
]

{ #category : #accessing }
GtApUsersStream >> stream [
	^ stream
]

{ #category : #accessing }
GtApUsersStream >> stream: aStream [
	stream := aStream
]
