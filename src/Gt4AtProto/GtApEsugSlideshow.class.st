Class {
	#name : #GtApEsugSlideshow,
	#superclass : #PrioritySlideshow,
	#category : #'Gt4AtProto-Slideshows'
}

{ #category : #accessing }
GtApEsugSlideshow >> bigCodeAndTextSize [
	^ 25
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
GtApEsugSlideshow >> questionSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: (self priorityFor: #questionSlideFor:);
		titleBottomPadding: 20;
		titleWithFormat: (self asTitle: '???')
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
