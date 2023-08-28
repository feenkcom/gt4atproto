Class {
	#name : #LeApLoginSnippet,
	#superclass : #LeSnippet,
	#instVars : [
		'jenkinsUrl'
	],
	#category : #'Gt4AtProto-Lepiter-Model'
}

{ #category : #'api - accessing menu' }
LeApLoginSnippet class >> contextMenuItemSpecification [
	<leSnippetSpecification>
	^ LeContextMenuItemSpecification new
		snippetClass: self;
		title: 'AT Protocol login'
]

{ #category : #accessing }
LeApLoginSnippet class >> empty [ 
	^ self new
]

{ #category : #accessing }
LeApLoginSnippet class >> leJsonV3AttributeMapping [
	^ super leJsonV3AttributeMapping
		yourself 
]

{ #category : #accessing }
LeApLoginSnippet class >> leJsonV3Name [
	^ 'atprotoLoginSnippet'
]

{ #category : #accessing }
LeApLoginSnippet class >> leJsonV4AttributeMapping [
	^ super leJsonV4AttributeMapping
		yourself 
]

{ #category : #accessing }
LeApLoginSnippet class >> leJsonV4Name [
	^ 'atprotoLoginSnippet'
]

{ #category : #accessing }
LeApLoginSnippet >> asSnippetViewModel [
	<return: #LeSnippetViewModel>
	^ LeApLoginSnippetViewModel new apSnippetModel: self
]

{ #category : #accessing }
LeApLoginSnippet >> contentAsString [
	<return: #String>
	^ String streamContents: [ :aStream | ]
]
