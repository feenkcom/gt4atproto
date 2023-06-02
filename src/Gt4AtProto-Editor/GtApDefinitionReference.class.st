Class {
	#name : #GtApDefinitionReference,
	#superclass : #GtApLexiconModel,
	#instVars : [
		'lexiconFile',
		'node',
		'lexiconDefinition'
	],
	#category : #'Gt4AtProto-Editor-Model'
}

{ #category : #accessing }
GtApDefinitionReference >> editor [
	| editor |
	editor := lexiconFile editor.
	editor
		enqueueTask: [ editor editor
				moveCursorTo: self node value startPosition - 1;
				select: self node value startPosition - 1 to: self node value stopPosition.
			self node gtScrollToPosition: self node value startPosition inEditor: editor ]
				asBlTask.
	^ editor
]

{ #category : #accessing }
GtApDefinitionReference >> gtCoderView: aView [
	<gtView>
	^ aView explicit
		title: 'Reference';
		stencil: [ GtApLexiconCoder new object: self ]
]

{ #category : #accessing }
GtApDefinitionReference >> gtDefaultInspectorTool [
	^ GtPhlowValuableTool new
		name: self gtDisplayString;
		valuable: [ GtApLexiconCoder new object: self ]
]

{ #category : #accessing }
GtApDefinitionReference >> lexiconDefinition [
	^ lexiconDefinition
]

{ #category : #accessing }
GtApDefinitionReference >> lexiconDefinition: anObject [
	lexiconDefinition := anObject
]

{ #category : #accessing }
GtApDefinitionReference >> lexiconDirectory [
	^ self lexiconFile lexiconDirectory
]

{ #category : #accessing }
GtApDefinitionReference >> lexiconFile [
	^ lexiconFile
]

{ #category : #accessing }
GtApDefinitionReference >> lexiconFile: anObject [
	lexiconFile := anObject
]

{ #category : #accessing }
GtApDefinitionReference >> lineSource [
	| source |
	source := node completeSource asString.
	^ ((source
		lineNumber: (source lineNumberCorrespondingToIndex: node startPosition))
		ifNil: [ '' ]) trim
]

{ #category : #accessing }
GtApDefinitionReference >> node [
	^ node
]

{ #category : #accessing }
GtApDefinitionReference >> node: anObject [
	node := anObject
]

{ #category : #accessing }
GtApDefinitionReference >> printOn: stream [
	stream << self lexiconFile filename basename << ': ' << self lineSource
]
