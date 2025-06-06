Class {
	#name : #GtApLexiconUnknownDefinition,
	#superclass : #GtApLexiconDefinition,
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #accessing }
GtApLexiconUnknownDefinition class >> typeName [
	^ #unknown
]

{ #category : #visiting }
GtApLexiconUnknownDefinition >> acceptVisitor: aLexiconVisitor [
	^ aLexiconVisitor visitLexiconUnknownDefinition:  self
]

{ #category : #accessing }
GtApLexiconUnknownDefinition >> asClassName [
	^ 'Object'
]

{ #category : #accessing }
GtApLexiconUnknownDefinition >> buildFromRequestOn: aKey [
	^ 'GtApModelEntity findForRequest: ', aKey, ' withClient: aClient'
]

{ #category : #accessing }
GtApLexiconUnknownDefinition >> buildFromRequestWithKey: aKey [
	^ 'aRequest at: ''' , aKey , ''' ifPresent: [:aValue | GtApModelEntity findForRequest: aValue withClient: aClient ] ifAbsent: [ nil ]'
]

{ #category : #accessing }
GtApLexiconUnknownDefinition >> description [
	^ nil
]

{ #category : #accessing }
GtApLexiconUnknownDefinition >> generateDescriptorFor: aString usingPrefix: aPrefix isRequired: aBoolean [
	| source |
	source := aString
			, 'Description
	<magritteDescription>
	^ MAStringDescription new
		label: ''' , aString capitalized
			, ''';
		accessor: #' , aPrefix, aString asCamelCase.

	aBoolean
		ifTrue: [ source := source
					, ';
	beRequired' ].
	^ source
]

{ #category : #accessing }
GtApLexiconUnknownDefinition >> generateDeserializationFor: aValue [
	^ 'GtApModelEntity findForRequest: ', aValue, ' withClient: self'
]

{ #category : #accessing }
GtApLexiconUnknownDefinition >> generateJson [
	^ {'type' -> 'unknown'} asDictionary
]
