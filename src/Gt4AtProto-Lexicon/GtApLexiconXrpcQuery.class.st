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
	methodName := self methodName: aName.	"pagination is handled elsewhere and shouldn’t be exposed to the user"
	self parameters properties
		keysDo: [ :anInputName | 
			({'limit'.
				'cursor'} includes: anInputName)
				ifFalse: [ methodName := methodName , anInputName , ': ' , anInputName , ' ' ] ].

	^ methodName
		, '
	<xrpcQuery>
	"' , (self description ifNil: [ '' ])
		, '"
	^ ' , self output generateDeserialization , ' (self queryOn: ''' , aName
		, ''' parameters: {' , ('. ' join: self xrpcRequestParameterAssociations)
		, '} asDictionary)'
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
