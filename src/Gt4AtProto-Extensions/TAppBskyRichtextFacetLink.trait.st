Trait {
	#name : #TAppBskyRichtextFacetLink,
	#category : #'Gt4AtProto-Extensions-Traits'
}

{ #category : #'as yet unclassified' }
TAppBskyRichtextFacetLink >> adorn: aText usingPost: aPost [
	aText
		appendingAdornment: [ :aTBrTextEditorTextualPiece :anEditorElement | 
			| button oldLook |
			button := GtBlueskyLinkStyler
					textLinkButtonPadding: aTBrTextEditorTextualPiece wordPadding
					margin: aTBrTextEditorTextualPiece wordMargin.
			oldLook := button aptitude.
			button
				removeAptitude: oldLook;
				addAptitude: BrGlamorousButtonIconAptitude new;
				addAptitude: (BrGlamorousWithLabelTooltipAptitude new text: self atpUri);
				icon: BrGlamorousVectorIcons link;
				action: [ :aButton | WebBrowser openOn: self atpUri ].
			button ]
]
