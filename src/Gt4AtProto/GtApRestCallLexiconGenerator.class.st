Class {
	#name : #GtApRestCallLexiconGenerator,
	#superclass : #Object,
	#instVars : [
		'restCalls',
		'id',
		'dataGenerator',
		'generatedData',
		'generatedCache',
		'description'
	],
	#category : #'Gt4AtProto-Generators'
}

{ #category : #accessing }
GtApRestCallLexiconGenerator class >> forRestCalls: aCollection [
	^ self new restCalls: aCollection
]

{ #category : #accessing }
GtApRestCallLexiconGenerator >> buildDataGenerator [
	generatedCache := Dictionary new.
	generatedData := OrderedCollection new.
	dataGenerator := GtApLexiconGenerator new id: self id
]

{ #category : #accessing }
GtApRestCallLexiconGenerator >> description [
	^ description
]

{ #category : #accessing }
GtApRestCallLexiconGenerator >> description: anObject [
	description := anObject
]

{ #category : #accessing }
GtApRestCallLexiconGenerator >> generateData: aClass [
	^ generatedCache
		at: aClass
		ifAbsentPut: [ | generated |
			generated := (dataGenerator classes: {aClass} asOrderedCollection)
					generateModel.
			generatedData addAll: generated.
			generated first ]
]

{ #category : #accessing }
GtApRestCallLexiconGenerator >> generateJson [
	^ STONJSON
		toStringPretty: {'lexicon' -> 1.
				'id' -> self id.
				'description' -> self description.
				'defs'
					-> (self generateModel
							collect: [ :aRecord | aRecord key -> aRecord record generateJson ])
							asDictionary} asDictionary
]

{ #category : #accessing }
GtApRestCallLexiconGenerator >> generateLexiconsForCall: aRestCall [
	^ aRestCall allowedMethods
		collect: [ :aMethod | 
			GtApLexiconRecord new
				key: aRestCall endpointName;
				id: self id , '#' , aRestCall endpointName;
				description: aRestCall comment;
				record: (self perform: (self generators at: aMethod) withArguments: {aRestCall}) ]
]

{ #category : #accessing }
GtApRestCallLexiconGenerator >> generateModel [
	self buildDataGenerator.
	^ (self restCalls
		flatCollect: [ :aRestCall | self generateLexiconsForCall: aRestCall ])
		, self popGeneratedData
]

{ #category : #accessing }
GtApRestCallLexiconGenerator >> generateProcedureFor: aRestCall [
	^ GtApLexiconXrpcProcedure new
		id: self id , '.' , aRestCall endpointName;
		methodName: self id , '.' , aRestCall endpointName;
		parameters: (GtApLexiconParameters new
				required: (aRestCall parameters select: #isRequired thenCollect: #name);
				properties: (aRestCall parameters collect: [ :aParameter | aParameter toLexiconIn: self ])
						asDictionary);
		errors: (aRestCall errors collect: [ :anError | {'name' -> anError} asDictionary ]);
		output: (GtApLexiconXrpcBody new
				encoding: 'application/json';
				schema: (aRestCall modelClass asLexiconOutputIn: self))
]

{ #category : #accessing }
GtApRestCallLexiconGenerator >> generateQueryFor: aRestCall [
	^ GtApLexiconXrpcQuery new
		id: self id , '.' , aRestCall endpointName;
		methodName: self id , '.' , aRestCall endpointName;
		parameters: (GtApLexiconParameters new
				required: (aRestCall parameters select: #isRequired thenCollect: #name);
				properties: (aRestCall parameters collect: [ :aParameter | aParameter toLexiconIn: self ])
						asDictionary);
		errors: (aRestCall errors collect: [ :anError | {'name' -> anError} asDictionary ]);
		output: (GtApLexiconXrpcBody new
				encoding: 'application/json';
				schema: (aRestCall modelClass asLexiconOutputIn: self))
]

{ #category : #accessing }
GtApRestCallLexiconGenerator >> generators [
	^ {#GET -> #generateQueryFor:.
		#POST -> #generateProcedureFor:} asDictionary
]

{ #category : #accessing }
GtApRestCallLexiconGenerator >> id [
	^ id
]

{ #category : #accessing }
GtApRestCallLexiconGenerator >> id: anObject [
	id := anObject
]

{ #category : #accessing }
GtApRestCallLexiconGenerator >> popGeneratedData [
	| res |
	res := generatedData.
	generatedData := nil.
	generatedCache := nil.
	^ res
]

{ #category : #accessing }
GtApRestCallLexiconGenerator >> restCalls [
	^ restCalls
]

{ #category : #accessing }
GtApRestCallLexiconGenerator >> restCalls: anObject [
	restCalls := anObject
]
