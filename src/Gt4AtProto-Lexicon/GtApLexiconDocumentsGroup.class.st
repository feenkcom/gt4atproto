Class {
	#name : #GtApLexiconDocumentsGroup,
	#superclass : #GtBasicGroup,
	#category : #'Gt4AtProto-Lexicon-Documents'
}

{ #category : #accessing }
GtApLexiconDocumentsGroup >> copyWithoutAll: aCollection [
	^ self species 
		withAll: (self items copyWithoutAll: aCollection)
]

{ #category : #accessing }
GtApLexiconDocumentsGroup >> gtItemsFor: aView [
	<gtView>
	
	^ aView columnedList 
		title: 'Documents';
		priority: 10;
		items: [ self ];
		column: 'Id' text: #id;
		column: 'Main Type' text: #mainType width: 100;
		column: 'Definitions' 
			text: [ :aLexiconDocument |
				aLexiconDocument definitions size asString
					, ' '
					, ('definition' 
						asPluralBasedOn: aLexiconDocument definitions size) ]
			width: 120;
		column: 'Description' text: [ :aLexiconDocument |
			aLexiconDocument description ifNil: [''] ]
]

{ #category : #accessing }
GtApLexiconDocumentsGroup >> includes: anObject [
	^ self items includes: anObject
]
