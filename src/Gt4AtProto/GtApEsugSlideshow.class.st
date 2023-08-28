Class {
	#name : #GtApEsugSlideshow,
	#superclass : #PrioritySlideshow,
	#category : #'Gt4AtProto-Slideshows'
}

{ #category : #accessing }
GtApEsugSlideshow >> appetizerJson [
	^ '{
  "lexicon": 1,
  "id": "com.atproto.identity.updateHandle",
  "defs": {
    "main": {
      "type": "procedure",
      "description": "Updates the handle of the account",
      "input": {
        "encoding": "application/json",
        "schema": {
          "type": "object",
          "required": [
            "handle"
          ],
          "properties": {
            "handle": {
              "type": "string",
              "format": "handle"
            }
          }
        }
      }
    }
  }
}'
]

{ #category : #accessing }
GtApEsugSlideshow >> appetizerJson2 [
	^ '{
  "lexicon": 1,
  "id": "app.bsky.graph.follow",
  "defs": {
    "main": {
      "type": "record",
      "description": "A social follow.",
      "key": "tid",
      "record": {
        "type": "object",
        "required": [
          "subject",
          "createdAt"
        ],
        "properties": {
          "subject": {
            "type": "string",
            "format": "did"
          },
          "createdAt": {
            "type": "string",
            "format": "datetime"
          }
        }
      }
    }
  }
}'
]

