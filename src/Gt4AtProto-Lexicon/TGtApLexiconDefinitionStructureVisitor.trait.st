Trait {
	#name : #TGtApLexiconDefinitionStructureVisitor,
	#category : #'Gt4AtProto-Lexicon-Definitions'
}

{ #category : #visiting }
TGtApLexiconDefinitionStructureVisitor >> visitDefinition: aDefinition [ 
	^ aDefinition acceptVisitor: self
]

{ #category : #visiting }
TGtApLexiconDefinitionStructureVisitor >> visitLexiconArray: aLexiconArray [
	aLexiconArray items isCollection
		ifTrue: [
			aLexiconArray items do: [ :aDefinition |
				self visitDefinition: aDefinition  ] ]
		ifFalse: [
			self visitDefinition: aLexiconArray items ] 
]

{ #category : #visiting }
TGtApLexiconDefinitionStructureVisitor >> visitLexiconAudio: aLexiconAudio [
]

{ #category : #visiting }
TGtApLexiconDefinitionStructureVisitor >> visitLexiconBlob: aLexiconBlob [
]

{ #category : #visiting }
TGtApLexiconDefinitionStructureVisitor >> visitLexiconBoolean: aLexiconBoolean [
]

{ #category : #visiting }
TGtApLexiconDefinitionStructureVisitor >> visitLexiconBytes: aLexiconBytes [
]

{ #category : #visiting }
TGtApLexiconDefinitionStructureVisitor >> visitLexiconCidLink: aLexiconCidLink [
]

{ #category : #visiting }
TGtApLexiconDefinitionStructureVisitor >> visitLexiconDefinitionReference: aLexiconDefinitionReference [
]

{ #category : #visiting }
TGtApLexiconDefinitionStructureVisitor >> visitLexiconImage: aLexiconImage [
]

{ #category : #visiting }
TGtApLexiconDefinitionStructureVisitor >> visitLexiconInteger: aLexiconInteger [
]

{ #category : #visiting }
TGtApLexiconDefinitionStructureVisitor >> visitLexiconNumber: aLexiconNumber [
]

{ #category : #visiting }
TGtApLexiconDefinitionStructureVisitor >> visitLexiconObject: aLexiconObject [
	aLexiconObject properties do: [ :aPropertyDefinition |
		self visitPropertyDefinition: aPropertyDefinition ]
]

{ #category : #visiting }
TGtApLexiconDefinitionStructureVisitor >> visitLexiconParameters: aLexiconParameters [
	aLexiconParameters properties do: [ :aPropertyDefinition |
		self visitPropertyDefinition: aPropertyDefinition ]
]

{ #category : #visiting }
TGtApLexiconDefinitionStructureVisitor >> visitLexiconRecord: aLexiconRecord [
	self visitDefinition: aLexiconRecord record
]

{ #category : #visiting }
TGtApLexiconDefinitionStructureVisitor >> visitLexiconString: aLexiconString [
]

{ #category : #visiting }
TGtApLexiconDefinitionStructureVisitor >> visitLexiconSubscription: aLexiconSubscription [
]

{ #category : #visiting }
TGtApLexiconDefinitionStructureVisitor >> visitLexiconToken: aLexiconToken [
]

{ #category : #visiting }
TGtApLexiconDefinitionStructureVisitor >> visitLexiconUnion: aLexiconUnion [
]

{ #category : #visiting }
TGtApLexiconDefinitionStructureVisitor >> visitLexiconUnknownDefinition: aLexiconUnknownDefinition [
]

{ #category : #visiting }
TGtApLexiconDefinitionStructureVisitor >> visitLexiconVideo: aLexiconVideo [
]

{ #category : #visiting }
TGtApLexiconDefinitionStructureVisitor >> visitLexiconXrpcProcedure: aLexiconXrpcProcedure [
]

{ #category : #visiting }
TGtApLexiconDefinitionStructureVisitor >> visitLexiconXrpcQuery: aLexiconXrpcQuery [
]

{ #category : #visiting }
TGtApLexiconDefinitionStructureVisitor >> visitPropertyDefinition: aPropertyDefinition [ 
	self visitDefinition: aPropertyDefinition
]
