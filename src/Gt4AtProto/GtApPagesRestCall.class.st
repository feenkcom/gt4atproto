Class {
	#name : #GtApPagesRestCall,
	#superclass : #GtApRestCall,
	#category : #'Gt4AtProto-Server'
}

{ #category : #accessing }
GtApPagesRestCall class >> allowedMethods [
	^ #( GET )
]

{ #category : #accessing }
GtApPagesRestCall class >> errors [
	^ #()
]

{ #category : #accessing }
GtApPagesRestCall class >> modelClass [
	^ GtApRestModelCollection for: (GtApRestModelEntity forEntity: LePage)
]

{ #category : #accessing }
GtApPagesRestCall class >> parameters [
	^ #() asDictionary
]

{ #category : #accessing }
GtApPagesRestCall class >> pattern [
	^ #('pages')
]

{ #category : #accessing }
GtApPagesRestCall >> get [
	| database aResponse |
	database := self delegate database.

	aResponse := ZnResponse new.
	aResponse statusLine: ZnStatusLine ok.
	aResponse
		entity: (ZnEntity
				json: '['
						, (', '
								join: (database pages collect: [ :aPage | LeJsonV4 uniqueInstance serialize: aPage ]))
						, ']').
	self response: aResponse
]
