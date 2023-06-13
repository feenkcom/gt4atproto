Class {
	#name : #GtApRestCallLexiconGenerator,
	#superclass : #Object,
	#instVars : [
		'restCalls',
		'id',
		'dataGenerator',
		'generatedData',
		'generatedCache'
	],
	#category : #'Gt4AtProto-Lexicon-Generators'
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
GtApRestCallLexiconGenerator >> generateLexiconsForCall: aRestCall [
	^ aRestCall allowedMethods
		collect: [ :aMethod | self perform: (self generators at: aMethod) withArguments: {aRestCall} ]
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
		id: self id , '.', ('.' join: aRestCall pattern);
		methodName: self id , '.', ('.' join: aRestCall pattern);
		parameters: (GtApLexiconParameters new
				required: aRestCall parameters keys;
				properties: (aRestCall parameters associations
						collect: [ :aPair | aPair key -> (aPair value asLexiconOutputIn: self) ])
						asDictionary);
		errors: aRestCall errors;
		input: (GtApLexiconXrpcBody new
				encoding: 'application/json';
				schema: (aRestCall modelClass asLexiconOutputIn: self))
]

{ #category : #accessing }
GtApRestCallLexiconGenerator >> generateQueryFor: aRestCall [
	^  GtApLexiconXrpcQuery new
		id: self id , '.', ('.' join: aRestCall pattern);
		methodName: self id , '.', ('.' join: aRestCall pattern);
		parameters: (GtApLexiconParameters new
				required: aRestCall parameters keys;
				properties: (aRestCall parameters associations
						collect: [ :aPair | aPair key -> (aPair value asLexiconOutputIn: self) ])
						asDictionary);
		errors: aRestCall errors;
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
