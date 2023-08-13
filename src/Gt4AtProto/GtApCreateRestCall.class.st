Class {
	#name : #GtApCreateRestCall,
	#superclass : #GtApRestCall,
	#category : #'Gt4AtProto-RestCall'
}

{ #category : #accessing }
GtApCreateRestCall class >> allowedMethods [
	^ #( POST )
]

{ #category : #accessing }
GtApCreateRestCall class >> endpointName [
	^ self pattern last
]

{ #category : #accessing }
GtApCreateRestCall class >> errors [
	^ {'BadRequest'}
]

{ #category : #accessing }
GtApCreateRestCall class >> modelClass [
	^ (GtApRestModelEntity forEntity: self modelEntity)
]

{ #category : #accessing }
GtApCreateRestCall class >> modelEntity [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtApCreateRestCall >> create [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtApCreateRestCall >> post [
	self validateParameters
		ifTrue: [ | created aResponse |
			created := self create.

			(created isKindOf: ZnResponse)
				ifTrue: [ self response: created.
					^ self ].

			aResponse := ZnResponse new.
			aResponse statusLine: ZnStatusLine ok.
			aResponse
				entity: (ZnEntity json: (LeJsonV4 uniqueInstance serialize: created)).
			self response: aResponse ]
]