{ #category : #accessing }
GtApEsugSlideshow >> bigCodeAndTextSize [
	^ 25
]

{ #category : #accessing }
GtApEsugSlideshow >> codegenHowFor: aSlide [
	<gtSlide>
	^ aSlide element
		priority: (self priorityFor: #codegenHowFor:);
		element: [ (GtPager
				createWrappedOn: (LePagePhlowTool page: (self db pageNamed: 'Generating code from lexicons')))
				maximized ]
]

{ #category : #accessing }
GtApEsugSlideshow >> db [
	<gtExample>
	<noTest>
	^ LeDatabasesRegistry getDatabaseByName: self dbName
]

{ #category : #accessing }
GtApEsugSlideshow >> dbName [
	^ 'gt4atproto-lepiter'
]

{ #category : #accessing }
GtApEsugSlideshow >> definitionSlideFor: aSlide [
	<gtSlide>
	^ aSlide paragraph
		priority: (self priorityFor: #definitionSlideFor:);
		subtitleWithFormat: (self asTitle: 'What is atproto?' asRopedText bold);
		paragraphWithFormat: (self
				asBigText: 'The ' asRopedText , 'Authenticated Transfer Protocol' asRopedText bold
						, ', aka ' asRopedText , 'atproto' asRopedText bold
						, ', is a federated protocol for large-scale distributed social applications.'
								asRopedText)
]

{ #category : #accessing }
GtApEsugSlideshow >> environmentFor: aSlide [
	<gtSlide>
	^ aSlide element
		priority: (self priorityFor: #environmentFor:);
		element: [ (GtPager
				createWrappedOn: (LePagePhlowTool page: (self db pageNamed: 'Posting to Bluesky from your knowledge base')))
				maximized ]
]

{ #category : #accessing }
GtApEsugSlideshow >> lexiconAppetizer2For: aSlide [
	<gtSlide>
	^ aSlide element
		priority: (self priorityFor: #lexiconAppetizer2For:);
		element: [ BlElement new
				layout: BlFrameLayout new;
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical matchParent ];
				addChild: (BlElement new
						aptitude: BrShadowAptitude;
						background: Color white;
						layout: BlLinearLayout new;
						constraintsDo: [ :c | 
							c frame horizontal alignCenter.
							c frame vertical alignCenter.
							c horizontal fitContent.
							c vertical fitContent ];
						padding: (BlInsets all: 10);
						margin: (BlInsets all: 10);
						addChild: (BrEditor new
								aptitude: BrGlamorousCodeEditorAptitude;
								styler: JSONParser gtStyler;
								text: self appetizerJson2;
								fitContent)) ]
]

{ #category : #accessing }
GtApEsugSlideshow >> lexiconAppetizerCode2For: aSlide [
	<gtSlide>
	^ aSlide classCoder
		priority: (self priorityFor: #lexiconAppetizerCode2For:);
		class: GtApGeneratedClient";
		expandMethodAt: 56"
]

{ #category : #accessing }
GtApEsugSlideshow >> lexiconAppetizerCodeFor: aSlide [
	<gtSlide>
	^ aSlide classCoder
		priority: (self priorityFor: #lexiconAppetizerCodeFor:);
		class: AppBskyGraphFollowMain;
		expandMethodAt: 1;
		expandMethodAt: 5
]

{ #category : #accessing }
GtApEsugSlideshow >> lexiconAppetizerFor: aSlide [
	<gtSlide>
	^ aSlide element
		priority: (self priorityFor: #lexiconAppetizerFor:);
		element: [ BlElement new
				layout: BlFrameLayout new;
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical matchParent ];
				addChild: (BlElement new
						aptitude: BrShadowAptitude;
						background: Color white;
						layout: BlLinearLayout new;
						constraintsDo: [ :c | 
							c frame horizontal alignCenter.
							c frame vertical alignCenter.
							c horizontal fitContent.
							c vertical fitContent ];
						padding: (BlInsets all: 10);
						margin: (BlInsets all: 10);
						addChild: (BrEditor new
								aptitude: BrGlamorousCodeEditorAptitude;
								styler: JSONParser gtStyler;
								text: self appetizerJson;
								fitContent)) ]
]

{ #category : #accessing }
GtApEsugSlideshow >> nextQuestionSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: (self priorityFor: #nextQuestionSlideFor:);
		titleBottomPadding: 20;
		titleWithFormat: (self asTitle: 'So what?')
]

{ #category : #accessing }
GtApEsugSlideshow >> questionSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: (self priorityFor: #questionSlideFor:);
		titleBottomPadding: 20;
		titleWithFormat: (self asTitle: '???')
]

{ #category : #accessing }
GtApEsugSlideshow >> shortAnswerSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: (self priorityFor: #shortAnswerSlideFor:);
		titleBottomPadding: 20;
		titleWithFormat: (self asTitle: 'In brief: we built a client environment')
]

{ #category : #accessing }
GtApEsugSlideshow >> slidePriorities [
	"Instead of manually setting priorities, just list the slides in order here."
	<gtExample>
	^ #( 
		titleSlideFor:
		subtitleSlideFor:
		definitionSlideFor:
		questionSlideFor:
		vocabSlideFor:
		shortAnswerSlideFor:
		nextQuestionSlideFor:
		lexiconAppetizerFor:
		lexiconAppetizer2For:
		lexiconAppetizerCodeFor:
		lexiconAppetizerCode2For:
		codegenHowFor:
		environmentFor:
	)
]

{ #category : #accessing }
GtApEsugSlideshow >> subtitleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: (self priorityFor: #subtitleSlideFor:);
		titleBottomPadding: 20;
		titleWithFormat: (self asTitle: 'What is atproto?')
]

{ #category : #accessing }
GtApEsugSlideshow >> titleSize [
	^ 45
]

{ #category : #accessing }
GtApEsugSlideshow >> titleSlideFor: aSlide [
	<gtSlide>
	^ aSlide titleWithFooter
		priority: (self priorityFor: #titleSlideFor:);
		titleBottomPadding: 20;
		subtitleBottomPadding: 40;
		titleWithFormat: (self asTitle: 'gt4aproto');
		footerWithFormat: (self asBigText: 'Veit Heller (feenk)')
]

{ #category : #accessing }
GtApEsugSlideshow >> vocabSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: (self priorityFor: #vocabSlideFor:);
		titleBottomPadding: 20;
		titleWithFormat: (self asTitle: 'DID, PDS, BGS, NSID, XRPC...')
]
