Class {
	#name : #GtApCompletionStrategy,
	#superclass : #GtJSONCompletionStrategy,
	#instVars : [
		'lexicons'
	],
	#classVars : [
		'Encodings'
	],
	#category : #'Gt4AtProto-Lepiter-Completion'
}

{ #category : #accessing }
GtApCompletionStrategy class >> encodings [
	^ Encodings
		ifNil: [ Encodings := GtPrefixTree
					withAll: (ZnMimeType knownMimeTypesWithFilenameExtensions collect: #printString) ]
]

{ #category : #initialization }
GtApCompletionStrategy >> completeEncodings: str at: position [
	(str beginsWith: '"') ifFalse: [ ^ #() ].
	^ (self class encodings asyncStreamStartingWith: str allButFirst)
		collect: [ :each | 
			| new |
			new := '"' , each , '"'.
			GtInsertTextCompletionAction
				labeled: (GtJSONCompleter labelFor: new withSearch: str)
				completion: (new allButFirst: str size)
				position: position
				from: position - str size + 1 ]
]

{ #category : #initialization }
GtApCompletionStrategy >> completeReference: str at: position [
	(str beginsWith: '"') ifFalse: [ ^ #() ].
	^ (self referencesStartingWith: str)
		collect: [ :each | 
			| new |
			new := '"' , each , '"'.
			GtInsertTextCompletionAction
				labeled: (GtJSONCompleter labelFor: new withSearch: str)
				completion: (new allButFirst: str size)
				position: position
				from: position - str size + 1 ]
]

{ #category : #initialization }
GtApCompletionStrategy >> completeRequired: str at: position [
	(str beginsWith: '"') ifFalse: [ ^ #() ].
	^ (self requiredStartingWith: str)
		collect: [ :each | 
			| new |
			new := '"' , each , '"'.
			GtInsertTextCompletionAction
				labeled: (GtJSONCompleter labelFor: new withSearch: str)
				completion: (new allButFirst: str size)
				position: position
				from: position - str size + 1 ]
]

{ #category : #initialization }
GtApCompletionStrategy >> initialize [
	| ref refs doc userType token object record xrpcQuery xrpcProcedure xrpcBody xrpcError blob image video audio array primitive boolean number integer string userUnion primitiveUnion booleanValues encodings refBlock refUnion required |
	super initialize.
	ref := GtJSONObjectCompleter new.
	refs := GtJSONObjectCompleter new.
	doc := GtJSONObjectCompleter new.
	userType := GtJSONObjectCompleter new.
	token := GtJSONObjectCompleter new.
	object := GtJSONObjectCompleter new.
	record := GtJSONObjectCompleter new.
	xrpcQuery := GtJSONObjectCompleter new.
	xrpcProcedure := GtJSONObjectCompleter new.
	xrpcBody := GtJSONObjectCompleter new.
	xrpcError := GtJSONObjectCompleter new.
	blob := GtJSONObjectCompleter new.
	image := GtJSONObjectCompleter new.
	video := GtJSONObjectCompleter new.
	audio := GtJSONObjectCompleter new.
	array := GtJSONObjectCompleter new.
	primitive := GtJSONObjectCompleter new.
	boolean := GtJSONObjectCompleter new.
	number := GtJSONObjectCompleter new.
	integer := GtJSONObjectCompleter new.
	string := GtJSONObjectCompleter new.
	userUnion := GtJSONUnionCompleter new.
	primitiveUnion := GtJSONUnionCompleter new.
	booleanValues := GtJSONValueCompleter new
			addValues: #('"true"' '"false"');
			yourself.
	encodings := GtJSONBlockCompleter new
			block: [ :str :position | self completeEncodings: str at: position ].
	userUnion
		addCompleter: userType;
		addCompleter: token;
		addCompleter: object;
		addCompleter: record;
		addCompleter: xrpcQuery;
		addCompleter: xrpcProcedure;
		addCompleter: xrpcBody;
		addCompleter: blob;
		addCompleter: image;
		addCompleter: video;
		addCompleter: audio.
	primitiveUnion
		addCompleter: primitive;
		addCompleter: boolean;
		addCompleter: number;
		addCompleter: integer;
		addCompleter: string.
	refBlock := GtJSONBlockCompleter new
			block: [ :str :pos | self completeReference: str at: pos ].
	required := GtJSONBlockCompleter new
			block: [ :str :pos | self completeRequired: str at: pos ].
	refUnion := GtJSONUnionCompleter new
			addCompleter: ref;
			addCompleter: refs;
			addCompleter: refBlock;
			yourself.
	ref
		addCheck: 'type' withValue: '"ref"';
		addKey: 'ref' withValue: refBlock.
	refs
		addCheck: 'type' withValue: '"union"';
		addKey: 'refs'
			withValue: (GtJSONListCompleter new
					itemCompleter: refBlock;
					yourself).
	doc
		addKeys: #('lexicon' 'id' 'revision' 'description');
		addKey: 'defs'
			withValue: (GtJSONObjectCompleter new
					valueCompleter: (GtJSONUnionCompleter new
							addCompleter: userUnion;
							addCompleter: array;
							addCompleter: primitiveUnion;
							addCompleter: refUnion;
							yourself);
					yourself).
	userType
		addKey: 'type'
			withValue: (GtJSONValueCompleter new
					addValues: #('"query"' '"procedure"' '"record"' '"token"' '"object"' '"blob"' '"image"' '"video"' '"audio"'));
		addKey: 'description'.
	token addCheck: 'type' withValue: '"token"'.
	object
		addCheck: 'type' withValue: '"object"';
		addKey: 'required'
			withValue: (GtJSONListCompleter new
					itemCompleter: required;
					yourself);
		addKey: 'properties'
			withValue: (GtJSONObjectCompleter new
					valueCompleter: (GtJSONUnionCompleter new
							addCompleter: refUnion;
							addCompleter: array;
							addCompleter: primitive;
							yourself);
					yourself).
	record
		addCheck: 'type' withValue: '"record"';
		addKey: 'key';
		addKey: 'record' withValue: object.
	xrpcQuery
		addCheck: 'type' withValue: '"query"';
		addKey: 'parameters'
			withValue: (GtJSONObjectCompleter new
					valueCompleter: primitiveUnion;
					yourself);
		addKey: 'output' withValue: xrpcBody;
		addKey: 'errors'
			withValue: (GtJSONListCompleter new itemCompleter: xrpcError).
	xrpcProcedure
		addCheck: 'type' withValue: '"procedure"';
		addKey: 'parameters'
			withValue: (GtJSONObjectCompleter new
					valueCompleter: primitiveUnion;
					yourself);
		addKey: 'input' withValue: xrpcBody;
		addKey: 'output' withValue: xrpcBody;
		addKey: 'errors'
			withValue: (GtJSONListCompleter new itemCompleter: xrpcError).
	xrpcBody
		addKey: 'description';
		addKey: 'encoding' withValue: encodings;
		addKey: 'schema'
			withValue: (GtJSONUnionCompleter new
					addCompleter: refUnion;
					addCompleter: object;
					yourself).
	xrpcError addKeys: #('name' 'description').
	blob
		addCheck: 'type' withValue: '"blob"';
		addKeys: #('accept' 'maxSize').
	image
		addCheck: 'type' withValue: '"image"';
		addKeys: #('accept' 'maxSize' 'maxWidth' 'maxHeight').
	video
		addCheck: 'type' withValue: '"video"';
		addKeys: #('accept' 'maxSize' 'maxWidth' 'maxHeight' 'maxLength').
	audio
		addCheck: 'type' withValue: '"audio"';
		addKeys: #('accept' 'maxSize' 'maxLength').
	array
		addCheck: 'type' withValue: '"array"';
		addKeys: #('description' 'minLength' 'maxLength');
		addKey: 'items'
			withValue: (GtJSONUnionCompleter new
					addCompleter: refUnion;
					addCompleter: primitiveUnion;
					yourself).
	primitive
		addKey: 'type'
			withValue: (GtJSONValueCompleter new
					addValues: #('"boolean"' '"number"' '"integer"' '"string"');
					yourself);
		addKey: 'description'.
	boolean
		addCheck: 'type' withValue: '"boolean"';
		addKey: 'default' withValue: booleanValues;
		addKey: 'const' withValue: booleanValues.
	number
		addCheck: 'type' withValue: '"number"';
		addKeys: #('default' 'minimum' 'maximum' 'enum' 'const').
	integer
		addCheck: 'type' withValue: '"integer"';
		addKeys: #('default' 'minimum' 'maximum' 'enum' 'const').
	string
		addCheck: 'type' withValue: '"number"';
		addKeys: #('default' 'minLength' 'maxLength' 'enum' 'const' 'knownValues').
	self completer: doc
]

{ #category : #accessing }
GtApCompletionStrategy >> lexicons [
	^ lexicons
]

{ #category : #accessing }
GtApCompletionStrategy >> lexicons: anObject [
	lexicons := anObject
]

{ #category : #initialization }
GtApCompletionStrategy >> referencesStartingWith: aString [
	| stream |
	stream := #() asAsyncStream.
	((aString beginsWith: '"#') or: [ aString = '"' ])
		ifTrue: [ | key |
			key := aString allButFirst.
			stream := stream
					merge: (((((ast / JSONMemberNode) @ #name <- '"defs"') / JSONObjectNode
							/ JSONMemberNode) asOrderedCollection
							collect: [ :each | '#' , each name source allButFirst allButLast ])
							select: [ :each | key isEmpty or: [ each beginsWith: key ] ])
							asAsyncStream ].
	lexicons
		ifNotNil: [ | key |
			key := aString allButFirst.
			stream := stream
					merge: (lexicons definitions keys
							select: [ :each | key isEmpty or: [ each beginsWith: key ] ])
							asAsyncStream ].
	^ stream
]

{ #category : #initialization }
GtApCompletionStrategy >> requiredStartingWith: aString [
	^ ((((node \\ JSONObjectNode / JSONMemberNode) @ 'name' <- '"properties"')
		/ JSONObjectNode / JSONMemberNode collect: [ :each | each name source ])
		select: [ :each | each beginsWith: aString ]) asSortedCollection
]
