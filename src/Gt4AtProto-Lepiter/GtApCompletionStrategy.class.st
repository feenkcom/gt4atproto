Class {
	#name : #GtApCompletionStrategy,
	#superclass : #GtJSONCompletionStrategy,
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
GtApCompletionStrategy >> initialize [
	| ref doc userType token object record xrpcQuery xrpcProcedure xrpcBody xrpcError blob image video audio array primitive boolean number integer string userUnion primitiveUnion booleanValues encodings |
	super initialize.
	ref := GtJSONEmptyCompleter instance.
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
			block: [ :str :position | 
				(str beginsWith: '"')
					ifTrue: [ (self class encodings asyncStreamStartingWith: str allButFirst)
							collect: [ :each | 
								| new |
								new := '"' , each , '"'.
								GtInsertTextCompletionAction
									labeled: (GtJSONCompleter labelFor: new withSearch: str)
									completion: (new allButFirst: str size)
									position: position
									from: position - str size + 1 ] ]
					ifFalse: [ #() ] ].
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
	doc
		addKeys: #('lexicon' 'id' 'revision' 'description');
		addKey: 'defs'
			withValue: (GtJSONObjectCompleter new
					valueCompleter: (GtJSONUnionCompleter new
							addCompleter: userUnion;
							addCompleter: array;
							addCompleter: primitiveUnion;
							addCompleter: (GtJSONListCompleter new
									itemCompleter: ref;
									yourself));
					yourself).
	userType
		addKey: 'type'
			withValue: (GtJSONValueCompleter new
					addValues: #('"query"' '"procedure"' '"record"' '"token"' '"object"' '"blob"' '"image"' '"video"' '"audio"'));
		addKey: 'description'.
	token addCheck: 'type' withValue: '"token"'.
	object
		addCheck: 'type' withValue: '"object"';
		addKey: 'required';
		addKey: 'properties'
			withValue: (GtJSONObjectCompleter new
					valueCompleter: (GtJSONUnionCompleter new
							addCompleter: ref;
							addCompleter: array;
							addCompleter: primitive;
							addCompleter: (GtJSONListCompleter new
									itemCompleter: ref;
									yourself);
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
		addKey: 'schema' withValue: object.
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
					addCompleter: ref;
					addCompleter: primitiveUnion;
					addCompleter: (GtJSONListCompleter new
							itemCompleter: ref;
							yourself);
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
