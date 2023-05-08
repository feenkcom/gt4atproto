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
	methodName := self methodName: aName.
	^ methodName
		, '
	<xrpcQuery>
	^ self queryOn: ''' , aName , ''''
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
