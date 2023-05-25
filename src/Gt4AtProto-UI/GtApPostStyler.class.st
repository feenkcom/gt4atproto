Class {
	#name : #GtApPostStyler,
	#superclass : #BlTextStyler,
	#instVars : [
		'fuzzyUrlsParser',
		'fuzzyUrlParser'
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
GtApPostStyler >> privateStyle: aText [
	| urls |
	urls := fuzzyUrlsParser parse: aText asString.
	urls do: [ :aToken |
		(aText from: aToken start to: aToken stop) foreground: BrGlamorousColors linkColor
	].
	^ aText
]
