Class {
	#name : #GtApLexiconBlob,
	#superclass : #GtApLexiconData,
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #accessing }
GtApLexiconBlob class >> typeName [
	^ #blob
]

{ #category : #visiting }
GtApLexiconBlob >> acceptVisitor: aLexiconVisitor [
	^ aLexiconVisitor visitLexiconBlob: self
]

{ #category : #accessing }
GtApLexiconBlob >> buildFromRequestWithKey: aKey [
	^ 'aRequest at: ''' , aKey , ''' ifAbsent: [ nil ]'
]
