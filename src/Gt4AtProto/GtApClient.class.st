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
GtApClient >> loginInformation: anIdentity [
	self context loginInformationRaw: anIdentity
]

{ #category : #accessing }
GtApClient >> loginUser: aUserNameString withPass: aPasswordString [
	<xrpcProcedure>
	| result |
	result := self
			procedureOn: 'com.atproto.server.createSession'
			withBody: {'identifier' -> aUserNameString.
							'password' -> aPasswordString} asDictionary.

	context loginInformation: result for: aUserNameString
]

{ #category : #accessing }
GtApClient >> paginatedQueryOn: aMethodId parameters: aDictionary [
	| res filteredProperties rightKey hasCursor |
	res := [ (self clientFor: aMethodId parameters: aDictionary) query ]
			on: GtXRPCError
			do: [ :anError | 
				anError errorMessage = 'ExpiredToken'
					ifTrue: [ self refreshToken.
						^ self queryOn: aMethodId parameters: aDictionary ]
					ifFalse: [ anError signal ] ].



	hasCursor := res includesKey: 'cursor'.

	filteredProperties := res keys reject: [ :aKey | aKey = 'cursor' ].

	filteredProperties size > 1
		ifTrue: [ rightKey := res keys
					detect: [ :aKey | ('cursor' = aKey) not and: [ (res at: aKey) isKindOf: Array ] ]
					ifNone: [ self error: 'Could not determine what the cursor refers to.' ].
			res
				at: rightKey
				put: (GtApResultStream new
						cursor: (hasCursor ifTrue: [ res removeKey: 'cursor' ]);
						key: rightKey;
						resultsList: (res removeKey: rightKey) asOrderedCollection;
						method: aMethodId;
						parameters: aDictionary;
						client: self).
			^ res ].

	hasCursor
		ifFalse: [ ^ GtApResultStream new
				resultsList: (res at: filteredProperties first) asOrderedCollection;
				method: aMethodId;
				parameters: aDictionary;
				client: self ].

	^ GtApResultStream new
		result: res;
		method: aMethodId;
		parameters: aDictionary;
		client: self
]

{ #category : #accessing }
GtApClient >> procedureOn: aMethodId withBinary: anObject [
	[ ^ (self clientFor: aMethodId body: anObject readStream) procedure ]
		on: GtXRPCError
		do: [ :anError | 
			anError errorMessage = 'ExpiredToken'
				ifTrue: [ self refreshToken.
					^ self procedureOn: aMethodId withBinary: anObject ]
				ifFalse: [ anError signal ] ]
]

{ #category : #accessing }
GtApClient >> procedureOn: aMethodId withBody: aBodyDictionary [
	[ ^ (self
		clientFor: aMethodId
		body: (STONJSON toString: (aBodyDictionary select: #isNotNil))) procedure ]
		on: GtXRPCError
		do: [ :anError | 
			anError errorMessage = 'ExpiredToken'
				ifTrue: [ self refreshToken.
					^ self procedureOn: aMethodId withBody: aBodyDictionary ]
				ifFalse: [ anError signal ] ]
]

{ #category : #accessing }
GtApClient >> procedureOn: aMethodId withFile: aFile [
	[ ^ ((self clientFor: aMethodId body: aFile gtBinaryContents)
		contentType: (ZnMimeType forFilenameExtension: aFile extension)) procedure ]
		on: GtXRPCError
		do: [ :anError | 
			anError errorMessage = 'ExpiredToken'
				ifTrue: [ self refreshToken.
					^ self procedureOn: aMethodId withFile: aFile ]
				ifFalse: [ anError signal ] ]
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
	[ res := (self clientFor: aMethodId) query ]
		on: GtXRPCError
		do: [ :anError | 
			anError errorMessage = 'ExpiredToken'
				ifTrue: [ self refreshToken.
					^ self queryOn: aMethodId ]
				ifFalse: [ anError signal ] ].

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
	^ [ (self clientFor: aMethodId parameters: aDictionary) query ]
		on: GtXRPCError
		do: [ :anError | 
			anError errorMessage = 'ExpiredToken'
				ifTrue: [ self refreshToken.
					^ self queryOn: aMethodId parameters: aDictionary ]
				ifFalse: [ anError signal ] ]
]

{ #category : #accessing }
GtApClient >> refreshToken [
	<xrpcProcedure>
	| client |
	client := GtXRPCClient new
			server: self server;
			methodId: 'com.atproto.server.refreshSession';
			setAuthentication: context jwtRefresh.

	context addRequest: client asHistoricalRequest.

	context replaceLoginInformation: client procedure
]

{ #category : #accessing }
GtApClient >> server [
	^ context server
]

{ #category : #accessing }
GtApClient >> server: anObject [
	context server: anObject
]

{ #category : #'as yet unclassified' }
GtApClient >> verify [
	[ self refreshToken ] on: GtXRPCError do: [ ^ false ].

	^ true
]
