Class {
	#name : #GtApGeneratedCodeExamples,
	#superclass : #Object,
	#category : #'Gt4AtProto-Extensions'
}

{ #category : #accessing }
GtApGeneratedCodeExamples >> appBskyActorDefsProfileViewDetailed [
	<gtExample>
	| generatedClass |
	generatedClass := AppBskyActorDefsProfileViewDetailed.
	self assert: (generatedClass class includesSelector: #atpSchema).
	self assert: (generatedClass class includesSelector: #atpFile).
	self assert: (generatedClass class includesSelector: #atpRecordName).
	self assert: (generatedClass class includesSelector: #atpDescription).
	^ generatedClass
]

{ #category : #accessing }
GtApGeneratedCodeExamples >> generatedCodePackage [
	<gtExample>
	<noTest>
	^ RPackageOrganizer default packageNamed: #Gt4AtProtoGeneratedCode
]
