Class {
	#name : #GtApLexiconXrpcQuery,
	#superclass : #GtApLexiconXrpcRequest,
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #accessing }
GtApLexiconXrpcQuery class >> typeName [
	^ #query
]

{ #category : #visiting }
GtApLexiconXrpcQuery >> acceptVisitor: aLexiconVisitor [
	^ aLexiconVisitor visitLexiconXrpcQuery: self
]

{ #category : #accessing }
GtApLexiconXrpcQuery >> asXRPCMethodNamed: aName [
	| methodName |
	methodName := (aName replaceAllRegex: '[.#]' with: ' ') asCamelCase
			uncapitalized.
	^ methodName
		, '
	^ self queryOn: ''' , aName , ''''
]

{ #category : #initialization }
GtApLexiconXrpcQuery >> initializeFromRawData: aSchemaData usingImporter: anImporter [
	self rawData:  aSchemaData.
	self halt.
]
