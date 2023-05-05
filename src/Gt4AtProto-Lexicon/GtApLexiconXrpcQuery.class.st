Class {
	#name : #GtApLexiconXrpcQuery,
	#superclass : #GtApLexiconXrpcRequest,
	#category : #'Gt4AtProto-Lexicon'
}

{ #category : #accessing }
GtApLexiconXrpcQuery class >> typeName [
	^ #query
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
