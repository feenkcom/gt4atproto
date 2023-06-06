Class {
	#name : #GtApPostStyler,
	#superclass : #BlTextStyler,
	#instVars : [
		'fuzzyUrlsParser',
		'fuzzyUrlParser',
		'snippetElement'
	],
	#category : #'Gt4AtProto-UI'
}

{ #category : #accessing }
GtApPostStyler >> initialize [
	super initialize.
	self initializeFuzzyUrlParser
]

{ #category : #accessing }
GtApPostStyler >> initializeFuzzyUrlParser [
	| scheme authority path query fragment domainPart domain blank |
	blank := #blank asPParser / #newline asPParser.
	scheme := (blank not , ':' asPParser negate) plus flatten.
	authority := (blank not , '/' asPParser negate) plus flatten.
	path := (blank not , '?' asPParser negate) plus flatten.
	query := (blank not , '#' asPParser negate) plus flatten.
	fragment := blank negate plus flatten.
	
	domainPart := (blank asPParser not , '.' asPParser not , '/' asPParser negate)
			plus flatten.
	domain := (domainPart , '.' asPParser , domainPart
			, ('.' asPParser , domainPart) star)
			==> [ :array | 
				array first , array second , array third
					, ('' join: (array fourth collect: [ :each | each first , each last ])) ].
	fuzzyUrlParser := ((scheme , ':' asPParser , '//' asPParser) ==> #first)
			optional , domain , path optional
			, (('?' asPParser , query) ==> #second) optional
			, (('#' asPParser , fragment) ==> #second) optional.
	fuzzyUrlsParser := (fuzzyUrlParser token sea ==> #second) star optimize
]

{ #category : #accessing }
GtApPostStyler >> postFromUrl: aUrl [
	| path handle recordId snippet did |
	path := '/' split: (aUrl removePrefix: 'https://bsky.app/').
	handle := path second.
	recordId := path last.
	snippet := LeBlueskySnippet new.
	snippet client
		ifNil: [ self error: 'Not logged into Bluesky, cannot retrieve post.' ].
	did := (snippet client comAtprotoIdentityResolveHandleHandle: handle) at: 'did'.
	^ (snippet client
		appBskyFeedGetPostThreadUri: 'at://' , did , '/app.bsky.feed.post/' , recordId
		depth: nil
		parentHeight: nil) at: 'thread'
]

{ #category : #accessing }
GtApPostStyler >> privateStyle: aText [
	| urls |
	urls := fuzzyUrlsParser parse: aText asString.
	urls
		do: [ :aToken | 
			| aUrlText |
			aUrlText := aText from: aToken start to: aToken stop.
			aUrlText
				foreground: BrGlamorousColors linkColor;
				attribute: GtApPostLinkAttribute new.
			((aToken value beginsWith: 'https://bsky.app/profile/')
				and: [ aToken value includesSubstring: '/post/' ])
				ifTrue: [ aUrlText
						attribute: (GtPlaygroundEvaluatedCodeViewButtonAttribute new
								view: #gtCardFor:;
								result: [ self postFromUrl: aToken value ];
								action: [ self snippetElement addEmbeddedPost: (self postFromUrl: aToken value) ]) ]
				ifFalse: [ aUrlText
						attribute: (GtPlaygroundEvaluatedCodeViewButtonAttribute new
								view: #gtViewCardFor:;
								result: [ GtApExternalWebsiteCard fromUrl: aToken value ];
								action: [ self snippetElement addCard: (GtApExternalWebsiteCard fromUrl: aToken value) ]) ] ].
	^ aText
]

{ #category : #accessing }
GtApPostStyler >> snippetElement [
	^ snippetElement
]

{ #category : #accessing }
GtApPostStyler >> snippetElement: anObject [
	snippetElement := anObject
]
