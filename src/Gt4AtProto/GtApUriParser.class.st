Class {
	#name : #GtApUriParser,
	#superclass : #SmaCCParser,
	#category : #'Gt4AtProto-URI'
}

{ #category : #'generated-accessing' }
GtApUriParser class >> cacheId [
	^'2023-05-16T18:15:22.67687+02:00'
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
	: ([a-zA-Z0-9] | \- | _ | \. | (% [a-zA-Z0-9] [a-zA-Z0-9]))+
	;
<reg_chars>
	: [a-zA-Z0-9\-_\.]+
	;
<fragment_chars>
	: ([a-zA-Z0-9] | \- | _ | \. | \? | \#)+ 
	;
<segment>
	: [a-zA-Z] ([a-zA-Z0-9\-])+
	;

Root
	: ""at://"" Authority 'authority' Path 'path' Fragment 'fragment' {{}}
	| ""at://"" Authority 'authority' Path 'path' {{}}
	| ""at://"" Authority 'authority' {{}}
	;
Authority
	: ""did:"" <method_chars> 'methodName' "":"" <id_chars> 'methodSpecificId' {{Did}}
	| <reg_chars> 'host' {{RegName}}
	;
Path
	: ""/"" NsId 'id' ""/"" RecordId 'recordId' {{}}
	| ""/"" NsId 'id' {{}}
	;
RecordId
	: <segment> 'recordId'
	;
NsId
	: <segment> 'segment' {{}}
	| NsId 'child' ""."" <segment> 'segment'  {{}}
	;
Fragment
	: ""#"" <fragment_chars> 'fragment' {{}}
	;"
]

{ #category : #generated }
GtApUriParser class >> reduceTable [
^#(
	#(14 1 #reduceActionForAuthority2: 474114 false) 
	#(13 2 #reduceActionForRoot3: 304131 false) 
	#(13 3 #reduceActionForRoot2: 304130 false) 
	#(17 1 #reduceActionForNsId1: 718849 false) 
	#(15 2 #reduceActionForPath2: 604162 false) 
	#(13 4 #reduceActionForRoot1: 304129 false) 
	#(14 4 #reduceActionForAuthority1: 474113 false) 
	#(18 2 #reduceActionForFragment1: 802817 false) 
	#(17 3 #reduceActionForNsId2: 718850 false) 
	#(16 1 #liftFirstValue: 681985 false) 
	#(15 4 #reduceActionForPath1: 604161 false)
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
	^ #('"#"' '"."' '"/"' '":"' '"at://"' '"did:"' '<method_chars>' '<id_chars>' '<reg_chars>' '<fragment_chars>' '<segment>' 'B e g i n' 'Root' 'Authority' 'Path' 'RecordId' 'NsId' 'Fragment' 'E O F' 'error')
]

{ #category : #generated }
GtApUriParser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #GtApUriRootNode #GtApUriRootNode #GtApUriRootNode #GtApUriPathNode #SmaCCToken #GtApUriNsIdNode #GtApUriFragmentNode #SmaCCToken #SmaCCErrorNode)
]

{ #category : #generated }
GtApUriParser class >> transitionTable [
^#(
#[1 0 9 0 5 0 13 0 13] 
#[1 0 17 0 6 0 21 0 9 0 25 0 14] 
#[0 0 0 0 19] 
#[0 0 29 0 7] 
#[0 0 6 0 3 0 19] 
#[1 0 33 0 3 0 37 0 15 0 10 0 19] 
#[0 0 41 0 4] 
#[1 0 45 0 11 0 49 0 17] 
#[1 0 53 0 1 0 57 0 18 0 14 0 19] 
#[0 0 61 0 8] 
#[0 0 18 0 1 0 2 0 3 0 19] 
#[1 0 22 0 1 0 65 0 2 0 69 0 3 0 22 0 19] 
#[0 0 73 0 10] 
#[0 0 26 0 19] 
#[0 0 30 0 3 0 19] 
#[0 0 77 0 11] 
#[0 0 85 0 11 0 16] 
#[0 0 34 0 19] 
#[0 0 38 0 1 0 2 0 3 0 19] 
#[0 0 42 0 1 0 19] 
#[0 0 46 0 1 0 19]
	).
]

{ #category : #'generated-reduction actions' }
GtApUriParser >> reduceActionForAuthority1: nodes [
	| result |
	result := GtApUriDidNode new.
	result methodName: (nodes at: 2).
	result methodSpecificId: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
GtApUriParser >> reduceActionForAuthority2: nodes [
	| result |
	result := GtApUriRegNameNode new.
	result host: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
GtApUriParser >> reduceActionForFragment1: nodes [
	| result |
	result := GtApUriFragmentNode new.
	result fragment: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
GtApUriParser >> reduceActionForNsId1: nodes [
	| result |
	result := GtApUriNsIdNode new.
	result segment: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
GtApUriParser >> reduceActionForNsId2: nodes [
	| result |
	result := GtApUriNsIdNode new.
	result child: (nodes at: 1).
	result segment: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
GtApUriParser >> reduceActionForPath1: nodes [
	| result |
	result := GtApUriPathNode new.
	result id: (nodes at: 2).
	result recordId: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
GtApUriParser >> reduceActionForPath2: nodes [
	| result |
	result := GtApUriPathNode new.
	result id: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
GtApUriParser >> reduceActionForRoot1: nodes [
	| result |
	result := GtApUriRootNode new.
	result authority: (nodes at: 2).
	result path: (nodes at: 3).
	result fragment: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
GtApUriParser >> reduceActionForRoot2: nodes [
	| result |
	result := GtApUriRootNode new.
	result authority: (nodes at: 2).
	result path: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
GtApUriParser >> reduceActionForRoot3: nodes [
	| result |
	result := GtApUriRootNode new.
	result authority: (nodes at: 2).
	^ result
]

{ #category : #accessing }
GtApUriParser >> tryAllTokens [
	^ true
]
