Class {
	#name : #GtApHomeSection,
	#superclass : #GtHomeSection,
	#category : #'Gt4AtProto-Lepiter'
}

{ #category : #accessing }
GtApHomeSection >> create [
	| sectionContainer cardsContainer |
	sectionContainer := self newSectionContainer.
	sectionContainer addChild: (self newSectionTitle: 'AT Protocol').
	cardsContainer := self newCardsContainer.
	cardsContainer
		addChild: (self
				newLepiterPageCardForPageNamed: 'About Glamorous Toolkit for AT Protocol'
				inDatabaseNamed: 'gt4atproto-lepiter'
				withTitle: 'AT Protocol knowledge base'
				andDescription: 'Read the knowledge base related to the environment for AT Protocol').

	sectionContainer addChild: cardsContainer.
	^ sectionContainer
]
