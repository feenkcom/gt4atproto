Class {
	#name : #GtApDeleteRestCall,
	#superclass : #GtApCreateRestCall,
	#category : #'Gt4AtProto-RestCall'
}

{ #category : #accessing }
GtApDeleteRestCall class >> modelClass [
	^ nil
]

{ #category : #accessing }
GtApDeleteRestCall >> delete [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtApDeleteRestCall >> post [
	self validateParameters
		ifTrue: [ | deleted aResponse |
			deleted := self delete.

			(deleted isKindOf: ZnResponse)
				ifTrue: [ self response: deleted.
					^ self ].

			aResponse := ZnResponse new.
			aResponse statusLine: ZnStatusLine ok.
			self response: aResponse ]
]
