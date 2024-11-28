Class {
	#name : #GtBlueskyLinkStyler,
	#superclass : #BlTextStyler,
	#traits : 'TLeAnnotationParseNodeVisitor + (TLeContentNodeVisitor - {#visitAnnotation:})',
	#classTraits : 'TLeAnnotationParseNodeVisitor classTrait + TLeContentNodeVisitor classTrait',
	#instVars : [
		'blueskyPost',
		'lastId',
		'expanded',
		'elements'
	],
	#category : #'Gt4Bluesky-Stylers'
}

{ #category : #generated }
GtBlueskyLinkStyler class >> textLinkButtonPadding: additionalPadding margin: additionalMargin [
	"Answer a button used for in-text links in Lepiter.
	This sets a common font, size, color and style for the button"

	^ self textLinkButtonPadding: additionalPadding margin: additionalMargin valid: true
]

{ #category : #generated }
GtBlueskyLinkStyler class >> textLinkButtonPadding: additionalPadding margin: additionalMargin valid: isValid [
	"Answer a button used for in-text links in Lepiter.
	This sets a common font, size, color and style for the button"
	| color button |

	button := BrButton new.
	button connector beVisualSource.

	color := isValid 
		ifTrue: [ BrGlamorousColors linkColor ]
		ifFalse: [ BrGlamorousColors linkWithErrorColor ].

	button 
		addAptitude: (BrGlamorousButtonLabelAptitude new 
			defaultColor: color;
			hoveredColor: color muchDarker);
		placeholderAlignment: #alignBottom;
		padding: (BlInsets top: 0 left: 0 bottom: -1 right: 0) + additionalPadding;
		margin: (BlInsets top: 0 left: 0 bottom: 0 right: 0) + additionalMargin;
		icon: BrGlamorousVectorIcons inspect;
		beNoneSize;
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent. ].
	^ button
]

{ #category : #accessing }
GtBlueskyLinkStyler >> blueskyPost [
	^ blueskyPost
]

{ #category : #accessing }
GtBlueskyLinkStyler >> blueskyPost: anObject [
	blueskyPost := anObject
]

{ #category : #accessing }
GtBlueskyLinkStyler >> elements [
	^ elements
]

{ #category : #accessing }
GtBlueskyLinkStyler >> expanded [
	^ expanded
]

{ #category : #generated }
GtBlueskyLinkStyler >> fontSizeForHeadingLevel: aHeadingLevel [
	"Compute the relative (em) font size for a text with a given heading level (1-6)"
	<return: #BlFontSize>
	"
	# Heading 1 => font size * 1.5
	# Heading 2 => font size * 1.4
	# Heading 3 => font size * 1.3
	# Heading 4 => font size * 1.2
	# Heading 5 => font size * 1.1
	# Heading 6 => font size * 1.0
	"
	| aFontSizeIncrement aMaxAmountOfHeadingLevels anExtraFontSize |
	
	aFontSizeIncrement := 0.1.
	aMaxAmountOfHeadingLevels := 6.

	anExtraFontSize := (aMaxAmountOfHeadingLevels - aHeadingLevel max: 0) * aFontSizeIncrement.

	^ (1.0 + anExtraFontSize) fontEm
]

{ #category : #accessing }
GtBlueskyLinkStyler >> initialize [
	super initialize.
	
	lastId := 0.
	elements := Dictionary new.
	expanded := Dictionary new
]

{ #category : #generated }
GtBlueskyLinkStyler >> isCursorInside: nodeInterval [ 
]

{ #category : #generated }
GtBlueskyLinkStyler >> isValidLink: urlString [
	"Answer a boolean indicating whether the supplied string is valid.
	There's no restriction on what schemes are supported as we don't know what schemes the OS supports, so any scheme other than file:// will answer true.
	If the scheme is file:// or no scheme is provided, answer a boolean based on the files existence."
	<return: #Boolean>

	^ (self resolveUrl: urlString) isValid
]

{ #category : #accessing }
GtBlueskyLinkStyler >> nextUniqueId [
	lastId := lastId + 1.
	^ lastId
]

{ #category : #accessing }
GtBlueskyLinkStyler >> privateStyle: aText [ 
	<return: #BlText>
	| ast |
	text := aText.
	ast := LeParser parse: aText asString.
	self accept: ast.
	
	self styleFacets: aText.
	
	^ aText
]

{ #category : #generated }
GtBlueskyLinkStyler >> resolveUrl: aUrlString [
	"For file urls, resolve against the database directory or root directory, and allow file urls of the form 'file://path/to/image.png' (the host is missing), with the same resolution"
	<return: #GtUrlStringUtility>
	| rootDir |
	
	rootDir :=  FileLocator workingDirectory resolve.
	^ GtUrlStringUtility new
		rootDirectory: rootDir;
		urlString: aUrlString.
]

{ #category : #generated }
GtBlueskyLinkStyler >> styleAutoHiding: leftRange and: rightRange whenOutside: nodeInterval [
	| anAttribute marker1 marker2 cursorAttribute |
	marker1 := BrTextInvisibleMarkerAttribute new.
	marker2 := BrTextInvisibleMarkerAttribute new.
	self text
		attribute: marker1
		from: leftRange first
		to: leftRange last.
	self text
		attribute: marker2
		from: rightRange first
		to: rightRange last.
	anAttribute := BrTextAdornmentDynamicAttribute new
			beReplace;
			stencil: [ :aTBrTextEditorTextualPiece :anEditorElement | #() ].
	cursorAttribute := BrTextCursorAttribute new
			enterAction: [ :aTextEditor | 
				| left right |
				aTextEditor text
					findAttribute: marker1
					indicesDo: [ :start :end | left := start ].
				aTextEditor text
					findAttribute: marker2
					indicesDo: [ :start :end | right := end ].
				(left notNil and: [ right notNil ])
					ifTrue: [ | cursorIndex |
						cursorIndex := aTextEditor cursors first position.
						(cursorIndex between: left - 2 and: right)
							ifTrue: [ aTextEditor text
									clearAttributes: left
									to: right
									if: [ :eachAttribute | eachAttribute == anAttribute ] ] ] ];
			leaveAction: [ :aTextEditor | 
				| left right |
				aTextEditor text
					findAttribute: marker1
					indicesDo: [ :start :end | left := start to: end ].
				aTextEditor text
					findAttribute: marker2
					indicesDo: [ :start :end | right := start to: end ].
				(left notNil and: [ right notNil ])
					ifTrue: [ aTextEditor text
							attributes: {anAttribute}
							from: left first
							to: left last.
						aTextEditor text
							attributes: {anAttribute}
							from: right first
							to: right last ] ].
	self text
		attribute: cursorAttribute
		from: nodeInterval first - 1
		to: nodeInterval last
]

{ #category : #generated }
GtBlueskyLinkStyler >> styleAutoHiding: anInterval text: aSubText [
	| anAttribute aMarkerAttribute cursorAttribute |
	
	aMarkerAttribute := BrTextInvisibleMarkerAttribute new.

	"so that we will be able to find where to add adornment attribute dynamically"
	aSubText attribute: aMarkerAttribute.

	anAttribute := BrTextAdornmentDynamicAttribute new
		beReplace;
		stencil: [ :aTBrTextEditorTextualPiece :anEditorElement | #() ].

	aSubText attribute: anAttribute.

	cursorAttribute := BrTextCursorAttribute new
			enterAction: [ :aTextEditor | 
			"we have a reference to the attribute instance. find its interval dynamically"
			aTextEditor text
				findAttribute: aMarkerAttribute
				indicesDo: [ :aStart :anEnd | | cursorIndex |
					cursorIndex := aTextEditor cursors first position.
					"and now that we know valid attribute indices we can work with them"
					(cursorIndex between: aStart-2 and: anEnd) ifTrue:
						[ aTextEditor text
							clearAttributes: aStart
							to: anEnd 
							if: [ :eachAttribute | eachAttribute == anAttribute ] ] ] ];

		leaveAction: [ :aTextEditor |
			aTextEditor text
				findAttribute: aMarkerAttribute
				indicesDo: [ :aStart :anEnd |
					aTextEditor text
						attribute: anAttribute  
						from: aStart
						to: anEnd ] ].
	self text
		attribute: cursorAttribute
		from: anInterval first - 1
		to: anInterval last
]

{ #category : #generated }
GtBlueskyLinkStyler >> styleAutoHidingAnnotation: anAnnotation [
	| anAttribute aMarkerAttribute aStartPositionToHide aStopPositionToHide anAnnotationTextToHide aSurroundingTextToRespondToCursor aStartPositionToReactToCursor aStopPositionToReactToCursor |
	anAnnotation isDefined ifFalse: [ ^ self ].

	aStartPositionToHide := anAnnotation parent startPosition max: 1.
	aStopPositionToHide := anAnnotation parent stopPosition min: self text size.
	aStartPositionToReactToCursor := aStartPositionToHide - 2 max: 1.
	aStopPositionToReactToCursor := aStopPositionToHide + 1 min: self text size.

	anAnnotationTextToHide := self text
			from: aStartPositionToHide
			to: aStopPositionToHide.
	aSurroundingTextToRespondToCursor := self text
			from: aStartPositionToReactToCursor
			to: aStopPositionToReactToCursor.

	aMarkerAttribute := BrTextInvisibleMarkerAttribute new.	"so that we will be able to find where to add adornment attribute dynamically"
	anAnnotationTextToHide attribute: aMarkerAttribute.

	anAttribute := BrTextHideAttribute new.

	anAnnotationTextToHide attribute: anAttribute.

	aSurroundingTextToRespondToCursor
		onCursorEnter: [  "we have a reference to the attribute instance. find its interval dynamically":aTextEditor | 
			aTextEditor text
				findAttribute: aMarkerAttribute
				indicesDo: [ :aStart :anEnd | 
					aTextEditor text
						clearAttributes: aStart
						to: anEnd
						if: [ :eachAttribute | eachAttribute == anAttribute ] ] ]
		leave: [ :aTextEditor | 
			aTextEditor text
				findAttribute: aMarkerAttribute
				indicesDo: [ :aStart :anEnd | 
					aTextEditor text
						attribute: anAttribute
						from: aStart
						to: anEnd ] ]
]

{ #category : #accessing }
GtBlueskyLinkStyler >> styleBold: aBoldNode [
	(self text from: aBoldNode startPosition to: aBoldNode stopPosition)
		attributes: {BlFontWeightAttribute bold}.
	self
		styleAutoHiding:
			(aBoldNode leftStars first startPosition to: aBoldNode leftStars last stopPosition)
		and:
			(aBoldNode rightStars first startPosition to: aBoldNode rightStars last stopPosition)
		whenOutside: aBoldNode sourceInterval
]

{ #category : #generated }
GtBlueskyLinkStyler >> styleExternalLink: anExternalLink [
	| linkText |

	linkText := self text
		from: anExternalLink startPosition
		to: anExternalLink stopPosition.
	self styleLinkText: linkText valid: (self isValidLink: anExternalLink url).
	self styleAutoHiding: anExternalLink sourceInterval text: linkText.
	self styleExternalLinkButton: anExternalLink text: linkText.
]

{ #category : #generated }
GtBlueskyLinkStyler >> styleExternalLinkButton: aLink text: aSubText [
	"Append a button to the supplied link text.
	If the link is defined (not empty), the button opens the link.
	If the link is empty, open a dialog allowing the user to select a file"

	aLink url
		ifEmpty: [ self styleFileSelection: aLink text: aSubText ]
		ifNotEmpty: [ self styleOpenExternalLinkButton: aLink text: aSubText ]
]

{ #category : #accessing }
GtBlueskyLinkStyler >> styleFacets: aText [
	blueskyPost ifNil: [ ^ self ].

	blueskyPost atpPost atpRecord atpFacets
		do: [ :aFacet | 
			| textBlock |
			textBlock := aText
					from: (aText asString gtCharIndexAtByteOffset: aFacet atpIndex atpByteStart)
					to: (aText asString gtCharIndexAtByteOffset: aFacet atpIndex atpByteEnd).

			textBlock foreground: BrGlamorousColors linkColor.

			aFacet atpFeatures
				do: [ :aFeature | aFeature adorn: textBlock usingPost: blueskyPost ] ]
]

{ #category : #generated }
GtBlueskyLinkStyler >> styleFileSelection: aLink text: aSubText [
	"Append a button to the supplied link text that opens the link"

	aSubText appendingAdornment: [ :aTBrTextEditorTextualPiece :anEditorElement | 
		| selectStencil selectDropdown |

		selectStencil := LeFileSelectStencil new 
			label: aLink label;
			tooltip: 'Import file from disk';
			extent: 600@400;
			textEditorPiece: aTBrTextEditorTextualPiece;
			visitor: self;
			subText: aSubText.
		selectDropdown := selectStencil asElement.
		selectDropdown aptitude - BrGlamorousButtonExteriorAptitude.
		selectDropdown ]
]

{ #category : #generated }
GtBlueskyLinkStyler >> styleHeader: aHeaderNode [
	aHeaderNode parts isEmpty ifTrue: [ ^ self ].

	(self text from: aHeaderNode startPosition to: aHeaderNode stopPosition)
		bold;
		fontSize: (self fontSizeForHeadingLevel: aHeaderNode headerLevel).
	self
		styleAutoHiding: (aHeaderNode startPosition
				to: (aHeaderNode numberSigns last stopPosition min: aHeaderNode stopPosition))
		text: (self text
				from: aHeaderNode startPosition
				to: (aHeaderNode numberSigns last stopPosition min: aHeaderNode stopPosition)).
	aHeaderNode startPosition > 1
		ifTrue: [ (self text from: aHeaderNode startPosition to: aHeaderNode stopPosition)
				paragraphMargin: (BlInsets
						top: (5 - aHeaderNode numberSigns size max: 1) * 10
						left: 0
						bottom: 5
						right: 0) ]
]

{ #category : #accessing }
GtBlueskyLinkStyler >> styleItalic: anItalicNode [
	(self text
		from: anItalicNode startPosition
		to: anItalicNode stopPosition)
			italic.

	self
		styleAutoHiding: anItalicNode leftStar sourceInterval
		and: anItalicNode rightStar sourceInterval
		whenOutside: anItalicNode sourceInterval
]

{ #category : #generated }
GtBlueskyLinkStyler >> styleLinkText: aSubText valid: hasValidTarget [
	"Set the colour of the source markup text"
	| aColor |
	aColor := hasValidTarget
		ifTrue: [ BrGlamorousColors textMarkupColor ]
		ifFalse: [ BrGlamorousColors linkWithErrorColor ].
	
	aSubText foreground: aColor.
]

{ #category : #generated }
GtBlueskyLinkStyler >> styleOpenExternalImage: aLink text: aSubText [
	| anImageURL attribute pictureContainer widget |
	anImageURL := (self resolveUrl: aLink url) url asString.

	attribute := BrTextAdornmentDynamicAttribute new
			beAppend;
			withCache: self elements key: anImageURL;
			stencil: [ pictureContainer := BlElement new
						constraintsDo: [ :c | 
							c horizontal matchParent.
							c vertical fitContent ];
						layout: BlLinearLayout vertical;
						padding: (BlInsets
								top: 5
								left: 7
								bottom: 5
								right: 5);
						yourself.

				widget := (BrAsyncFileWidget new url: anImageURL)
						constraintsDo: [ :c | 
							c horizontal matchParent.
							c vertical exact: 300 ].
				pictureContainer addChild: widget as: #imageElement.
				pictureContainer
					addAptitude: (BrGlamorousWithVerticalResizerAptitude new beBottom
							resizerDo: [ :theResizer | 
								theResizer
									when: BlResizerResizedEvent
									do: [ :anEvent | 
										pictureContainer
											childWithId: #imageElement
											ifFound: [ :anImageElement | (BrResizerElementLength exact: anEvent extent y) adjustHeightFor: anImageElement ]
											ifNone: [  ] ] ]) ].

	aSubText attribute: attribute
]

{ #category : #generated }
GtBlueskyLinkStyler >> styleOpenExternalLinkButton: aLink text: aSubText [
	"Append a button to the supplied link text that opens the link"

	aSubText
		appendingAdornment: [ :aTBrTextEditorTextualPiece :anEditorElement | 
			| button oldLook |
			button := self class textLinkButtonPadding: aTBrTextEditorTextualPiece wordPadding 
										margin: aTBrTextEditorTextualPiece wordMargin.
			oldLook := button aptitude.
			button
				removeAptitude: oldLook;
				addAptitude: (BrGlamorousButtonLabelAndIconAptitude new
							defaultColor: oldLook defaultColor);
				addAptitude: (BrGlamorousWithLabelTooltipAptitude new
							text: aLink url asString asRopedText);
				icon: BrGlamorousVectorIcons link;
				label: aLink displayLabel;
				action: [ :aButton | | urlUtility |
					urlUtility := self resolveUrl: aLink url.
					urlUtility isFile
						ifTrue: [ aButton phlow spawnObject: urlUtility asFileReference ]
						ifFalse: [ WebBrowser openOn: urlUtility asString ] ].
			button ]
]

{ #category : #generated }
GtBlueskyLinkStyler >> text [
	^ text
]

{ #category : #generated }
GtBlueskyLinkStyler >> visitAnnotation: anAnnotation [
	self styleAutoHidingAnnotation: anAnnotation.
	^ self visitAnnotationParse: anAnnotation
]

{ #category : #accessing }
GtBlueskyLinkStyler >> visitBold: aBoldNode [
	self styleBold: aBoldNode.
	^ self visitContent: aBoldNode
]

{ #category : #generated }
GtBlueskyLinkStyler >> visitExternalImageLink: anExternalLink [ 
	| linkText url validLink |

	linkText := self text
		from: anExternalLink startPosition
		to: anExternalLink stopPosition.
	url := anExternalLink url.
	validLink := self isValidLink: url.
	self styleLinkText: linkText valid: validLink.
	self visitExternalLink: anExternalLink.
	self styleAutoHiding: anExternalLink sourceInterval text: linkText.
	anExternalLink url
		ifEmpty: [ self styleFileSelection: anExternalLink text: linkText ]
		ifNotEmpty: [ self styleOpenExternalImage: anExternalLink text: linkText ].

]

{ #category : #generated }
GtBlueskyLinkStyler >> visitExternalLabelUrlLink: anExternalLabelUrlLink [
	self visitExternalLink: anExternalLabelUrlLink.
	self styleExternalLink: anExternalLabelUrlLink
]

{ #category : #generated }
GtBlueskyLinkStyler >> visitExternalUrlLink: anExternalUrlLink [
	self visitExternalLink: anExternalUrlLink.
	self styleExternalLink: anExternalUrlLink
]

{ #category : #generated }
GtBlueskyLinkStyler >> visitHeader: aHeader [
	self styleHeader: aHeader.
	^ self visitContent: aHeader
]

{ #category : #generated }
GtBlueskyLinkStyler >> visitInlineCode: aCodeNode [
	| size |
	size := (aCodeNode code source at: 2) = $` ifTrue: [ 2 ] ifFalse: [ 1 ].
	(self text from: aCodeNode startPosition to: aCodeNode stopPosition)
		glamorousCodeFont.
	self
		styleAutoHiding: (aCodeNode startPosition
				to: aCodeNode startPosition + size - 1)
		and: (aCodeNode stopPosition - size + 1 to: aCodeNode stopPosition)
		whenOutside: aCodeNode sourceInterval.
	^ self visitContent: aCodeNode
]

{ #category : #accessing }
GtBlueskyLinkStyler >> visitItalic: anItalicNode [
	self styleItalic: anItalicNode.
	^ self visitContent: anItalicNode
]
