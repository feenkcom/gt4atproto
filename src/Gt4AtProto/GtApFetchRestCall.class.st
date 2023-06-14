Class {
	#name : #GtApFetchRestCall,
	#superclass : #GtApRestCall,
	#category : #'Gt4AtProto-Server'
}

{ #category : #accessing }
GtApFetchRestCall class >> allowedMethods [
	^ #( GET )
]

{ #category : #accessing }
GtApFetchRestCall class >> endpointName [
	^ 'get', self modelEntity name
]

{ #category : #accessing }
GtApFetchRestCall class >> errors [
	^ {'BadRequest'.
		'NotFound'}
]

{ #category : #accessing }
GtApFetchRestCall class >> modelClass [
	^ (GtApRestModelEntity forEntity: self modelEntity)
]

{ #category : #accessing }
GtApFetchRestCall class >> modelEntity [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtApFetchRestCall >> fetch [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtApFetchRestCall >> get [
	self validateParameters
		ifTrue: [ | fetched aResponse |
			fetched := self fetch.

			(fetched isKindOf: ZnResponse)
				ifTrue: [ self response: fetched.
					^ self ].

			aResponse := ZnResponse new.
			aResponse statusLine: ZnStatusLine ok.
			aResponse
				entity: (ZnEntity json: (LeJsonV4 uniqueInstance serialize: fetched)).
			self response: aResponse ]
]
