Class {
	#name : #GtApDefinition,
	#superclass : #Object,
	#instVars : [
		'lexiconFile',
		'node'
	],
	#category : #'Gt4AtProto-Editor-Model'
}

{ #category : #accessing }
GtApDefinition >> gtDisplayOn: stream [
	^ self id
		ifNil: [ super gtDisplayOn: stream ]
		ifNotNil: [ :id | stream nextPutAll: id ]
]

{ #category : #accessing }
GtApDefinition >> gtSourceFor: aView [
	<gtView>
	| editor |
	^ aView explicit
		title: 'Source';
		stencil: [ editor := lexiconFile editor.
			editor
				enqueueTask: [ editor editor
						moveCursorTo: node value startPosition - 1;
						select: node value startPosition - 1 to: node value stopPosition.
					node gtScrollToPosition: node value stopPosition inEditor: editor ]
						asBlTask.
			editor ];
		actionButtonIcon: BrGlamorousVectorIcons accept
			tooltip: 'Save'
			action: [ lexiconFile
					source: editor editor text asString;
					saveFile ]
]

{ #category : #accessing }
GtApDefinition >> id [
	^ lexiconFile id
		ifNotNil: [ :id | id , '#' , node name source allButFirst allButLast ]
]

{ #category : #accessing }
GtApDefinition >> lexiconFile [
	^ lexiconFile
]

{ #category : #accessing }
GtApDefinition >> lexiconFile: aGtApLexiconFile [
	lexiconFile := aGtApLexiconFile
]

{ #category : #accessing }
GtApDefinition >> node [
	^ node
]

{ #category : #accessing }
GtApDefinition >> node: aJSONMemberNode [
	node := aJSONMemberNode
]
