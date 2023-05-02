Class {
	#name : #GtApLexiconNeoJsonObject,
	#superclass : #NeoJSONObject,
	#category : #'Gt4AtProto-Lexicon'
}

{ #category : #accessing }
GtApLexiconNeoJsonObject class >> fromStream: aStream [
	"Parse string as JSON, so that maps become instances of me"

	^ (NeoJSONReader on: aStream)
			mapClass: self;
			propertyNamesAsSymbols: true;
			next
]
