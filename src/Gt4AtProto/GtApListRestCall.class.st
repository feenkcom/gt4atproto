Class {
	#name : #GtApListRestCall,
	#superclass : #GtApRestCall,
	#category : #'Gt4AtProto-RestCall'
}

{ #category : #accessing }
GtApListRestCall class >> allowedMethods [
	^ #( GET )
]

{ #category : #accessing }
GtApListRestCall class >> endpointName [
	^ 'list', self modelEntity name, 's'
]

{ #category : #accessing }
GtApListRestCall class >> modelClass [
	^ GtApRestModelCollection for: (GtApRestModelEntity forEntity: self modelEntity)
]

{ #category : #accessing }
GtApListRestCall class >> modelEntity [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtApListRestCall >> get [
	self validateParameters
		ifTrue: [ | listed aResponse |
			listed := self list.

			(listed isKindOf: ZnResponse)
				ifTrue: [ self response: listed.
					^ self ].

			aResponse := ZnResponse new.
			aResponse statusLine: ZnStatusLine ok.
			aResponse
				entity: (ZnEntity
						json: '['
								, (', '
										join: (listed collect: [ :anEntity | LeJsonV4 uniqueInstance serialize: anEntity ]))
								, ']').
			self response: aResponse ]
]

{ #category : #accessing }
GtApListRestCall >> list [
	^ self subclassResponsibility
]
