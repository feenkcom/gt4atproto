Class {
	#name : #GtApFeedUserSummaryListContainerElement,
	#superclass : #BrVerticalPane,
	#instVars : [
		'userSummaryElement'
	],
	#category : #'Gt4AtProto-UI'
}

{ #category : #callbacks }
GtApFeedUserSummaryListContainerElement >> actOnElementDetached [
	userSummaryElement actOnElementDetached
]

{ #category : #initialization }
GtApFeedUserSummaryListContainerElement >> initialize [
	super initialize.
	
	self 
		hMatchParent;
		vFitContent;
		alignCenter.
	
	self addChild: (userSummaryElement := GtApFeedUserSummaryElement new).
	self addChild: (BrFrame new 
		hExact: 450;
		vExact: 1;
		background: Color veryLightGray  muchLighter )
]

{ #category : #accessing }
GtApFeedUserSummaryListContainerElement >> user: aUser [
	userSummaryElement user: aUser
]
