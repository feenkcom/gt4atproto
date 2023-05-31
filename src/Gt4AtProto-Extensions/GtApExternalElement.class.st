Class {
	#name : #GtApExternalElement,
	#superclass : #BrVerticalPane,
	#instVars : [
		'titleElement',
		'thumbElement',
		'descriptionElement',
		'urlElement'
	],
	#category : #'Gt4AtProto-Extensions'
}

{ #category : #accessing }
GtApExternalElement >> buildDescriptionElement [
	^ descriptionElement := BrEditor new
			beReadOnlyWithoutSelection;
			aptitude: BrGlamorousRegularEditorAptitude;
			hMatchParent;
			vFitContent;
			margin: (BlInsets
					top: 0
					left: 0
					bottom: 10
					right: 0)
]

{ #category : #accessing }
GtApExternalElement >> buildThumbElement [
	^ thumbElement := BrAsyncFileWidget new
			hMatchParent;
			vExact: 200
]

{ #category : #accessing }
GtApExternalElement >> buildTitleElement [
	^ titleElement := BrLabel new aptitude: BrGlamorousLabelAptitude new bold
]

{ #category : #accessing }
GtApExternalElement >> buildUrlElement [
	^ urlElement := BrLabel new
			aptitude: (BrGlamorousLabelAptitude new foreground: Color lightGray)
]

{ #category : #accessing }
GtApExternalElement >> description: aString [
	descriptionElement text: aString
]

{ #category : #accessing }
GtApExternalElement >> external: anExternalRecord [
	self title: anExternalRecord atpExternal atpTitle.
	self thumb: anExternalRecord atpExternal atpThumb.
	self description: anExternalRecord atpExternal atpDescription.
	self url: anExternalRecord atpExternal atpUri
]

{ #category : #accessing }
GtApExternalElement >> initialize [
	| contentContainer |
	
	super initialize.
	
	self 
		hExact: 300;
		vFitContent;
		padding: (BlInsets all: 10).
	
	contentContainer := BrVerticalPane new
		hMatchParent;
		vFitContent.
	
	contentContainer addChild: self buildTitleElement.
	contentContainer addChild: self buildThumbElement.
	contentContainer addChild: self buildDescriptionElement.
	contentContainer addChild: self buildUrlElement.
	
	self addChild:  contentContainer.
]

{ #category : #accessing }
GtApExternalElement >> model: aModel [
	self title: aModel title.
	self thumb: aModel thumb.
	self description: aModel description.
	self url: aModel url
]

{ #category : #accessing }
GtApExternalElement >> thumb: anObject [
	anObject
		ifNil: [ thumbElement visibility: BlVisibility gone ]
		ifNotNil: [ :aUrl | thumbElement url: aUrl ]
]

{ #category : #accessing }
GtApExternalElement >> title: aString [
	titleElement text: aString
]

{ #category : #accessing }
GtApExternalElement >> updateContent [
	titleElement text: external atpExternal atpTitle.
	external atpExternal atpThumb
		ifNil: [ thumbElement visibility: BlVisibility gone ]
		ifNotNil: [ :aUrl | thumbElement url: aUrl ].
	descriptionElement text: external atpExternal atpDescription.
	urlElement text: external atpExternal atpUri
]

{ #category : #accessing }
GtApExternalElement >> url: aString [
	urlElement text: aString
]
