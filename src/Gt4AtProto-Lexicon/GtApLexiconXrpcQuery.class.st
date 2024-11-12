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
	| methodName hasCursor methodToCall |
	methodName := self methodName: aName.	"pagination is handled elsewhere and shouldn’t be exposed to the user"
	self parameters properties keys
		withIndexDo: [ :anInputName :anIndex | 
			({'limit'.
				'cursor'} includes: anInputName)
				ifFalse: [ methodName := methodName
							, (anIndex = 1 ifTrue: [ anInputName capitalized ] ifFalse: [ anInputName ])
							, ': ' , anInputName , ' ' ] ].
	hasCursor := self parameters properties keys includes: 'cursor'.
	methodToCall := hasCursor
			ifTrue: [ 'paginatedQueryOn:' ]
			ifFalse: [ 'queryOn:' ].

	^ methodName
		, '
	<xrpcQuery>
	"' , (self description ifNil: [ '' ])
		, '"
	^ ' , self output generateDeserialization , ' (self ' , methodToCall , ''''
		, aName , ''' parameters: {'
		, ('. ' join: self xrpcRequestParameterAssociations) , '} asDictionary)'
]

{ #category : #accessing }
GtApLexiconXrpcQuery >> generateJson [
	^ {'type' -> 'query'.
		'parameters' -> self parameters generateJson.
		'output' -> self output generateJson.
		'errors' -> self errors} asDictionary
]

{ #category : #accessing }
GtApLexiconXrpcQuery >> gtRequestActionFor: anAction [
	<gtAction>
	| className |
	className := self asClassName asClassIfAbsent: [ ^ anAction noAction ].

	^ anAction dropdown
		tooltip: 'Send Request';
		icon: BrGlamorousVectorIcons play;
		priority: 1;
		content: [ :aDropdown | 
			GtApLoginForm new
				clientClass: className;
				clientCallback: [ :aClient | 
					aDropdown phlow spawnObject: (aClient perform: (self methodName: self id) asSymbol).
					aDropdown dispatchEvent: BrDropdownHideWish new ] ]
]

{ #category : #initialization }
GtApLexiconXrpcQuery >> initializeFromRawData: aSchemaData usingImporter: anImporter [
	self rawData:  aSchemaData.
	self halt.
]

{ #category : #accessing }
GtApLexiconXrpcQuery >> xrpcRequestParameterAssociations [
	^ self parameters properties keys
		reject: [ :anInputName | 
			{'limit'.
				'cursor'} includes: anInputName ]
		thenCollect: [ :anInputName | '''' , anInputName , ''' -> ' , anInputName ]
]
