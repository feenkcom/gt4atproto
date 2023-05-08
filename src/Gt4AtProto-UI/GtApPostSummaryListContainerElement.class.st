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
	
	self addChild: (postSummaryElement := GtApPostSummaryElement new).
	self addChild: (BrFrame new 
		hExact: 450;
		vExact: 1;
		background: Color veryLightGray  muchLighter )
]

{ #category : #accessing }
GtApPostSummaryListContainerElement >> post: aPost [
	postSummaryElement post: aPost
]
