Class {
	#name : #LeBlueksyAccountSwitcherElement,
	#superclass : #BrVerticalPane,
	#instVars : [
		'client',
		'onSelection'
	],
	#category : #'Gt4Bluesky-Snippet'
}

{ #category : #accessing }
LeBlueksyAccountSwitcherElement >> client [
	^ client
]

{ #category : #accessing }
LeBlueksyAccountSwitcherElement >> currentlySelected: aClient [
	client := aClient.
	self updateView
]

{ #category : #accessing }
LeBlueksyAccountSwitcherElement >> initialize [
	super initialize.
	self fitContent.
	self padding: (BlInsets all: 5).

	self initializeView
]

{ #category : #accessing }
LeBlueksyAccountSwitcherElement >> initializeView [
	self
		addChild: (BrSimpleList new
				itemStencil: [ BrLabel new fitContent
						aptitude: BrGlamorousLabelAptitude
								+ (BrStyleCommonAptitude new
										hovered: [ :aStyle | aStyle background: BrGlamorousColors hoveredListItemColor ]) ];
				itemDataBinder: [ :anItemElement :anItemObject :anItemIndex | 
					anItemElement
						text: anItemObject handle;
						when: BlClickEvent
							do: [ :anEvent | onSelection value: anItemObject createClient ] ];
				fitContent;
				items: GtBlueskyIdentity allInstances).
	self
		addChild: (BrLabel new fitContent
				aptitude: BrGlamorousLabelAptitude
						+ (BrStyleCommonAptitude new
								hovered: [ :aStyle | aStyle background: BrGlamorousColors hoveredListItemColor ]);
				text: 'Log in to new account';
				when: BlClickEvent
					do: [ :anEvent | 
						self removeChildren.
						self
							addChild: (GtBlueskyLoginForm new clientCallback: onSelection) asElement ])
]

{ #category : #accessing }
LeBlueksyAccountSwitcherElement >> onSelection: aBlock [
	onSelection := aBlock.
	self updateView
]

{ #category : #accessing }
LeBlueksyAccountSwitcherElement >> updateView [
	self removeChildren.
	self initializeView
]
