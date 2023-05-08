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
	^ self queryOn: ''' , aName , ''''
]

{ #category : #accessing }
GtApLexiconXrpcQuery >> gtRequestActionFor: anAction [
	<gtAction>
	| className |
	className := self asClassName asClassIfAbsent: [ ^ anAction noAction ].

	^ anAction button
		tooltip: 'Send Request';
		icon: BrGlamorousVectorIcons play;
		priority: 1;
		action: [ :aButton | aButton phlow spawnObject: (className new perform: (self methodName: self id)) ]
]

{ #category : #initialization }
GtApLexiconXrpcQuery >> initializeFromRawData: aSchemaData usingImporter: anImporter [
	self rawData:  aSchemaData.
	self halt.
]
