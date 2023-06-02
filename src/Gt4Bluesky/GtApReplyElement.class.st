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

	self addChild: (GtApFeedPostSummaryElement new post: atpParent).
	self
		addChild: (GtApAddReplyForm new
				isReadOnly: self snippet hasPost;
				url: 'https://app.bsky/profile/' , atpParent atpPost atpAuthor atpHandle , '/post/'
						, ('/' split: atpParent atpPost atpUri) last;
				onAccept: [ :aUrl | 
					self snippet parentFromUrl: aUrl.
					self dispatchEvent: BrDropdownHideWish new ]) asElement
]
