Class {
	#name : #GtApLexiconDirectoryModel,
	#superclass : #GtApLexiconModel,
	#instVars : [
		'directory',
		'lexicons',
		'files',
		'fileWatcher'
	],
	#category : #'Gt4AtProto-Editor-Model'
}

{ #category : #accessing }
GtApLexiconDirectoryModel >> directory [
	^ directory
]

{ #category : #accessing }
GtApLexiconDirectoryModel >> directory: aFileReference [
	self stopFileWatcher.
	directory := aFileReference asFileReference.
	self startFileWatcher.
	lexicons := nil.
	files := nil
]

{ #category : #private }
GtApLexiconDirectoryModel >> fileDeleted: aFileReference [
	lexicons ifNotNil: [ lexicons removeLexiconDocumentForFile: aFileReference ].
	files
		ifNotNil: [ files
				detect: [ :each | each filename = aFileReference ]
				ifFound: [ :file | 
					files remove: file.
					^ self announce: (GtApLexiconFileDeleted new lexiconFile: file) ] ]
]

{ #category : #accessing }
GtApLexiconDirectoryModel >> fileFor: aFileReference [
	^ files detect: [ :each | each filename = aFileReference ] ifNone: [  ]
]

{ #category : #private }
GtApLexiconDirectoryModel >> fileUpdated: aFileReference [
	lexicons
		ifNotNil: [ lexicons removeLexiconDocumentForFile: aFileReference.
			[ lexicons
				addLexiconDocument: (aFileReference
						readStreamDo: [ :stream | GtApLexiconImporter new importLexiconDocumentFromStream: stream ]) ]
				on: Error
				do: [ :ex | ex return ] ].
	files
		ifNotNil: [ files
				detect: [ :each | each filename = aFileReference ]
				ifFound: [ :file | file fileUpdated ]
				ifNone: [ | file |
					files
						add: (file := GtApLexiconFileModel new
									lexiconDirectory: self;
									filename: aFileReference;
									yourself).
					self announce: (GtApLexiconFileAdded new lexiconFile: file) ] ]
]

{ #category : #accessing }
GtApLexiconDirectoryModel >> files [
	^ files
		ifNil: [ directory
				ifNotNil: [ files := (directory allChildrenMatching: '*.json') asOrderedCollection
							collect: [ :each | 
								GtApLexiconFileModel new
									lexiconDirectory: self;
									filename: each;
									yourself ] ] ]
]

{ #category : #'as yet unclassified' }
GtApLexiconDirectoryModel >> gtCoderFor: aView [
	<gtView>
	^ aView explicit
		title: 'Coder';
		stencil: [ GtApLexiconCoder new object: self ]
]

{ #category : #accessing }
GtApLexiconDirectoryModel >> gtDefaultInspectorTool [
	^ GtPhlowCompositeTool new
		addTool: (GtPhlowValuableTool new
				name: self gtDisplayString;
				valuable: [ GtApLexiconCoder new object: self ]);
		addTool: super gtDefaultInspectorTool
]

{ #category : #accessing }
GtApLexiconDirectoryModel >> gtDefinitionSearch: aSearch [
	<gtSearch>
	^ aSearch explicit
		priority: 20;
		title: 'Definitions';
		search: [ :aContext | 
			| results query |
			query := aContext searchQuery.
			results := self files asAsyncStream
					select: [ :each | 
						each id notNil
							and: [ (each id
									findString: query
									startingAt: 1
									caseSensitive: false) > 0 ] ].
			results
				merge: (self files asAsyncStream
						collect: [ :file | 
							file definitions asOrderedCollection asAsyncStream
								select: [ :each | 
									each id notNil
										and: [ (each id
												findString: query
												startingAt: 1
												caseSensitive: false) > 0 ] ] ]) flatten ];
		yourself
]

{ #category : #'as yet unclassified' }
GtApLexiconDirectoryModel >> gtDisplayOn: stream [
	stream
		nextPutAll: 'Lexicons in ';
		nextPutAll: self directory gtDisplayString
]

{ #category : #accessing }
GtApLexiconDirectoryModel >> gtFileSearch: aSearch [
	<gtSearch>
	^ aSearch list
		priority: 10;
		title: 'Files';
		items: [ self files ];
		itemName: [ :item | item filename basename ];
		filterBySubstring
]

{ #category : #accessing }
GtApLexiconDirectoryModel >> isLexiconDirectory [
	^ true
]

{ #category : #accessing }
GtApLexiconDirectoryModel >> lexiconDirectory [
	^ self
]

{ #category : #accessing }
GtApLexiconDirectoryModel >> lexiconFileFor: aFileReference [
	^ self files detect: [ :each | each filename = aFileReference ] ifNone: [  ]
]

{ #category : #accessing }
GtApLexiconDirectoryModel >> lexicons [
	^ lexicons
		ifNil: [ directory
				ifNotNil: [ lexicons := GtApLexiconImporter new importLexiconsFromDirectory: directory ] ]
]

{ #category : #accessing }
GtApLexiconDirectoryModel >> startFileWatcher [
	self stopFileWatcher.
	fileWatcher := GtFileWatcherEventLoop new.
	fileWatcher watch: directory.
	fileWatcher onEvent: [ :anEvent | self updateFileEvent: anEvent ].
	fileWatcher startLoop
]

{ #category : #accessing }
GtApLexiconDirectoryModel >> stopFileWatcher [
	fileWatcher ifNotNil: [ fileWatcher stopLoop ].
	fileWatcher := nil
]

{ #category : #events }
GtApLexiconDirectoryModel >> updateFileEvent: anEvent [
	anEvent paths
		do: [ :each | 
			| ref |
			ref := each asFileReference.
			ref extension = 'json'
				ifTrue: [ ref exists
						ifTrue: [ ref isFile ifTrue: [ self fileUpdated: ref ] ]
						ifFalse: [ self fileDeleted: ref ] ] ]
]
