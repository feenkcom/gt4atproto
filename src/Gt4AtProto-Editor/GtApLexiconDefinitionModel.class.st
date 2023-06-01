Class {
	#name : #GtApLexiconDefinitionModel,
	#superclass : #GtApLexiconModel,
	#instVars : [
		'lexiconFile',
		'name'
	],
	#category : #'Gt4AtProto-Editor-Model'
}

{ #category : #comparing }
GtApLexiconDefinitionModel >> = anObject [
	^ self == anObject
		or: [ self class = anObject class
				and: [ self id = anObject id and: [ self lexiconFile = anObject lexiconFile ] ] ]
]

{ #category : #accessing }
GtApLexiconDefinitionModel >> editor [
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
GtApLexiconDefinitionModel >> gtDisplayOn: stream [
	^ self id
		ifNil: [ super gtDisplayOn: stream ]
		ifNotNil: [ :id | stream nextPutAll: id ]
]

{ #category : #accessing }
GtApLexiconDefinitionModel >> gtSourceFor: aView [
	<gtView>
	| editor |
	^ aView explicit
		title: 'Source';
		stencil: [ editor := self editor ];
		actionButtonIcon: BrGlamorousVectorIcons accept
			tooltip: 'Save'
			action: [ lexiconFile
					source: editor editor text asString;
					saveFile ]
]

{ #category : #comparing }
GtApLexiconDefinitionModel >> hash [
	^ (self class hash bitXor: self id) bitXor: self lexiconFile hash
]

{ #category : #accessing }
GtApLexiconDefinitionModel >> id [
	^ lexiconFile id ifNotNil: [ :id | id , '#' , name ]
]

{ #category : #testing }
GtApLexiconDefinitionModel >> isLexiconDefinition [
	^ true
]

{ #category : #accessing }
GtApLexiconDefinitionModel >> lexiconDirectory [
	^ self lexiconFile lexiconDirectory
]

{ #category : #accessing }
GtApLexiconDefinitionModel >> lexiconFile [
	^ lexiconFile
]

{ #category : #accessing }
GtApLexiconDefinitionModel >> lexiconFile: aGtApLexiconFile [
	lexiconFile := aGtApLexiconFile
]

{ #category : #accessing }
GtApLexiconDefinitionModel >> name [
	^ name
]

{ #category : #accessing }
GtApLexiconDefinitionModel >> name: aString [
	name := aString
]

{ #category : #accessing }
GtApLexiconDefinitionModel >> node [
	^ lexiconFile findDefinitionNode: name
]

{ #category : #accessing }
GtApLexiconDefinitionModel >> references [
	| isMain id |
	isMain := self name = 'main'.
	id := self id.
	^ GtApDefinitionReferenceList new
		stream: (self lexiconDirectory files asAsyncStream
				collect: [ :each | 
					(each ast asyncWithAllNodesStream
						select: [ :node | 
							(each isReference: node)
								and: [ | source |
									source := node value source copyFrom: 2 to: node value source size - 1.
									(each = self lexiconFile and: [ source = ('#' , self name) ])
										or: [ source = id or: [ isMain and: [ source = lexiconFile id ] ] ] ] ])
						collect: [ :node | 
							GtApDefinitionReference new
								lexiconDefinition: self;
								lexiconFile: each;
								node: node;
								yourself ] ]) flatten
]
