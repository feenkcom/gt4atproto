Class {
	#name : #GtApReplyElement,
	#superclass : #BrVerticalPane,
	#instVars : [
		'snippet'
	],
	#category : #'Gt4Bluesky-Snippet'
}

{ #category : #accessing }
GtApReplyElement >> initialize [
	super initialize.

	self fitContent
]

{ #category : #accessing }
GtApReplyElement >> snippet [
	^ snippet
]

{ #category : #accessing }
GtApReplyElement >> snippet: anObject [
	| atpParent |
	snippet := anObject.

	self removeChildren.

	atpParent := self snippet atpParent.

	self
		addChild: (GtApAddReplyForm new
				isReadOnly: false;
				url: 'https://bsky.app/profile/' , atpParent atpPost atpAuthor atpHandle , '/post/'
						, ('/' split: atpParent atpPost atpUri) last;
				onAccept: [ :aUrl | 
					self snippet parentFromUrl: aUrl.
					self inUIProcessDo: [ self fireEvent: BrDropdownHideWish new ] ]) asElement.
	self addChild: (GtApFeedPostSummaryElement new post: atpParent)
]
