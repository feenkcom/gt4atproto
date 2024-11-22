Trait {
	#name : #TAppBskyRichtextFacetTag,
	#category : #'Gt4AtProto-Extensions-Traits'
}

{ #category : #'as yet unclassified' }
TAppBskyRichtextFacetTag >> adorn: aText usingPost: aPost [
	aText
		appendingAdornment: [ :aTBrTextEditorTextualPiece :anEditorElement | 
			| button oldLook |
			button := GtBlueskyPostStyler
					textLinkButtonPadding: aTBrTextEditorTextualPiece wordPadding
					margin: aTBrTextEditorTextualPiece wordMargin.
			oldLook := button aptitude.
			button
				removeAptitude: oldLook;
				addAptitude: BrGlamorousButtonIconAptitude new;
				addAptitude: (BrGlamorousWithLabelTooltipAptitude new text: self atpTag);
				icon: BrGlamorousVectorIcons link;
				action: [ :aButton | WebBrowser openOn: 'https://bsky.app/hashtag/', self atpTag ].
			button ]
]
