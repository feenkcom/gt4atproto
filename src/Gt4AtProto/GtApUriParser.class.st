Class {
	#name : #GtApUriParser,
	#superclass : #SmaCCParser,
	#category : #'Gt4AtProto-URI'
}

{ #category : #'generated-accessing' }
GtApUriParser class >> cacheId [
	^'2023-05-15T21:19:37.231201+02:00'
]

{ #category : #generated }
GtApUriParser class >> definitionComment [
"%root Root;
%prefix GtApUri;
%suffix Node;

<method_chars>
	: [0-9a-zA-Z]+
	;
<id_chars>
	: [0-9a-zA-Z]+
	;
<reg_chars>
	: ([a-zA-Z0-9] | \- | _ | \.)+
	;
<fragment_chars>
	: ([a-zA-Z0-9] | \- | _ | \. | \? | \#)+ 
	;
<segment>
	: [a-zA-Z] ([a-zA-Z0-9] | _)+
	;

Root
	: ""at://"" Authority Path Fragment
	| ""at://"" Authority Path
	| ""at://"" Authority
	;
Authority
	: ""did:"" <method_chars> "":"" <id_chars> {{Did}}
	| <reg_chars> {{RegName}}
	;
Path
	: NsId <reg_chars> {{}}
	;
NsId
	: NsAuthority ""."" <segment> {{}}
	;
NsAuthority
	: <segment> ""."" NsAuthority {{}}
	| <segment> {{}}
	;
Fragment
	: ""#"" <fragment_chars> {{}}
	;"
]

{ #category : #generated }
GtApUriParser class >> reduceTable [
^#(
	#(13 1 #reduceActionForAuthority2: 362498 false) 
	#(12 2 #liftSecondValue: 270339 false) 
	#(12 3 #liftSecondValue: 270338 false) 
	#(12 4 #liftSecondValue: 270337 false) 
	#(14 2 #reduceActionForPath1: 452609 false) 
	#(13 4 #reduceActionForAuthority1: 362497 false) 
	#(16 3 #reduceActionForNsAuthority1: 529409 false) 
	#(17 2 #reduceActionForFragment1: 598017 false) 
	#(15 3 #reduceActionForNsId1: 486401 false)
	).
]

{ #category : #generated }
GtApUriParser class >> scannerClass [
	^GtApUriScanner
]

{ #category : #generated }
GtApUriParser class >> startingStateForRoot [
	^ 1
]

{ #category : #generated }
GtApUriParser class >> symbolNames [
	^ #('"#"' '"."' '":"' '"at://"' '"did:"' '<method_chars>' '<id_chars>' '<reg_chars>' '<fragment_chars>' '<segment>' 'B e g i n' 'Root' 'Authority' 'Path' 'NsId' 'NsAuthority' 'Fragment' 'E O F' 'error')
]

{ #category : #generated }
GtApUriParser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #GtApUriRootNode #GtApUriRootNode #GtApUriRootNode #GtApUriPathNode #GtApUriNsIdNode #GtApUriNsAuthorityNode #GtApUriFragmentNode #SmaCCToken #SmaCCErrorNode)
]

{ #category : #generated }
GtApUriParser class >> transitionTable [
^#(
#[1 0 9 0 4 0 13 0 12] 
#[1 0 17 0 5 0 21 0 8 0 25 0 13] 
#[0 0 0 0 18] 
#[0 0 29 0 6] 
#[0 0 6 0 10 0 18] 
#[1 0 33 0 10 0 37 0 14 0 41 0 15 0 45 0 16 0 10 0 18] 
#[0 0 49 0 3] 
#[0 0 53 0 2] 
#[1 0 57 0 1 0 61 0 17 0 14 0 18] 
#[0 0 65 0 8] 
#[0 0 69 0 2] 
#[0 0 73 0 7] 
#[1 0 33 0 10 0 77 0 16] 
#[0 0 81 0 9] 
#[0 0 18 0 18] 
#[0 0 22 0 1 0 18] 
#[0 0 85 0 10] 
#[0 0 26 0 10 0 18] 
#[0 0 30 0 2] 
#[0 0 34 0 18] 
#[0 0 38 0 8]
	).
]

{ #category : #'generated-reduction actions' }
GtApUriParser >> reduceActionForAuthority1: nodes [
	| result |
	result := GtApUriDidNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
GtApUriParser >> reduceActionForAuthority2: nodes [
	| result |
	result := GtApUriRegNameNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
GtApUriParser >> reduceActionForFragment1: nodes [
	| result |
	result := GtApUriFragmentNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
GtApUriParser >> reduceActionForNsAuthority1: nodes [
	| result |
	result := nodes at: 3.
	^ result
]

{ #category : #'generated-reduction actions' }
GtApUriParser >> reduceActionForNsId1: nodes [
	| result |
	result := GtApUriNsIdNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
GtApUriParser >> reduceActionForPath1: nodes [
	| result |
	result := GtApUriPathNode new.
	^ result
]
