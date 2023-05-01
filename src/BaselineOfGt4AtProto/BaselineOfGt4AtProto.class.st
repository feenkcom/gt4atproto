Class {
	#name : #BaselineOfGt4AtProto,
	#superclass : #BaselineOf,
	#category : #BaselineOfGt4AtProto
}

{ #category : #loading }
BaselineOfGt4AtProto class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'gt4atproto' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfGt4AtProto >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
		
			spec
				baseline: 'JSONSchema'
				with: [ spec repository: 'github://feenkcom/JSONSchema/source' ].
			
			spec package: 'Gt4AtProto'.
			spec 
				package: 'Gt4AtProto-Lexicon'
				with: [
					spec requires: 'JSONSchema' ] 
	]
]
