Class {
	#name : #GtApLexiconDefinitionsGroup,
	#superclass : #GtBasicGroup,
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #accessing }
GtApLexiconDefinitionsGroup >> gtItemsFor: aView [
	<gtView>
	
	^ aView columnedList 
		title: 'Definitions';
		items: [ self ];
		column: 'Id' text: [ :aDefinition | aDefinition id ];
		column: 'Type' text: [ :aDefinition | aDefinition type ] width: 75;
		column: 'Description' text: [ :aDefinition |
			aDefinition description ifNil: [ '' ] ]
]
