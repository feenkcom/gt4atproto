Class {
	#name : #GtApLexiconDirectoryModel,
	#superclass : #GtApLexiconModel,
	#instVars : [
		'directory',
		'lexicons',
		'files'
	],
	#category : #'Gt4AtProto-Editor-Model'
}

{ #category : #accessing }
GtApLexiconDirectoryModel >> directory [
	^ directory
]

{ #category : #accessing }
GtApLexiconDirectoryModel >> directory: aFileReference [
	directory := aFileReference asFileReference.
	lexicons := nil.
	files := nil
]

{ #category : #accessing }
GtApLexiconDirectoryModel >> fileFor: aFileReference [
	^ files detect: [ :each | each filename = aFileReference ] ifNone: [  ]
]

{ #category : #accessing }
GtApLexiconDirectoryModel >> files [
	^ files
		ifNil: [ directory
				ifNotNil: [ files := (directory allChildrenMatching: '*.json')
							collect: [ :each | 
								GtApLexiconFileModel new
									lexiconDirectory: self;
									filename: each;
									yourself ] ] ]
]

{ #category : #accessing }
GtApLexiconDirectoryModel >> gtDefaultInspectorTool [
	^ GtPhlowValuableTool new
		name: self gtDisplayString;
		valuable: [ GtApLexiconCoder new object: self ]
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
