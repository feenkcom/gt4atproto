Trait {
	#name : #TAppBskyRichtextFacetMention,
	#category : #'Gt4AtProto-Extensions-Traits'
}

{ #category : #'as yet unclassified' }
TAppBskyRichtextFacetMention >> adorn: aText usingPost: aPost [
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
				addAptitude: (BrGlamorousWithLabelTooltipAptitude new text: aText);
				icon: BrGlamorousVectorIcons link;
				action: [ :aButton | 
					aButton phlow
						spawnObject: ((aPost client appBskyActorGetProfileActor: self atpDid) client: aPost client) ].
			button ]
]
