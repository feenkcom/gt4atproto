Class {
	#name : #GtApClient,
	#superclass : #Object,
	#instVars : [
		'context'
	],
	#category : #'Gt4AtProto-XRPC'
}

{ #category : #accessing }
GtApClient class >> onServer: aUrl [
	^ self new server: aUrl
]

{ #category : #accessing }
GtApClient >> clientFor: aMethodId [
	| client |
	client := GtXRPCClient new
			server: self server;
			methodId: aMethodId.
			
	self isLoggedIn ifTrue: [
		client setAuthentication: context jwtAccess.
	].
	
	context addRequest: client asHistoricalRequest.
	
	^ client
]

{ #category : #accessing }
GtApClient >> clientFor: aMethodId body: aBody [
	^ (self clientFor: aMethodId) body: aBody
]

{ #category : #accessing }
GtApClient >> clientFor: aMethodId parameters: aDictionary [
	^ (self clientFor: aMethodId) parameters: aDictionary
]

{ #category : #accessing }
GtApClient >> context [
	^ context
]

{ #category : #accessing }
GtApClient >> context: anObject [
	context := anObject
]

{ #category : #accessing }
GtApClient >> gtProceduresFor: aView [
	<gtView>
	^ aView list
		title: 'Procedures';
		priority: 2;
		items: [ self procedures sorted: [:a :b | a method selector < b method selector ] ];
		itemText: [:aPragma | aPragma method selector ]
]

{ #category : #accessing }
GtApClient >> gtQueriesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Queries';
		priority: 1;
		items: [ self queries sorted: [:a :b | a method selector < b method selector ]];
		column: 'Name' text: [:aPragma | aPragma method selector ]";
		column: 'Play'
			stencil: [ :aPragma | 
				BrButton new
					aptitude: BrGlamorousButtonWithIconAptitude;
					label: 'Send Query';
					icon: BrGlamorousVectorIcons play;
					action: [ :aButton | aButton phlow spawnObject: (self perform: aPragma method selector) ] ]"
]

{ #category : #accessing }
GtApClient >> gtRequestHistoryFor: aView [
	<gtView>
	
	^ context gtRequestHistoryFor: aView
]

{ #category : #accessing }
GtApClient >> gtSpotterProceduresFor: aSearch [
	<gtSearch>
	^ aSearch list
		priority: 20;
		items: [ self procedures sorted: [:a :b | a method selector < b method selector ] ];
		title: 'Procedures';
		itemName: [:p | p method selector ];
		filterBySubstring": [:p | p method selector ]"
]

{ #category : #accessing }
GtApClient >> gtSpotterQueriesFor: aSearch [
	<gtSearch>
	^ aSearch list
		priority: 10;
		items: [ self queries sorted: [ :a :b | a method selector < b method selector ] ];
		title: 'Queries';
		itemName: [ :p | p method selector ];
		filterBySubstring": [:p | p method selector ]"
]

{ #category : #accessing }
GtApClient >> handle [
	^ context handle
]

{ #category : #accessing }
GtApClient >> initialize [
	context := GtApXRPCContext new
]

{ #category : #accessing }
GtApClient >> isLoggedIn [
	^ context isLoggedIn
]

{ #category : #accessing }
GtApClient >> loginUser: aUserNameString withPass: aPasswordString [
	<xrpcProcedure>
	| result |
	result := self
			procedureOn: 'com.atproto.server.createSession'
			withBody: {'identifier' -> aUserNameString.
							'password' -> aPasswordString} asDictionary.

	context handle: aUserNameString.
	context loginInformation: result
]

{ #category : #accessing }
GtApClient >> procedureOn: aMethodId withBinary: anObject [
	^ (self
		clientFor: aMethodId
		body: anObject readStream) procedure
]

{ #category : #accessing }
GtApClient >> procedureOn: aMethodId withBody: aBodyDictionary [
	^ (self
		clientFor: aMethodId
		body: (STONJSON toString: (aBodyDictionary select: #isNotNil))) procedure
]

{ #category : #accessing }
GtApClient >> procedureOn: aMethodId withFile: aFile [
	^ ((self clientFor: aMethodId body: aFile gtBinaryContents)
		contentType: (ZnMimeType forFilenameExtension: aFile extension)) procedure
]

{ #category : #accessing }
GtApClient >> procedures [
	^ Pragma allNamed: #xrpcProcedure in: self class
]

{ #category : #accessing }
GtApClient >> queries [
	^ Pragma allNamed: #xrpcQuery in: self class
]

{ #category : #accessing }
GtApClient >> queryOn: aMethodId [
	| res filteredProperties |
	res := (self clientFor: aMethodId) query.

	(res includesKey: 'cursor') ifFalse: [ ^ res ].

	filteredProperties := res keys reject: [ :aKey | aKey = 'cursor' ].

	filteredProperties size > 1
		ifTrue: [ | rightKey |
			rightKey := res keys
					detect: [ :aKey | ('cursor' = aKey) not and: [ (res at: aKey) isKindOf: Array ] ]
					ifNone: [ self error: 'Could not determine what the cursor refers to.' ].
			^ res
				at: rightKey
				put: (GtApResultStream new
						cursor: (res removeKey: 'cursor');
						key: rightKey;
						resultsList: (res removeKey: rightKey) asOrderedCollection;
						method: aMethodId;
						client: self) ].

	^ GtApResultStream new
		result: res;
		method: aMethodId;
		client: self
]

{ #category : #accessing }
GtApClient >> queryOn: aMethodId parameters: aDictionary [
	| res filteredProperties |
	res := (self clientFor: aMethodId parameters: aDictionary) query.

	(res includesKey: 'cursor') ifFalse: [ ^ res ].

	filteredProperties := res keys reject: [ :aKey | aKey = 'cursor' ].

	filteredProperties size > 1
		ifTrue: [ | rightKey |
			rightKey := res keys
					detect: [ :aKey | ('cursor' = aKey) not and: [ (res at: aKey) isKindOf: Array ] ]
					ifNone: [ self error: 'Could not determine what the cursor refers to.' ].
			res
				at: rightKey
				put: (GtApResultStream new
						cursor: (res removeKey: 'cursor');
						key: rightKey;
						resultsList: (res removeKey: rightKey) asOrderedCollection;
						method: aMethodId;
						parameters: aDictionary;
						client: self).
			^ res ].

	^ GtApResultStream new
		result: res;
		method: aMethodId;
		parameters: aDictionary;
		client: self
]

{ #category : #accessing }
GtApClient >> server [
	^ context server
]

{ #category : #accessing }
GtApClient >> server: anObject [
	context server: anObject
]
