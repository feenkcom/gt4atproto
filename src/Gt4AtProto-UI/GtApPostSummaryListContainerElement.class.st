Class {
	#name : #GtApPostSummaryListContainerElement,
	#superclass : #BrVerticalPane,
	#instVars : [
		'postSummaryElement'
	],
	#category : #'Gt4AtProto-UI'
}

{ #category : #initialization }
GtApPostSummaryListContainerElement >> initialize [
	super initialize.

	self
		hMatchParent;
		vFitContent;
		alignCenter.

	self
		addChild: (postSummaryElement := GtApPostSummaryElement new
					addAptitude: BrShadowAptitude;
					background: Color white;
					margin: (BlInsets all: 10))
]

{ #category : #accessing }
GtApPostSummaryListContainerElement >> post [
	^ postSummaryElement post
]

{ #category : #accessing }
GtApPostSummaryListContainerElement >> post: aPost [
	postSummaryElement post: aPost
]
