Class {
	#name : #GtApLexiconRestCall,
	#superclass : #GtApRestCall,
	#category : #'Gt4AtProto-Server'
}

{ #category : #accessing }
GtApLexiconRestCall class >> errors [
	^ {'NotFound'}
]

{ #category : #accessing }
GtApLexiconRestCall class >> match: aRequest [
	^ aRequest method asLowercase asSymbol = #get
		and: [ aRequest uri pathSegments last = 'lexicon' ]
]

{ #category : #accessing }
GtApLexiconRestCall class >> parameters [
	^ {}
]

{ #category : #accessing }
GtApLexiconRestCall class >> pattern [
	^ {'**'.
		'lexicon'}
]

{ #category : #accessing }
GtApLexiconRestCall >> get [
	| endpoint json |
	self request uri pathSegments removeLast.
	endpoint := (self delegate uriSpace rootClass withAllSubclasses
			reject: [ :aClass | aClass isAbstract or: [ aClass = self class ] ])
			detect: [ :aClass | aClass match: self request ]
			ifNone: [ self notFound: self request withMessage: 'Not found'.
				^ self ].

	json := GtApRestCallLexiconGenerator new
			id: 'com.gtoolkit.lepiter';
			description: 'Lepiter definitions for rest call in ' , self request uri asString;
			restCalls: {endpoint};
			generateJson.

	self response: (ZnResponse ok: (ZnEntity json: json))
]
