Class {
	#name : #GtApUserSummaryListContainerElement,
	#superclass : #BrVerticalPane,
	#instVars : [
		'userSummaryElement'
	],
	#category : #'Gt4AtProto-UI'
}

{ #category : #callbacks }
GtApUserSummaryListContainerElement >> actOnElementDetached [
	userSummaryElement actOnElementDetached
]

{ #category : #initialization }
GtApUserSummaryListContainerElement >> initialize [
	super initialize.
	
	self 
		hMatchParent;
		vFitContent;
		alignCenter.
	
	self addChild: (userSummaryElement := GtApUserSummaryElement new).
	self addChild: (BrFrame new 
		hExact: 450;
		vExact: 1;
		background: Color veryLightGray  muchLighter )
]

{ #category : #accessing }
GtApUserSummaryListContainerElement >> user: aUser [
	userSummaryElement user: aUser
]
